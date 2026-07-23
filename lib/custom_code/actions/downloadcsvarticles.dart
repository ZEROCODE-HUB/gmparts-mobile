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

Future downloadcsvarticles(List<ArticlesRecord>? articleselement) async {
  // Add your function code here!
  articleselement = articleselement ?? [];

  String fileContent =
      "Codigo;Descripcion;OEM;Marca;Grupo;Categoría;Unidad;Precio de compra;Precio final;Stock";

  articleselement.asMap().forEach((index, record) => fileContent = fileContent +
      "\n" +
      record.codigo.toString() +
      ";" +
      record.nombreName.toString() +
      ";" +
      record.oem.toString() +
      ";" +
      record.marcaBrand.toString() +
      ";" +
      record.groupGrupo.toString() +
      ";" +
      record.subgroupSubgrupo.toString() +
      ";" +
      record.unidadDeMedidaMeasurementUnit.toString() +
      ";" +
      record.precioCompraPurchasePrice.toString() +
      ";" +
      record.precioVentaSalePrice.toString() +
      ";" +
      record.stock.toString());

  final fileName = "articles_export" + DateTime.now().toString() + ".csv";
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
