import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Servicio de push notifications (FCM).
///
/// - Registra el token FCM del dispositivo en `users/{uid}.fcm_tokens`.
/// - Escucha mensajes en foreground, abierto por tap y token renovado.
///
/// El envío lo realiza el servidor (Cloud Function `onRecepcionPush`).
class PushNotifications {
  PushNotifications._();

  static final PushNotifications instance = PushNotifications._();

  // Lazy: en web FirebaseMessaging.instance requiere service worker, por eso
  // solo se toca dentro de init()/registerToken(), que guardar cuando kIsWeb.
  FirebaseMessaging get _messaging => FirebaseMessaging.instance;

  /// Invocado con el payload (`data`) al abrir la app desde una notificación.
  void Function(Map<String, dynamic> data)? onOpenNotification;

  /// Invocado cuando se recibe un mensaje con la app en primer plano.
  void Function(String title, String body)? onForegroundMessage;

  final List<Map<String, dynamic>> _pendingOpens = [];

  /// Configura los listeners de FCM. Debe llamarse una sola vez tras initFirebase,
  /// y solo en dispositivos nativos (no web).
  Future<void> init({
    void Function(String title, String body)? onForeground,
  }) async {
    if (kIsWeb) {
      return;
    }

    onForegroundMessage = onForeground;

    await _messaging.requestPermission();

    await _getCurrentToken(null);

    _messaging.onTokenRefresh.listen((String token) {
      _saveToken(token);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final n = message.notification;
      final title = n?.title ?? message.data['title'] ?? '';
      final body = n?.body ?? message.data['body'] ?? '';
      onForegroundMessage?.call(title, body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _handleOpen(message.data);
    });

    final RemoteMessage? initial = await _messaging.getInitialMessage();
    if (initial != null) {
      _handleOpen(initial.data);
    }
  }

  /// Define el callback de navegación al tocar una notificación.
  /// Reproduce los tap-pendent almacenados si llegaron antes del callback.
  void setOpenHandler(void Function(Map<String, dynamic> data)? handler) {
    onOpenNotification = handler;
    if (handler != null) {
      for (final data in _pendingOpens) {
        handler(data);
      }
      _pendingOpens.clear();
    }
  }

  /// Registra el token del usuario actual (o del uid dado). Idempotente.
  Future<void> registerToken([String? uidOverride]) async {
    if (kIsWeb) {
      return;
    }
    await _getCurrentToken(uidOverride);
  }

  void _handleOpen(Map<String, dynamic> data) {
    if (onOpenNotification == null) {
      _pendingOpens.add(data);
      return;
    }
    onOpenNotification?.call(data);
  }

  Future<void> _getCurrentToken([String? uidOverride]) async {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.iOS) {
      await _waitForApnsToken(uidOverride);
    }

    String? token;
    for (int attempt = 0; attempt < 5; attempt++) {
      try {
        token = await _messaging.getToken();
        if (token != null && token.isNotEmpty) {
          break;
        }
      } catch (_) {
        // Reintenta: el APNs token puede tardar unos instantes en llegar.
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }

    if (token == null || token.isEmpty) {
      return;
    }
    final String? uid = uidOverride ?? FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return;
    }
    await _saveTokenForUid(uid, token);
  }

  Future<void> _waitForApnsToken(String? uid) async {
    for (int attempt = 0; attempt < 10; attempt++) {
      try {
        final apns = await _messaging.getAPNSToken();
        if (apns != null && apns.isNotEmpty) {
          return;
        }
      } catch (_) {
        // getAPNSToken es iOS-only; ignorar en otras plataformas.
      }
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  Future<void> _saveToken(String token) async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return;
    }
    await _saveTokenForUid(uid, token);
  }

  Future<void> _saveTokenForUid(String uid, String token) async {
    final users = FirebaseFirestore.instance.collection('users');
    try {
      final match = await users.where('auth_uid', isEqualTo: uid).limit(1).get();
      final DocumentReference docRef =
          match.docs.isNotEmpty ? match.docs.first.reference : users.doc(uid);
      await docRef.update({'fcm_tokens': FieldValue.arrayUnion([token])});
    } catch (_) {
      try {
        await users.doc(uid).set({'fcm_tokens': FieldValue.arrayUnion([token])});
      } catch (_) {
        // El documento puede no existir aún; se reintenta en el siguiente login.
      }
    }
  }
}