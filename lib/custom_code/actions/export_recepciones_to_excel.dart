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

// lib/custom_code/actions/export_recepciones_to_excel.dart

// FlutterFlow pre-imports:
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';

import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cross_file/cross_file.dart';

/// Genera un archivo Excel con las recepciones y,
/// si se ejecuta en Web, lo sube a Firebase Storage y abre el enlace,
/// si en móvil/desktop, lo guarda localmente y comparte.
Future<String?> exportRecepcionesToExcel(
    List<RecepcionesRecord> docRecepciones) async {
  /*// 1️⃣ Crear Excel y hoja "Recepciones"
  final excel = Excel.createExcel();
  final sheet = excel['Recepciones'];

  // 2️⃣ Definir y agregar encabezados
  final headers = [
    'numeroorden',
    'tipo_persona',
    'nombre_cliente',
    'telefono',
    'placa',
    'marca',
    'modelo',
    'km_ingreso',
    'tecnico_servicio',
    'tipo_servicio',
    'motivo_ingreso',
    'DNI',
    'Razon_social',
    'Nombre_encargado',
    'Correo_electronico',
    'Numero_VIN',
    'Ano_fabricacion',
    'Nivel_combustible',
    'Observaciones_adicionales',
    'status',
    'aprobacion_cliente',
    'fecha_creacion',
    'Subtotal',
    'Total',
    'IGV'
  ];
  sheet.appendRow(headers);

  // 3️⃣ Agregar filas con formato de fecha
  final dateFmt = DateFormat('dd/MM/yyyy HH:mm');
  for (var r in docRecepciones) {
    sheet.appendRow([
      r.numeroorden ?? '',
      r.tipoPersona ?? '',
      r.nombreCliente ?? '',
      r.telefono ?? '',
      r.placa ?? '',
      r.marca ?? '',
      r.modelo ?? '',
      r.kmIngreso ?? '',
      r.tecnicoServicio ?? '',
      r.tipoServicio ?? '',
      r.motivoIngreso ?? '',
      r.dni ?? '',
      r.razonSocial ?? '',
      r.nombreEncargado ?? '',
      r.correoElectronico ?? '',
      r.numeroVIN ?? '',
      r.anoFabricacion ?? '',
      r.nivelCombustible ?? '',
      r.observacionesAdicionales ?? '',
      r.status ?? '',
      r.aprobacionCliente == true ? 'Aprobado' : 'Pendiente',
      r.fechaCreacion != null ? dateFmt.format(r.fechaCreacion!) : '',
      r.subtotal?.toStringAsFixed(2) ?? '0.00',
      r.total?.toStringAsFixed(2) ?? '0.00',
      r.igv?.toStringAsFixed(2) ?? '0.00',
    ]);
  }

  // 4️⃣ Codificar a bytes
  final bytes = Uint8List.fromList(excel.encode()!);

  if (kIsWeb) {
    // 🌐 Web: subir y abrir enlace de descarga
    final ref = FirebaseStorage.instance.ref().child('recepciones.xlsx');
    await ref.putData(bytes);
    final downloadUrl = await ref.getDownloadURL();

    // Abrir en nueva pestaña/ventana
    final uri = Uri.parse(downloadUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
    return downloadUrl;
  } else {
    // 📱 Móvil/desktop: guardar y compartir
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/recepciones.xlsx';

    final xfile = XFile.fromData(
      bytes,
      name: 'recepciones.xlsx',
      mimeType:
          'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
    );
    await xfile.saveTo(path);
    await Share.shareFiles([path], text: 'Archivo Excel de recepciones');
    return path;
  }*/
}
