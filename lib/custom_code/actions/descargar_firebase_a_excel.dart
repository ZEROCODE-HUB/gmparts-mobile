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
import 'package:excel/excel.dart';
import 'dart:typed_data';
import 'package:share_plus/share_plus.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
// ignore: uri_does_not_exist
import 'dart:html' as html show AnchorElement, Url, Blob
    if (dart.library.io) 'dart:io';

Future<void> descargarFirebaseAExcel(String nombreColeccion) async {
  try {
    // Crear un nuevo archivo Excel
    var excel = Excel.createExcel();

    // Obtener la hoja por defecto y renombrarla
    Sheet sheetObject = excel['Sheet1'];
    excel.rename('Sheet1', nombreColeccion);
    sheetObject = excel[nombreColeccion];

    // Obtener todos los documentos de la colección
    final querySnapshot =
        await FirebaseFirestore.instance.collection(nombreColeccion).get();

    if (querySnapshot.docs.isEmpty) {
      print('No hay documentos en la colección: $nombreColeccion');
      return;
    }

    // Recolectar todas las claves únicas de todos los documentos
    Set<String> todasLasClaves = {};
    for (var doc in querySnapshot.docs) {
      todasLasClaves.addAll(doc.data().keys);
    }

    // Agregar el ID del documento como primera columna
    List<String> headers = ['ID', ...todasLasClaves.toList()];

    // Escribir los encabezados en la primera fila
    for (int i = 0; i < headers.length; i++) {
      var cell = sheetObject.cell(
        CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0),
      );
      cell.value = TextCellValue(headers[i]);

      // Aplicar estilo a los encabezados
      cell.cellStyle = CellStyle(
        bold: true,
        backgroundColorHex: ExcelColor.fromHexString('#D3D3D3'),
      );
    }

    // Escribir los datos de cada documento
    int rowIndex = 1;
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data();

      // Escribir el ID del documento
      var cellId = sheetObject.cell(
        CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: rowIndex),
      );
      cellId.value = TextCellValue(doc.id);

      // Escribir los datos de cada campo
      for (int colIndex = 1; colIndex < headers.length; colIndex++) {
        String key = headers[colIndex];
        var cell = sheetObject.cell(
          CellIndex.indexByColumnRow(columnIndex: colIndex, rowIndex: rowIndex),
        );

        // Convertir el valor a un formato apropiado
        var valor = data[key];

        if (valor == null) {
          cell.value = TextCellValue('');
        } else if (valor is Timestamp) {
          // Convertir Timestamp a String legible
          DateTime dateTime = valor.toDate();
          String fechaFormato =
              '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
          cell.value = TextCellValue(fechaFormato);
        } else if (valor is int) {
          cell.value = IntCellValue(valor);
        } else if (valor is double) {
          cell.value = DoubleCellValue(valor);
        } else if (valor is num) {
          cell.value = DoubleCellValue(valor.toDouble());
        } else if (valor is bool) {
          cell.value = BoolCellValue(valor);
        } else if (valor is List) {
          // Listas - convertir a String
          cell.value = TextCellValue(valor.join(', '));
        } else if (valor is Map) {
          // Mapas - convertir a String JSON
          cell.value = TextCellValue(valor.toString());
        } else {
          // Texto y otros
          cell.value = TextCellValue(valor.toString());
        }
      }
      rowIndex++;
    }

    // Codificar el archivo Excel
    var fileBytes = excel.encode();

    if (fileBytes == null) {
      print('Error al generar el archivo Excel');
      return;
    }

    final Uint8List bytes = Uint8List.fromList(fileBytes);
    final String fileName =
        '${nombreColeccion}_${DateTime.now().millisecondsSinceEpoch}.xlsx';

    // Detectar si es Web o Móvil
    if (kIsWeb) {
      // ═══════════════════════════════════════
      // DESCARGA EN WEB (PC/Navegador)
      // ═══════════════════════════════════════
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..click();
      html.Url.revokeObjectUrl(url);

      print('Archivo Excel descargado en Web: $fileName');
    } else {
      // ═══════════════════════════════════════
      // DESCARGA EN MÓVIL (Android/iOS)
      // ═══════════════════════════════════════
      // Obtener el directorio temporal
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/$fileName';

      // Escribir el archivo
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // Compartir el archivo (esto abrirá el diálogo de compartir/guardar)
      await Share.shareXFiles(
        [XFile(filePath)],
        text: 'Exportación de $nombreColeccion',
      );

      print('Archivo Excel compartido en Móvil: $fileName');
    }
  } catch (e) {
    print('Error al descargar Excel: $e');
  }
}
