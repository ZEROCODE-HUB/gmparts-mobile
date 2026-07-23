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

Future<void> generarOrdenTrabajo(
  String razonSocial,
  String ruc,
  String contacto,
  String telefono,
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
  List<String> items,
  List<String> codigos,
  List<double> precios,
  double subTotal, // <--- Ya no se usan pero se dejan para compatibilidad
  double igv, // <--- "
  double total, // <--- "
  String logoUrl,
  String totaltext, // <--- "
) async {
  final pdf = pw.Document();

  // Obtener la imagen del logo y validar la respuesta HTTP
  final response = await http.get(Uri.parse(logoUrl));
  if (response.statusCode != 200) {
    throw Exception('Error al cargar la imagen del logo.');
  }
  final logoImage = pw.MemoryImage(response.bodyBytes);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (pw.Context context) {
        return [
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
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 3),
                    pw.Text(
                      "Dirección fiscal: Av. Nicolás Ayllón Nro. 3270",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                    pw.Text(
                      "Sucursal: Av. Nicolás Ayllón Nro. 3270",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                    pw.Text(
                      "Tel.: 01 362 8667 - 924 483 844",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                    pw.Text(
                      "gearmparts@gmail.com",
                      style: pw.TextStyle(fontSize: 8),
                    ),
                  ],
                ),
              ),
              // Datos de RUC, Cotización y Fecha
              pw.Container(
                width: 140,
                padding: pw.EdgeInsets.symmetric(vertical: 8),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(width: 1),
                ),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  children: [
                    pw.Text(
                      "R.U.C. $ruc",
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Container(
                      width: 135,
                      padding: pw.EdgeInsets.symmetric(vertical: 4),
                      color: PdfColors.grey300,
                      child: pw.Text(
                        "ORDEN DE TRABAJO",
                        textAlign: pw.TextAlign.center,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      numeroCotizacion,
                      style: pw.TextStyle(
                        fontSize: 10,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          // pw.Text(
          //   "FECHA: $fechaServicio",
          //   style: pw.TextStyle(
          //     fontSize: 10,
          //     fontWeight: pw.FontWeight.bold,
          //   ),
          // ),

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
                // Razón Social y Contacto Comercial
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
                              text: "RAZÓN SOCIAL : ",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: razonSocial,
                              style: pw.TextStyle(fontSize: 10),
                            ),
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
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: contacto,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 2),
                // RUC y Teléfono
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Expanded(
                      flex: 3,
                      child: pw.RichText(
                        text: pw.TextSpan(
                          children: [
                            pw.TextSpan(
                              text: "RUC : ",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: ruc,
                              style: pw.TextStyle(fontSize: 10),
                            ),
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
                              text: "TELÉFONO : ",
                              style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: telefono,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 2),
                // Persona Contacto y Email
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
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: contacto,
                              style: pw.TextStyle(fontSize: 10),
                            ),
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
                                fontSize: 10,
                              ),
                            ),
                            pw.TextSpan(
                              text: email,
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 2),
                // Teléfono (único)
                pw.RichText(
                  text: pw.TextSpan(
                    children: [
                      pw.TextSpan(
                        text: "TELÉFONO : ",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      pw.TextSpan(
                        text: telefono.isNotEmpty ? telefono : "/",
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 2),
                // E-mail (único)
                pw.RichText(
                  text: pw.TextSpan(
                    children: [
                      pw.TextSpan(
                        text: "E-MAIL : ",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      pw.TextSpan(
                        text: email.isNotEmpty ? email : "",
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                pw.SizedBox(height: 2),
                // Referencia
                pw.RichText(
                  text: pw.TextSpan(
                    children: [
                      pw.TextSpan(
                        text: "REFERENCIA : ",
                        style: pw.TextStyle(
                          fontWeight: pw.FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      pw.TextSpan(
                        text: "-",
                        style: pw.TextStyle(fontSize: 10),
                      ),
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
                      fontSize: 10,
                      fontWeight: pw.FontWeight.bold,
                    ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: placa,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: marca,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: modelo,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: color,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: combustible,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: kilometraje,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
                                      fontSize: 10,
                                    ),
                                  ),
                                  pw.TextSpan(
                                    text: anioFabricacion,
                                    style: pw.TextStyle(fontSize: 10),
                                  ),
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
          // Agrupar ítems repetidos y calcular cantidades
          ...() {
            final Map<String, Map<String, dynamic>> itemsAgrupados = {};
            for (int i = 0; i < items.length; i++) {
              final String item = items[i];
              final String codigo = codigos[i];
              final double precio = precios[i];
              if (itemsAgrupados.containsKey(item)) {
                itemsAgrupados[item]!['cantidad'] += 1;
              } else {
                itemsAgrupados[item] = {
                  'cantidad': 1,
                  'codigo': codigo,
                  'precio': precio,
                };
              }
            }

            return [
              pw.Table(
                border: pw.TableBorder.all(width: 1),
                columnWidths: {
                  0: pw.FixedColumnWidth(40), // ITEM
                  1: pw.FixedColumnWidth(60), // CÓDIGO
                  2: pw.FlexColumnWidth(3), // DESCRIPCIÓN
                  3: pw.FixedColumnWidth(50), // UNIDAD
                  4: pw.FixedColumnWidth(40), // CANTIDAD
                  5: pw.FixedColumnWidth(60), // CHECK
                },
                children: [
                  // Encabezados
                  pw.TableRow(
                    decoration: pw.BoxDecoration(color: PdfColors.grey300),
                    children: [
                      pw.Padding(
                        padding: pw.EdgeInsets.all(4),
                        child: pw.Text(
                          "ITEM",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text("CÓDIGO",
                              style: pw.TextStyle(
                                  fontWeight: pw.FontWeight.bold, fontSize: 10),
                              textAlign: pw.TextAlign.center)),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(4),
                        child: pw.Text(
                          "DESCRIPCIÓN",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(4),
                        child: pw.Text(
                          "UNIDAD",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(4),
                        child: pw.Text(
                          "CANT",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                      pw.Padding(
                        padding: pw.EdgeInsets.all(4),
                        child: pw.Text(
                          "CHECK",
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 10,
                          ),
                          textAlign: pw.TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  // Filas dinámicas
                  for (int i = 0; i < itemsAgrupados.keys.length; i++)
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text(
                            "${i + 1}",
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        pw.Padding(
                            padding: pw.EdgeInsets.all(4),
                            child: pw.Text(
                                itemsAgrupados.values.elementAt(i)['codigo'] ??
                                    '',
                                style: pw.TextStyle(fontSize: 10))),
                        pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text(
                            itemsAgrupados.keys.elementAt(i),
                            style: pw.TextStyle(fontSize: 10),
                          ),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text(
                            "HRS",
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text(
                            "${itemsAgrupados.values.elementAt(i)['cantidad']}",
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.center,
                          ),
                        ),
                        pw.Padding(
                          padding: pw.EdgeInsets.all(4),
                          child: pw.Text(
                            " ",
                            style: pw.TextStyle(fontSize: 10),
                            textAlign: pw.TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ];
          }(),

          pw.SizedBox(height: 10),

          // ── Observaciones de servicio y Firma ──
          pw.Text(
            "Observaciones de servicio:",
            style: pw.TextStyle(
              fontSize: 10,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 5),

          pw.Table(
            border: pw.TableBorder.all(width: 1),
            columnWidths: {
              0: pw.FlexColumnWidth(1),
              1: pw.FlexColumnWidth(1),
            },
            children: [
              pw.TableRow(
                children: [
                  pw.Padding(
                    padding: pw.EdgeInsets.all(8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Firma y/o sello conductor o responsable",
                          style: pw.TextStyle(fontSize: 10),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "NOMBRE: _______________________",
                          style: pw.TextStyle(fontSize: 10),
                        ),
                        pw.SizedBox(height: 12),
                        pw.Row(
                          children: [
                            pw.Text(
                              "DNI: __________",
                              style: pw.TextStyle(fontSize: 10),
                            ),
                            pw.SizedBox(width: 30),
                            pw.Text(
                              "FIRMA __________",
                              style: pw.TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(8),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "Recepción en Taller",
                          style: pw.TextStyle(fontSize: 10),
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "GEAR MOTOR PARTS S.A.C.",
                          style: pw.TextStyle(fontSize: 10),
                        ),
                        pw.SizedBox(height: 12),
                        pw.Text(
                          "NOMBRE: _______________________",
                          style: pw.TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ];
      },
    ),
  );

  // Generar y compartir el PDF
  final Uint8List pdfBytes = await pdf.save();
  await Printing.sharePdf(bytes: pdfBytes, filename: 'ordendetrabajo.pdf');
}
