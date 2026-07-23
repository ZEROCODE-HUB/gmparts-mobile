// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

/// 📦 Actualiza el stock de una lista de artículos.
/// Si [esSuma] es true → suma al stock.
/// Si [esSuma] es false → resta del stock.
/// Devuelve TRUE si todos los artículos se procesaron correctamente.
Future<bool> actualizarStockSoloNuevosAlmacen(
  List<FacturasArticulosStruct>? listaArticulos,
  bool esSuma,
) async {
  final firestore = FirebaseFirestore.instance;

  try {
    if (listaArticulos == null || listaArticulos.isEmpty) {
      print('⚠️ No se recibieron artículos para actualizar.');
      return false;
    }

    for (final articulo in listaArticulos) {
      final ref = articulo.referenceCode;
      final cantidad = articulo.cantidad ?? 0;
      final descripcion = articulo.descripcion ?? 'Sin descripción';

      if (ref == null || ref.id == null) {
        print('❌ "$descripcion" sin referencia válida.');
        return false;
      }

      if (cantidad <= 0) {
        print('⚠️ "$descripcion" con cantidad inválida ($cantidad).');
        return false;
      }

      final docRef = firestore.collection('Articles').doc(ref.id);
      final snapshot = await docRef.get();

      if (!snapshot.exists) {
        print('❌ El artículo ${ref.id} "$descripcion" no existe.');
        return false;
      }

      final data = snapshot.data() as Map<String, dynamic>? ?? {};
      final dynamic rawStock = data['Stock'] ?? data['stock'] ?? 0;

      // 🔹 Convertir a entero de forma segura
      int stockActual;
      if (rawStock is int) {
        stockActual = rawStock;
      } else if (rawStock is double) {
        stockActual = rawStock.toInt();
      } else if (rawStock is String) {
        stockActual = int.tryParse(rawStock) ?? 0;
      } else {
        stockActual = 0;
      }

      // 🔹 Calcular nuevo stock
      final cambio = esSuma ? cantidad : -cantidad;
      final nuevoStock = stockActual + cambio;

      // 🔹 Validar que nunca baje de 0
      if (!esSuma && nuevoStock < 0) {
        print(
          '⚠️ Stock insuficiente para "$descripcion". '
          'Actual: $stockActual, se intentó restar: $cantidad',
        );
        return false;
      }

      // 🔹 Actualizar Firestore
      await docRef.update({'Stock': nuevoStock});

      print(
        '✅ "$descripcion" actualizado: antes=$stockActual → ahora=$nuevoStock',
      );
    }

    print('✅ Todos los artículos se actualizaron correctamente.');
    return true;
  } catch (e) {
    print('💥 Error general al actualizar el stock: $e');
    return false;
  }
}
