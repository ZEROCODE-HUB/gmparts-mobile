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

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> generarCotizacionPDF(
  DocumentReference recepcionRef, // Document reference de la tabla recepciones
  String razonSocial,
  String? ruc, // Opcional
  String personaContacto, // Persona de contacto
  String telefonoPersonaContacto, // Teléfono de la persona de contacto
  String contactoComercial, // Contacto comercial (diferente a persona contacto)
  String telefonoContactoComercial, // Teléfono del contacto comercial
  String email,
  String placa,
  String marca,
  String modelo,
  String color,
  String combustible,
  String kilometraje,
  String anioFabricacion,
  String formaPago,
  String moneda,
  String lugarServicio,
  String plazoEntrega,
  String validezOferta,
  String fechaServicio,
  String tipoServicio,
  String servicio,
  String numeroCotizacion,
  String? referencia, // Opcional
  double subTotal,
  double igv,
  double total,
  String logoUrl,
  String totaltext,
  String numeroOrden,
  bool natural, // Indica si es persona natural (true) o jurídica (false)
) async {
  final pdf = pw.Document();

  // Obtener la imagen del logo y validar la respuesta HTTP
  final response = await http.get(Uri.parse(logoUrl));
  if (response.statusCode != 200) {
    throw Exception('Error al cargar la imagen del logo.');
  }
  final logoImage = pw.MemoryImage(response.bodyBytes);

  // Calcular detracción si el total supera los 700 soles
  double? detraccion;
  double? montoNetoPendiente;
  if (total > 700) {
    detraccion = total * 0.12;
    montoNetoPendiente = total - detraccion;
  }

// Calcular fecha de vencimiento (mismo día del próximo mes)
  String fechaVencimientoStr = 'NO DEFINIDA';

  try {
    // Parsear fechaServicio (ej: "09/12/2024" o "2024-12-09")
    DateTime fechaServicioDT;

    if (fechaServicio.contains('/')) {
      // Formato "DD/MM/YYYY"
      List<String> partes = fechaServicio.split('/');
      if (partes.length == 3) {
        fechaServicioDT = DateTime(
          int.parse(partes[2]), // año
          int.parse(partes[1]), // mes
          int.parse(partes[0]), // día
        );
      } else {
        fechaServicioDT = DateTime.now();
      }
    } else {
      // Formato "YYYY-MM-DD"
      fechaServicioDT = DateTime.parse(fechaServicio);
    }

    // Calcular vencimiento: mismo día del próximo mes
    DateTime fechaVencimientoDT = DateTime(
      fechaServicioDT.year,
      fechaServicioDT.month + 1, // Sumar 1 mes
      fechaServicioDT.day, // Mismo día
    );

    // Formatear a DD/MM/YYYY
    fechaVencimientoStr =
        '${fechaVencimientoDT.day.toString().padLeft(2, '0')}/' +
            '${fechaVencimientoDT.month.toString().padLeft(2, '0')}/' +
            fechaVencimientoDT.year.toString();
  } catch (e) {
    // Si hay error, usar fecha de hoy + 30 días
    DateTime fechaHoy = DateTime.now();
    DateTime fechaVencimientoDT = fechaHoy.add(Duration(days: 30));

    fechaVencimientoStr =
        '${fechaVencimientoDT.day.toString().padLeft(2, '0')}/' +
            '${fechaVencimientoDT.month.toString().padLeft(2, '0')}/' +
            fechaVencimientoDT.year.toString();
  }

  // Definir etiquetas según tipo de persona
  String etiquetaIdentificacion = natural ? "DNI" : "RUC";
  String etiquetaNombre = natural ? "NOMBRE COMPLETO" : "RAZÓN SOCIAL";

  // Obtener datos de la recepción desde Firestore
  final recepcionDoc = await recepcionRef.get();
  final recepcionData = recepcionDoc.data() as Map<String, dynamic>?;

  // Usar datos de Firestore como fallback para datos de cliente/vehículo
  final clientName = (razonSocial.isNotEmpty) ? razonSocial : (recepcionData?['Cliente_nombre'] ?? recepcionData?['display_name'] ?? '');
  final clientDoc = (ruc != null && ruc!.isNotEmpty) ? ruc! : (recepcionData?['DNI'] ?? recepcionData?['RUC'] ?? '');
  final clientPhone = (telefonoPersonaContacto.isNotEmpty) ? telefonoPersonaContacto : (recepcionData?['Celular'] ?? recepcionData?['phone_number'] ?? '');
  final clientEmail = (email.isNotEmpty) ? email : (recepcionData?['Correo'] ?? recepcionData?['email'] ?? '');
  final vehiclePlate = (placa.isNotEmpty) ? placa : (recepcionData?['Placa'] ?? '');
  final vehicleBrand = (marca.isNotEmpty) ? marca : (recepcionData?['Marca'] ?? '');
  final vehicleModel = (modelo.isNotEmpty) ? modelo : (recepcionData?['Modelo'] ?? '');
  final vehicleKm = (kilometraje.isNotEmpty) ? kilometraje : (recepcionData?['kmIngreso'] ?? recepcionData?['Kilometraje'] ?? '');
  final vehicleYear = (anioFabricacion.isNotEmpty) ? anioFabricacion : (recepcionData?['anio_de_fabricion'] ?? '');

  // Obtener fotos de la recepción
  final List<String> receptionPhotos = [];
  if (recepcionData?['fotos'] != null) {
    final fotosRaw = recepcionData!['fotos'];
    if (fotosRaw is List) {
      for (var f in fotosRaw) {
        if (f is String) receptionPhotos.add(f);
      }
    }
  }

  // Obtener los diagnósticos de la recepción
  final diagnosticosSnapshot =
      await recepcionRef.collection('diagnosticos').get();

  // Preparar listas para los items de la tabla
  List<Map<String, dynamic>> itemsTabla = [];
  List<Map<String, dynamic>> fotosFallos = [];
  int itemCounter = 1;

// Procesar cada diagnóstico
  for (var diagnosticoDoc in diagnosticosSnapshot.docs) {
    final diagnosticoData = diagnosticoDoc.data();

    // Mano de obra (diagnóstico)
    if (diagnosticoData['Nombre_falla'] != null) {
      num tiempoEstimado = 0;
      num precioservicio = 0;

      // Obtener el tiempo estimado
      if (diagnosticoData['Tiempo_estimado'] != null) {
        var tiempo = diagnosticoData['Tiempo_estimado'];
        if (tiempo is num)
          tiempoEstimado = tiempo;
        else if (tiempo is String) tiempoEstimado = num.tryParse(tiempo.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
      }

      // Obtener el precio del servicio
      if (diagnosticoData['precioservicio'] != null) {
        var precio = diagnosticoData['precioservicio'];
        if (precio is num) {
          precioservicio = precio;
        } else if (precio is String) {
          precioservicio = num.tryParse(precio) ?? 0;
        }
      }

      // Calcular el total
      num totalServicio = precioservicio * tiempoEstimado;

      final fallaName = diagnosticoData['Nombre_falla'] ?? '';
      itemsTabla.add({
        'item': itemCounter++,
        'descripcion': fallaName,
        'unidad': 'HRS',
        'cantidad': tiempoEstimado,
        'precio': precioservicio,
        'total': totalServicio,
      });

      // Colectar fotos de esta falla
      if (diagnosticoData['Fotos'] != null) {
        final fotosRaw = diagnosticoData['Fotos'];
        if (fotosRaw is List) {
          for (var f in fotosRaw) {
            if (f is String) {
              fotosFallos.add({'nombre': fallaName, 'url': f});
            }
          }
        }
      }
    }

    // Repuestos
    if (diagnosticoData['Repuestos'] != null) {
      List<dynamic> repuestos = diagnosticoData['Repuestos'];
      for (var repuesto in repuestos) {
        if (repuesto != null && repuesto is Map) {
          num cantidad = 1;
          num precio = 0;

          if (repuesto['cantidad'] != null) {
            var cant = repuesto['cantidad'];
            if (cant is num)
              cantidad = cant;
            else if (cant is String) cantidad = num.tryParse(cant) ?? 1;
          }

          if (repuesto['precio'] != null) {
            var prec = repuesto['precio'];
            if (prec is num)
              precio = prec;
            else if (prec is String) precio = num.tryParse(prec) ?? 0;
          }

          itemsTabla.add({
            'item': itemCounter++,
            'codigo': repuesto['codigo'] ?? '', // nuevo campo
            'descripcion': repuesto['nombre'] ?? '',
            'unidad': 'UND',
            'cantidad': cantidad,
            'precio': precio, // precio unitario
            'total': cantidad * precio, // cantidad × precio
          });
        }
      }
    }
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (pw.Context context) => [
        // ── ENCABEZADO ──
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo alineado a la izquierda
            pw.Container(
              padding: pw.EdgeInsets.only(right: 10),
              child: pw.Image(logoImage, width: 120, height: 80),
            ),
            // Información de la empresa
            pw.Expanded(
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(
                    "GEAR MOTOR PARTS S.A.C.",
                    style: pw.TextStyle(
                        fontSize: 14, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 3),
                  pw.Text("Dirección fiscal: Av. Nicolás Ayllón Nro. 3270",
                      style: pw.TextStyle(fontSize: 8)),
                  pw.Text("Sucursal: Av. Nicolás Ayllón Nro. 3270",
                      style: pw.TextStyle(fontSize: 8)),
                  pw.Text("Tel.: 01 362 8667 - 924 483 844",
                      style: pw.TextStyle(fontSize: 8)),
                  pw.Text("gearmparts@gmail.com",
                      style: pw.TextStyle(fontSize: 8)),
                ],
              ),
            ),
            // Datos de RUC, Cotización y Fecha
            pw.Container(
              padding: pw.EdgeInsets.all(8),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 1),
              ),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("R.U.C. 20601720621",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 4),
                  pw.Text("Cotizacion $numeroCotizacion",
                      style: pw.TextStyle(
                          fontSize: 12, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 4),
                  pw.Text("FECHA: $fechaServicio",
                      style: pw.TextStyle(
                          fontSize: 10, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 10),

        // ── DATOS DEL CLIENTE Y CONTACTO COMERCIAL ──
        pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(width: 1),
          ),
          padding: pw.EdgeInsets.all(6),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Razón Social o Nombre Completo y Contacto Comercial
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "$etiquetaNombre : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: clientName,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "CONTACTO COMERCIAL : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: contactoComercial,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 2),
              // RUC o DNI (si existe) y Teléfono del contacto comercial
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  if (clientDoc.isNotEmpty)
                    pw.Expanded(
                      flex: 3,
                      child: pw.RichText(
                        text: pw.TextSpan(
                          children: [
                            pw.TextSpan(
                                text: "$etiquetaIdentificacion : ",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 10)),
                            pw.TextSpan(
                                text: clientDoc, style: pw.TextStyle(fontSize: 10)),
                          ],
                        ),
                      ),
                    )
                  else
                    pw.Expanded(flex: 3, child: pw.SizedBox()),
                  pw.Expanded(
                    flex: 2,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "TELÉFONO : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: telefonoContactoComercial,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 2),
              // Persona Contacto y su Teléfono
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "PERSONA CONTACTO : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: personaContacto,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "E-MAIL : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: telefonoPersonaContacto,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 2),
              // E-mail
              pw.RichText(
                text: pw.TextSpan(
                  children: [
                    pw.TextSpan(
                        text: "E-MAIL : ",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10)),
                    pw.TextSpan(
                        text: clientEmail.isNotEmpty ? clientEmail : "",
                        style: pw.TextStyle(fontSize: 10)),
                  ],
                ),
              ),
              pw.SizedBox(height: 2),
              // Referencia (si existe)
              if (referencia != null && referencia.isNotEmpty)
                pw.RichText(
                  text: pw.TextSpan(
                    children: [
                      pw.TextSpan(
                          text: "REFERENCIA : ",
                          style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold, fontSize: 10)),
                      pw.TextSpan(
                          text: referencia, style: pw.TextStyle(fontSize: 10)),
                    ],
                  ),
                ),
            ],
          ),
        ),

        pw.SizedBox(height: 10),

        // ── DATOS DEL VEHÍCULO ──
        pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(width: 1),
          ),
          child: pw.Column(
            children: [
              // Título con fondo gris claro
              pw.Container(
                width: double.infinity,
                color: PdfColors.grey300,
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Text(
                  "DATOS DEL VEHÍCULO",
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                  textAlign: pw.TextAlign.center,
                ),
              ),
              // Datos del vehículo
              pw.Padding(
                padding: pw.EdgeInsets.all(5),
                child: pw.Column(
                  children: [
                    // Placa - Marca - Modelo
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "PLACA : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: vehiclePlate,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "MARCA : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: vehicleBrand,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "MODELO : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: vehicleModel,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 3),
                    // Color - Combustible - Kilometraje
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "COLOR : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: color,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "COMBUSTIBLE : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: combustible,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "KILOMETRAJE : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: vehicleKm,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 3),
                    // Año de fabricación
                    pw.Row(
                      children: [
                        pw.Expanded(
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "AÑO DE FABRICACIÓN : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: vehicleYear,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 10),

        // ── CONDICIONES COMERCIALES ──
        pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(width: 1),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Título de la sección
              pw.Container(
                width: double.infinity,
                color: PdfColors.grey300,
                padding: pw.EdgeInsets.symmetric(vertical: 5),
                child: pw.Center(
                  child: pw.Text(
                    "CONDICIONES COMERCIALES",
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold),
                    textAlign: pw.TextAlign.center,
                  ),
                ),
              ),
              // Datos de condiciones comerciales
              pw.Padding(
                padding: pw.EdgeInsets.all(5),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "FORMA DE PAGO : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: formaPago,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "MONEDA : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: moneda, style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "LUGAR DE SERVICIO : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: lugarServicio,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "PLAZO DE ENTREGA : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: plazoEntrega,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "VALIDEZ DE LA OFERTA : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: validezOferta,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Línea separadora
              pw.Container(
                height: 1,
                color: PdfColors.black,
                width: double.infinity,
              ),
              // Fecha de Servicio, Tipo de Servicio y N° OR
              pw.Padding(
                padding: pw.EdgeInsets.all(5),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.RichText(
                      text: pw.TextSpan(
                        children: [
                          pw.TextSpan(
                              text: "FECHA DE SERVICIO : ",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 10)),
                          pw.TextSpan(
                              text: fechaServicio,
                              style: pw.TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "TIPO DE SERVICIO : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: tipoServicio,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.RichText(
                            textAlign: pw.TextAlign.right,
                            text: pw.TextSpan(
                              children: [
                                pw.TextSpan(
                                    text: "N° OR : ",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 10)),
                                pw.TextSpan(
                                    text: numeroOrden,
                                    style: pw.TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 10),

        // ── DETALLE DE ÍTEMS ──
        pw.Table(
          border: pw.TableBorder.all(width: 1),
          columnWidths: {
            0: pw.FixedColumnWidth(40), // ITEM
            1: pw.FixedColumnWidth(60), // CÓDIGO  <-- nueva columna
            2: pw.FlexColumnWidth(3), // DESCRIPCIÓN
            3: pw.FixedColumnWidth(50), // UNIDAD
            4: pw.FixedColumnWidth(40), // CANTIDAD
            5: pw.FixedColumnWidth(60), // PRECIO
            6: pw.FixedColumnWidth(60), // TOTAL
          },
          children: [
            // Encabezados
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey300),
              children: [
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("ITEM",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("CODIGO",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("DESCRIPCIÓN",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("UNIDAD",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("CANT",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("PRECIO",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
                pw.Padding(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text("TOTAL",
                        style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold, fontSize: 10),
                        textAlign: pw.TextAlign.center)),
              ],
            ),
            // Filas dinámicas desde itemsTabla
            for (var item in itemsTabla)
              pw.TableRow(
                children: [
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text("${item['item']}",
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.center)),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(item['codigo'],
                          style: pw.TextStyle(fontSize: 10))),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(item['descripcion'],
                          style: pw.TextStyle(fontSize: 10))),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(item['unidad'],
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.center)),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text("${item['cantidad']}",
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.center)),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(
                          "S/ ${(item['precio'] as num).toStringAsFixed(2)}",
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right)),
                  pw.Padding(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(
                          "S/ ${(item['total'] as num).toStringAsFixed(2)}",
                          style: pw.TextStyle(fontSize: 10),
                          textAlign: pw.TextAlign.right)),
                ],
              ),
          ],
        ),

        pw.SizedBox(height: 10),

        // ── TOTALES ──
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text("SUB TOTAL       S/ ${subTotal.toStringAsFixed(2)}",
                    style: pw.TextStyle(fontSize: 10)),
                pw.Text("I.G.V. (18%)   S/ ${igv.toStringAsFixed(2)}",
                    style: pw.TextStyle(fontSize: 10)),
                pw.Text("IMP. TOTAL   S/ ${total.toStringAsFixed(2)}",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 10)),
              ],
            ),
          ],
        ),

        pw.SizedBox(height: 10),

        // ── DETRACCIÓN (si aplica) ──
        /* if (detraccion != null && montoNetoPendiente != null)
          pw.Container(
            width: double.infinity,
            decoration: pw.BoxDecoration(
              border: pw.Border.all(width: 1),
              color: PdfColors.grey200,
            ),
            padding: pw.EdgeInsets.all(8),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("Base Detracción: S/ ${total.toStringAsFixed(2)}",
                        style: pw.TextStyle(fontSize: 10)),
                    pw.Text("Detracción: 12%",
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  children: [
                    pw.Text(
                        "Operación sujeta al Sistema de Pago Obligaciones Tributarias",
                        style: pw.TextStyle(fontSize: 8)),
                    pw.Text(
                        "Monto neto pendiente de pago:    S/ ${montoNetoPendiente.toStringAsFixed(2)}",
                        style: pw.TextStyle(
                            fontSize: 10, fontWeight: pw.FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),

        if (detraccion != null) pw.SizedBox(height: 10),*/

        // ── OBSERVACIONES ──
        pw.Text("SON: $totaltext",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
        pw.SizedBox(height: 5),
        pw.Text("OBS :",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 10)),
        pw.SizedBox(height: 5),
        pw.Text(
            "Esta cotización no incluye repuestos adicionales que se puedan presentar en el transcurso del servicio.",
            style: pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 3),
        pw.Text(
            "Sin otro particular y a la espera de su orden de servicio nos despedimos.",
            style: pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 10),
        pw.Text("Atentamente,", style: pw.TextStyle(fontSize: 10)),
        pw.SizedBox(height: 10),

        // ── CUENTAS BANCARIAS Y FECHA VENCIMIENTO ──
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Contenedor de cuentas bancarias
            pw.Container(
              width: 180,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 1),
              ),
              padding: pw.EdgeInsets.all(5),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("CUENTAS BANCARIAS:",
                      style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold, fontSize: 10)),
                  pw.SizedBox(height: 5),
                  pw.Text("BCP CTA. CTE. SOLES :",
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text("  191-2390862-0-19",
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text("BCP CTA. CCI. SOLES :",
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text("  002-19100239086201950",
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text("BN DETRACCIÓN SOLES :",
                      style: pw.TextStyle(fontSize: 10)),
                  pw.Text("  00-066-104419", style: pw.TextStyle(fontSize: 10)),
                ],
              ),
            ),

            // Espacio entre contenedores
            pw.SizedBox(width: 20),

            // Contenedor de fecha de vencimiento
            pw.Container(
              width: 150,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 1),
                color: PdfColors.grey100,
              ),
              padding: pw.EdgeInsets.all(8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text("FECHA DE VENCIMIENTO:",
                      style: pw.TextStyle(
                          fontSize: 10,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red)),
                  pw.SizedBox(height: 8),
                  pw.Text(fechaVencimientoStr,
                      style: pw.TextStyle(
                          fontSize: 14,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.red)),
                  pw.SizedBox(height: 5)
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );

  // ── SECCIÓN DE FOTOS (RECEPCIÓN Y FALLAS) ──
  // Fetch reception photos
  final List<pw.ImageProvider> receptionPhotoImages = [];
  for (var url in receptionPhotos) {
    try {
      final resp = await http.get(Uri.parse(url));
      if (resp.statusCode == 200) {
        receptionPhotoImages.add(pw.MemoryImage(resp.bodyBytes));
      }
    } catch (_) {}
  }

  // Fetch fault photos (grouped by falla)
  final Map<String, List<pw.ImageProvider>> faultPhotoGroups = {};
  for (var foto in fotosFallos) {
    try {
      final resp = await http.get(Uri.parse(foto['url']));
      if (resp.statusCode == 200) {
        final fallaName = foto['nombre'] ?? '';
        faultPhotoGroups.putIfAbsent(fallaName, () => []);
        faultPhotoGroups[fallaName]!.add(pw.MemoryImage(resp.bodyBytes));
      }
    } catch (_) {}
  }

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (pw.Context context) => [
        // ── FOTOS DE RECEPCIÓN ──
        if (receptionPhotoImages.isNotEmpty) ...[
          pw.SizedBox(height: 10),
          pw.Text("FOTOS DE RECEPCIÓN",
              style: pw.TextStyle(
                  fontSize: 12, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 5),
          pw.Wrap(
            spacing: 10,
            runSpacing: 10,
            children: receptionPhotoImages.map((img) {
              return pw.Container(
                width: 150,
                height: 120,
                child: pw.Image(img, fit: pw.BoxFit.cover),
              );
            }).toList(),
          ),
        ],

        // ── FOTOS DE FALLAS ──
        if (faultPhotoGroups.isNotEmpty) ...[
          pw.SizedBox(height: 10),
          pw.Text("FOTOS DE FALLAS / DIAGNÓSTICO",
              style: pw.TextStyle(
                  fontSize: 12, fontWeight: pw.FontWeight.bold)),
          pw.SizedBox(height: 5),
          ...faultPhotoGroups.entries.map((entry) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(entry.key,
                    style: pw.TextStyle(
                        fontSize: 10, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 3),
                pw.Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: entry.value.map((img) {
                    return pw.Container(
                      width: 150,
                      height: 120,
                      child: pw.Image(img, fit: pw.BoxFit.cover),
                    );
                  }).toList(),
                ),
                pw.SizedBox(height: 10),
              ],
            );
          }),
        ],
      ],
    ),
  );

  // Generar y compartir el PDF
  final Uint8List pdfBytes = await pdf.save();
  await Printing.sharePdf(bytes: pdfBytes, filename: 'cotizacion.pdf');
}
