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

/// Devuelve el siguiente codigo de documento de recepcion: «CT001-0000227».
///
/// Un unico contador para las dos aplicaciones. Antes habia DOS, en el mismo documento
/// `LastCode/codeCT`:
///
///   - el panel avanzaba el campo `numero` (firestoreStock.js, `siguienteCodeCT`)
///   - la app movil avanzaba el campo `lastCode`
///
/// Cada uno ignoraba al otro, asi que en cuanto se abriera una orden desde cada lado los
/// dos entregaban el mismo codigo. Ahora la fuente es `numero` —que es lo que el panel ya
/// incrementa de forma atomica— y `lastCode` se escribe tambien, en la misma transaccion,
/// para que quien lo lea vea siempre lo mismo.
///
/// Va en una transaccion a proposito. El codigo anterior leia, sumaba uno y escribia en
/// tres pasos sueltos: dos asesores recepcionando a la vez se llevaban el mismo numero.
Future<String> siguienteCodeCT() async {
  final ref = FirebaseFirestore.instance.collection('LastCode').doc('codeCT');

  final numero = await FirebaseFirestore.instance.runTransaction<int>((tx) async {
    final snap = await tx.get(ref);
    final actual = (snap.data()?['numero'] as num?)?.toInt() ?? 0;
    final siguiente = actual + 1;
    tx.set(
      ref,
      {
        'numero': siguiente,
        'serie': 'CT001',
        // Lo sigue leyendo el esquema de la app (last_code_record.dart). Se escribe aqui
        // para que no se quede atras cuando el codigo lo emita el panel.
        'lastCode': 'CT001-${siguiente.toString().padLeft(7, '0')}',
        'updatedAt': DateTime.now().toIso8601String(),
      },
      SetOptions(merge: true),
    );
    return siguiente;
  });

  return 'CT001-${numero.toString().padLeft(7, '0')}';
}
