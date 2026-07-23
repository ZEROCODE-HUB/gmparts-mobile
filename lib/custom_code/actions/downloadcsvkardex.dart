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

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future downloadcsvkardex(List<KardexElementRecord>? kardexelement) async {
  // Add your function code here!
  kardexelement = kardexelement ?? [];

  String fileContent =
      "Codigo;Descripcion;OEM;Documento;Numero;Tipo de Documento;Fecha;Cliente;Proveedor;Cantidad;Costo";

  kardexelement.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.codeId.toString() +
      ";" +
      record.description.toString() +
      ";" +
      record.oem.toString() +
      ";" +
      record.documentType.toString() +
      ";" +
      record.documentNumber.toString() +
      ";" +
      record.type.toString() +
      ";" +
      record.datestring.toString() +
      ";" +
      record.client.toString() +
      ";" +
      record.provider.toString() +
      ";" +
      record.quantity.toString() +
      ";" +
      record.totalPrice.toString());

  final fileName = "kardex_export" + DateTime.now().toString() + ".csv";
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
