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
import 'package:http/http.dart' as http;
import 'package:printing/printing.dart';

// Función auxiliar para reemplazar Ñ mayúsculas por N
String _reemplazarEniesMayusculas(String texto) {
  return texto.replaceAll('Ñ', 'N');
}

Future generarFacturaCompraPDF(
  List<String> nombreitems,
  List<double> preciositem,
  double subTotal,
  double igv,
  double total,
  String logoUrl,
  String totalEnLetras,
  String numeroFactura,
  String fechaEmision,
  String vendedor,
  String ordenCompra,
  String condicionPago,
  String cliente,
  String direccion,
  String clienteRUC,
  String observaciones,
  String placa,
  String marca,
  String modelo,
  String km,
  String mainLogoUrl,
  String qrData,
  String erpLogoUrl,
  String titulo,
  List<String> codigoitems,
  List<int> cantidaditems,
  // Nuevo parámetro agregado
  String nroCot,
) async {
  final pdf = pw.Document();
  print('Generando PDF con ${nombreitems.length} productos');
  print('Cantidades: $cantidaditems');

  // Cargar imágenes
  final respLogo = await http.get(Uri.parse(logoUrl));
  final respErp = await http.get(Uri.parse(erpLogoUrl));
  if (respLogo.statusCode != 200 || respErp.statusCode != 200) {
    throw Exception('Error al cargar uno de los logos');
  }
  final logoImage = pw.MemoryImage(respLogo.bodyBytes);
  final erpLogoImage = pw.MemoryImage(respErp.bodyBytes);

  pdf.addPage(
    pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      margin: pw.EdgeInsets.all(20),
      build: (context) => [
        // ── ENCABEZADO ─────────────────────────────────────
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // Logo y datos empresa (lado izquierdo)
            pw.Expanded(
              flex: 2,
              child: pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                    width: 80,
                    height: 80,
                    child: pw.Image(logoImage),
                  ),
                  pw.SizedBox(width: 10),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text('GEAR MOTOR PARTS S.A.C.',
                            style: pw.TextStyle(
                                fontSize: 12, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 2),
                        pw.Text(
                            'Dirección fiscal: Coo. Veintisiete de Abril. Av. Nicolás Ayllón 3270, Ate, Lima',
                            style: pw.TextStyle(fontSize: 8)),
                        pw.Text('Asc. Santa Cruz de Vista Alegre - Santa Anita',
                            style: pw.TextStyle(fontSize: 8)),
                        pw.Text(
                            'Sucursal: Av. Nicolás Ayllón Nro. 3270 Coo. Vendedores de abril - Ate',
                            style: pw.TextStyle(fontSize: 8)),
                        pw.Text('Tel.: 01 362 8667 - 924 483 844',
                            style: pw.TextStyle(fontSize: 8)),
                        pw.Text('gearmparts@gmail.com',
                            style: pw.TextStyle(fontSize: 8)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Caja de factura (lado derecho)
            pw.Container(
              width: 180,
              padding: pw.EdgeInsets.all(10),
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 1.5),
                borderRadius: pw.BorderRadius.circular(4),
              ),
              child: pw.Column(
                children: [
                  pw.Text('R.U.C. 20601720621',
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 8),
                  pw.Text(_reemplazarEniesMayusculas(titulo),
                      style: pw.TextStyle(
                          fontSize: 13, fontWeight: pw.FontWeight.bold)),
                  pw.SizedBox(height: 8),
                  pw.Text('Nº $numeroFactura',
                      style: pw.TextStyle(
                          fontSize: 11, fontWeight: pw.FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 15),

        // ── DATOS CLIENTE ────────────────────────────────────
        pw.Container(
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(width: 1),
            borderRadius: pw.BorderRadius.circular(2),
          ),
          padding: pw.EdgeInsets.all(8),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Primera fila
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Row(
                      children: [
                        pw.Text('PROVEEDOR: ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(
                            _reemplazarEniesMayusculas(cliente.toUpperCase()),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Row(
                      children: [
                        pw.Text('FECHA EMISIÓN : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(fechaEmision, style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 4),
              // Segunda fila
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Row(
                      children: [
                        pw.Text('DIRECCIÓN : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(
                            _reemplazarEniesMayusculas(direccion.toUpperCase()),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Row(
                      children: [
                        pw.Text('VENDEDOR : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(
                            _reemplazarEniesMayusculas(vendedor.toUpperCase()),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 4),
              // Tercera fila
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Row(
                      children: [
                        pw.Text('RUC : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(clienteRUC, style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Row(
                      children: [
                        pw.Text('ORD. DE COMPRA : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(ordenCompra.isNotEmpty ? ordenCompra : '',
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 4),
              // Cuarta fila
              pw.Row(
                children: [
                  pw.Expanded(
                    flex: 3,
                    child: pw.Row(
                      children: [
                        pw.Text('NRO COT : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(nroCot, style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Row(
                      children: [
                        pw.Text('COND. DE PAGO : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(
                            _reemplazarEniesMayusculas(
                                condicionPago.toUpperCase()),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 4),
              // Quinta fila - OBSERVA
              pw.Row(
                children: [
                  pw.Text('OBSERVACIONES : ',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold)),
                  pw.Text(
                      _reemplazarEniesMayusculas(
                          observaciones.isNotEmpty ? observaciones : ''),
                      style: pw.TextStyle(fontSize: 9)),
                ],
              ),
            ],
          ),
        ),

        pw.SizedBox(height: 15),

        // ── TABLA DE ITEMS DINÁMICA (SIN LÍMITE DE FILAS) ──────────────
        pw.Table(
          border: pw.TableBorder.all(width: 0.5, color: PdfColors.black),
          columnWidths: {
            0: pw.FixedColumnWidth(60), // CÓDIGO
            1: pw.FixedColumnWidth(40), // CANT.
            2: pw.FixedColumnWidth(40), // UNID.
            3: pw.FlexColumnWidth(), // DESCRIPCIÓN
            4: pw.FixedColumnWidth(80), // P.UNITARIO
            5: pw.FixedColumnWidth(60), // IMPORTE
          },
          children: [
            // Encabezado de la tabla
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('CÓDIGO',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('CANT.',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('UNID.',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('DESCRIPCIÓN',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('P. UNIT.',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
                pw.Container(
                  padding: pw.EdgeInsets.all(5),
                  child: pw.Text('IMPORTE',
                      style: pw.TextStyle(
                          fontSize: 9, fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.center),
                ),
              ],
            ),

            // Filas dinámicas (sin límite)
            for (int i = 0; i < nombreitems.length; i++)
              pw.TableRow(
                children: [
                  pw.Container(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text(
                      codigoitems.isNotEmpty && i < codigoitems.length
                          ? codigoitems[i]
                          : '---',
                      style: pw.TextStyle(fontSize: 8),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text(
                      cantidaditems.isNotEmpty && i < cantidaditems.length
                          ? cantidaditems[i].toString()
                          : '1',
                      style: pw.TextStyle(fontSize: 8),
                      textAlign: pw.TextAlign.center,
                    ),
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text('HORAS',
                        style: pw.TextStyle(fontSize: 8),
                        textAlign: pw.TextAlign.center),
                  ),
                  pw.Container(
                    padding:
                        pw.EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: pw.Text(
                      _reemplazarEniesMayusculas(nombreitems[i].toUpperCase()),
                      style: pw.TextStyle(fontSize: 8),
                      textAlign: pw.TextAlign.left,
                    ),
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text(
                      preciositem[i].toStringAsFixed(2),
                      style: pw.TextStyle(fontSize: 8),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                  pw.Container(
                    padding: pw.EdgeInsets.all(4),
                    child: pw.Text(
                      (preciositem[i] *
                              (cantidaditems.isNotEmpty &&
                                      i < cantidaditems.length
                                  ? cantidaditems[i]
                                  : 1))
                          .toStringAsFixed(2),
                      style: pw.TextStyle(fontSize: 8),
                      textAlign: pw.TextAlign.right,
                    ),
                  ),
                ],
              ),
          ],
        ),

        pw.SizedBox(height: 8),

        // ── TOTAL EN LETRAS ──────────────────────────────────────
        pw.Container(
          width: double.infinity,
          padding: pw.EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: pw.Row(
            children: [
              pw.Text('SON: ',
                  style: pw.TextStyle(
                      fontSize: 9, fontWeight: pw.FontWeight.bold)),
              pw.Text(_reemplazarEniesMayusculas(totalEnLetras.toUpperCase()),
                  style: pw.TextStyle(fontSize: 9)),
            ],
          ),
        ),

        pw.SizedBox(height: 10),

        // ── FOOTER CON QR, CUENTAS Y TOTALES ────────────────────
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            // QR y texto SUNAT
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.BarcodeWidget(
                  data: qrData,
                  barcode: pw.Barcode.qrCode(),
                  width: 90,
                  height: 90,
                ),
                pw.SizedBox(height: 4),
                pw.Container(
                  width: 150,
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                          'Representación impresa de la FACTURA ELECTRÓNICA',
                          style: pw.TextStyle(fontSize: 6)),
                      pw.Text(
                          'CONSULTE SU DOCUMENTO EN WWW.SUNAT.GOB.PE CON SU CLAVE SOL',
                          style: pw.TextStyle(fontSize: 6)),
                      pw.Text('gearmparts@gmail.com',
                          style: pw.TextStyle(fontSize: 6)),
                    ],
                  ),
                ),
              ],
            ),
            pw.SizedBox(width: 10),
            // Cuentas bancarias
            pw.Expanded(
              child: pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(width: 0.5),
                  borderRadius: pw.BorderRadius.circular(2),
                ),
                padding: pw.EdgeInsets.all(6),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text('BCP CTA Soles: 191-2390862-0-19',
                        style: pw.TextStyle(fontSize: 8)),
                    pw.Text('BCP CTA CCI: 002-19100239086201950',
                        style: pw.TextStyle(fontSize: 8)),
                    pw.Text('BN DETRACCIÓN: 00-066-104419',
                        style: pw.TextStyle(fontSize: 8)),
                  ],
                ),
              ),
            ),
            pw.SizedBox(width: 10),
            // Totales
            pw.Container(
              width: 150,
              decoration: pw.BoxDecoration(
                border: pw.Border.all(width: 0.5),
                borderRadius: pw.BorderRadius.circular(2),
              ),
              padding: pw.EdgeInsets.all(8),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('OP. GRAVADA', style: pw.TextStyle(fontSize: 9)),
                      pw.Text('S/ ${subTotal.toStringAsFixed(2)}',
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                  pw.SizedBox(height: 4),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('I.G.V. (18%)', style: pw.TextStyle(fontSize: 9)),
                      pw.Text('S/ ${igv.toStringAsFixed(2)}',
                          style: pw.TextStyle(fontSize: 9)),
                    ],
                  ),
                  pw.Divider(thickness: 0.5),
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Text('IMPORTE TOTAL',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                      pw.Text('S/ ${total.toStringAsFixed(2)}',
                          style: pw.TextStyle(
                              fontSize: 10, fontWeight: pw.FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        pw.SizedBox(height: 10),

        // Logo ERP-BÚHO al final
        pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Container(
            width: 80,
            height: 35,
            child: pw.Image(erpLogoImage),
          ),
        ),
      ],
    ),
  );

  // Generar y compartir PDF
  final Uint8List pdfBytes = await pdf.save();
  await Printing.sharePdf(
      bytes: pdfBytes, filename: 'factura_$numeroFactura.pdf');
}
