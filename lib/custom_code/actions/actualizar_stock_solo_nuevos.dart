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

Future<String> actualizarStockSoloNuevos(
  List<FacturasArticulosStruct>? listaNueva,
  bool esDescuento,
) async {
  try {
    if (listaNueva == null || listaNueva.isEmpty) {
      return '⚠️ No se recibieron artículos para actualizar.';
    }

    int procesados = 0;
    int exitosos = 0;
    int fallidos = 0;
    final detalles = <String>[];

    for (final articulo in listaNueva) {
      procesados++;

      final ref = articulo.referenceCode;
      final cantidad = articulo.cantidad ?? 0;
      final descripcion = articulo.descripcion ?? 'Sin descripción';

      if (ref == null || ref.id == null) {
        detalles.add(
            '❌ Artículo $procesados "$descripcion" sin referencia válida.');
        fallidos++;
        continue;
      }

      if (cantidad <= 0) {
        detalles.add(
            '⚠️ Artículo ${ref.id} "$descripcion" con cantidad inválida ($cantidad).');
        fallidos++;
        continue;
      }

      final cambio = esDescuento ? -cantidad : cantidad;
      final res = await _actualizarStock(ref.id, cambio, descripcion);

      if (res.success) {
        detalles.add('✅ Éxito'); // ✅ solo dice "Éxito"
        exitosos++;
      } else {
        detalles.add('❌ ${res.message}');
        fallidos++;
      }
    }

    final accion = esDescuento ? 'descuento' : 'aumento';
    return '''
🔎 Resultado de actualización de stock:
- Total recibidos: $procesados
- Exitosos: $exitosos
- Fallidos: $fallidos
- Tipo de operación: $accion

Detalles:
${detalles.join("\n")}
''';
  } catch (e) {
    return '💥 Error general al actualizar el stock: $e';
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
      return StockResult(false,
          'El artículo $docId "$descripcion" no existe en la base de datos.');
    }

    final data = snapshot.data() as Map<String, dynamic>;
    final stockActual = (data['Stock'] ?? 0) as int;
    final nuevoStock = (stockActual + cambio).clamp(0, double.infinity).toInt();

    await docRef.update({'Stock': nuevoStock});

    // ✅ Mensaje interno reducido, pero aún útil para debugging si lo quieres ver en consola
    final operacion = cambio < 0 ? 'restado' : 'sumado';
    print(
        '✅ "$descripcion" stock $operacion $cambio (antes: $stockActual → ahora: $nuevoStock)');
    return StockResult(true, 'Éxito');
  } catch (e) {
    return StockResult(
        false, 'Error al actualizar stock para $docId "$descripcion": $e');
  }
}
