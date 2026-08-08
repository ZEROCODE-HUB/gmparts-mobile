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

  /// Invocado con la telemetría del registro FCM, para depuración en pantalla.
  void Function(String message)? onDiagMessage;

  final List<Map<String, dynamic>> _pendingOpens = [];

  /// Configura los listeners de FCM. Debe llamarse una sola vez tras initFirebase,
  /// y solo en dispositivos nativos (no web).
  Future<void> init({
    void Function(String title, String body)? onForeground,
    void Function(String message)? onDiag,
  }) async {
    if (kIsWeb) {
      return;
    }

    onForegroundMessage = onForeground;
    onDiagMessage = onDiag;

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
    final String? token;
    try {
      token = await _messaging.getToken();
    } catch (e) {
      await _logDiag(uidOverride, 'getToken_error', '$e');
      return;
    }
    if (token == null || token.isEmpty) {
      await _logDiag(uidOverride, 'getToken_vacio', 'token nulo o vacío');
      return;
    }
    final String? uid = uidOverride ?? FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      await _logDiag(uidOverride, 'uid_nulo', 'currentUser sin uid');
      return;
    }
    await _logDiag(uid, 'token_obtenido', token);
    await _saveTokenForUid(uid, token);
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
      await _logDiag(uid, 'token_guardado', 'ok en ${docRef.path}');
    } catch (e) {
      await _logDiag(uid, 'token_save_error', '$e');
      try {
        await users.doc(uid).set({'fcm_tokens': FieldValue.arrayUnion([token])});
        await _logDiag(uid, 'token_guardado_fallback', 'ok en users/${uid}');
      } catch (e2) {
        await _logDiag(uid, 'token_save_fallback_error', '$e2');
      }
    }
  }

  Future<void> _logDiag(String? uid, String key, String value) async {
    onDiagMessage?.call('[$key] $value');
    try {
      final docId = uid ?? 'anonimo';
      await FirebaseFirestore.instance
          .collection('fcm_diag')
          .doc(docId)
          .set({key: value}, SetOptions(merge: true));
    } catch (_) {
      // La telemetría no debe romper el flujo.
    }
  }
}