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

Future<String> actualizarStockDesdeListasVentas(
  List<FacturasArticulosStruct> listaAntigua,
  List<FacturasArticulosStruct> listaNueva,
) async {
  try {
    if (listaAntigua == null || listaNueva == null) {
      return 'Error: Alguna de las listas es nula.';
    }

    // Verificación de referencias (opcional)
    for (int i = 0; i < listaNueva.length; i++) {
      if (identical(listaNueva[i], listaAntigua[i])) {
        return 'DEBUG: Elemento $i es la misma referencia en ambas listas - PROBLEMA DETECTADO';
      }
    }

    if (listaAntigua.isEmpty && listaNueva.isEmpty) {
      return 'Sin cambios: ambas listas están vacías.';
    }

    final antiguaMap = <String, FacturasArticulosStruct>{};
    final nuevaMap = <String, FacturasArticulosStruct>{};

    // Crear mapas con validación adicional
    for (final articulo in listaAntigua) {
      final ref = articulo.referenceCode;
      if (ref != null && ref.id != null) {
        antiguaMap[ref.id] = articulo;
      }
    }

    for (final articulo in listaNueva) {
      final ref = articulo.referenceCode;
      if (ref != null && ref.id != null) {
        nuevaMap[ref.id] = articulo;
      }
    }

    if (antiguaMap.isEmpty && nuevaMap.isEmpty) {
      return 'Sin referencias válidas en las listas.';
    }

    int eliminados = 0;
    int nuevos = 0;
    int modificados = 0;

    // Productos eliminados de la venta → reponer stock
    for (final id in antiguaMap.keys) {
      if (!nuevaMap.containsKey(id)) {
        final eliminado = antiguaMap[id]!;
        final cantidad = eliminado.cantidad ?? 0;
        final res = await _actualizarStock(id, cantidad); // Reponer
        if (!res.success) return res.message;
        eliminados++;
      }
    }

    // Nuevos o modificados
    for (final id in nuevaMap.keys) {
      final nuevo = nuevaMap[id]!;
      final nuevaCantidad = nuevo.cantidad ?? 0;

      if (antiguaMap.containsKey(id)) {
        final viejo = antiguaMap[id]!;
        final viejaCantidad = viejo.cantidad ?? 0;

        if (nuevaCantidad != viejaCantidad) {
          final diferencia = nuevaCantidad - viejaCantidad;
          final cambio = -diferencia; // Descontar si aumentó, reponer si bajó
          final res = await _actualizarStock(id, cambio);
          if (!res.success) return res.message;
          modificados++;
        }
      } else {
        // Producto nuevo en venta → descontar del stock
        final res = await _actualizarStock(id, -nuevaCantidad);
        if (!res.success) return res.message;
        nuevos++;
      }
    }

    return 'Stock actualizado: $nuevos nuevos, $modificados modificados, $eliminados eliminados.';
  } catch (e) {
    return 'Error general al actualizar el stock: $e';
  }
}

class StockResult {
  final bool success;
  final String message;

  StockResult(this.success, this.message);
}

Future<StockResult> _actualizarStock(String docId, int cambio) async {
  try {
    final docRef = FirebaseFirestore.instance.collection('Articles').doc(docId);
    final snapshot = await docRef.get();

    if (!snapshot.exists) {
      return StockResult(false, 'El artículo con ID $docId no existe.');
    }

    final data = snapshot.data() as Map<String, dynamic>;
    final stockActual = (data['Stock'] ?? 0) as int;
    final nuevoStock = (stockActual + cambio).clamp(0, double.infinity).toInt();

    await docRef.update({'Stock': nuevoStock});
    return StockResult(
        true, 'Stock actualizado para $docId: $stockActual -> $nuevoStock');
  } catch (e) {
    return StockResult(false, 'Error al actualizar stock para $docId: $e');
  }
}
