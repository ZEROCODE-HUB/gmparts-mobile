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

Future<bool> actualizarStockSoloNuevosCopy(
  List<FacturasArticulosStruct>? listaNueva,
  bool esDescuento,
) async {
  try {
    if (listaNueva == null || listaNueva.isEmpty) {
      return false;
    }

    for (final articulo in listaNueva) {
      final ref = articulo.referenceCode;
      final cantidad = articulo.cantidad ?? 0;

      if (ref == null || ref.id == null) {
        return false;
      }

      if (cantidad <= 0) {
        return false;
      }

      final cambio = esDescuento ? -cantidad : cantidad;
      final res = await _actualizarStock(
          ref.id, cambio, articulo.descripcion ?? 'Sin descripción');

      if (!res.success) {
        return false;
      }
    }

    return true;
  } catch (e) {
    return false;
  }
}

class StockResult {
  final bool success;
  final String message;

  StockResult(this.success, this.message);
}

Future<StockResult> _actualizarStock(
    String docId, int cambio, String descripcion) async {
  try {
    final docRef = FirebaseFirestore.instance.collection('Articles').doc(docId);
    final snapshot = await docRef.get();

    if (!snapshot.exists) {
      return StockResult(false, 'El artículo no existe en la base de datos.');
    }

    final data = snapshot.data() as Map<String, dynamic>;
    final stockActual = (data['Stock'] ?? 0) as int;
    final nuevoStock = (stockActual + cambio).clamp(0, double.infinity).toInt();

    await docRef.update({'Stock': nuevoStock});

    return StockResult(true, 'Éxito');
  } catch (e) {
    return StockResult(false, 'Error al actualizar stock');
  }
}
