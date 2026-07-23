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

Future generarFacturaPDF(
  List<String>? nombreitems,
  List<double>? preciositem,
  double? subTotal,
  double? igv,
  double? total,
  String? logoUrl,
  String? totalEnLetras,
  String? numeroFactura,
  String? fechaEmision,
  String? vendedor,
  String? ordenCompra,
  String? condicionPago,
  String? cliente,
  String? direccion,
  String? clienteRUC,
  String? observaciones,
  String? placa,
  String? marca,
  String? modelo,
  String? km,
  String? mainLogoUrl,
  String? qrData,
  String? erpLogoUrl,
  String? titulo,
  List<String>? codigoitems,
  String? nroCot,
) async {
  try {
    // ═══════════════════════════════════════════════════════════
    // VALIDACIONES Y VALORES POR DEFECTO
    // ═══════════════════════════════════════════════════════════

    // Validar y asignar valores por defecto para listas
    final itemsNombre = nombreitems ?? [];
    final itemsPrecios = preciositem ?? [];
    final itemsCodigos = codigoitems ?? [];

    // Validar que las listas tengan la misma longitud
    if (itemsNombre.isEmpty) {
      throw Exception(
          'Debe proporcionar al menos un item para generar la factura');
    }

    if (itemsNombre.length != itemsPrecios.length) {
      throw Exception(
          'La cantidad de nombres de items (${itemsNombre.length}) no coincide con la cantidad de precios (${itemsPrecios.length})');
    }

    if (itemsNombre.length != itemsCodigos.length) {
      throw Exception(
          'La cantidad de nombres de items (${itemsNombre.length}) no coincide con la cantidad de códigos (${itemsCodigos.length})');
    }

    // Valores por defecto para números
    final subTotalVal = subTotal ?? 0.0;
    final igvVal = igv ?? 0.0;
    final totalVal = total ?? 0.0;

    // Valores por defecto para strings
    final logoUrlVal = logoUrl ?? '';
    final erpLogoUrlVal = erpLogoUrl ?? '';
    final totalEnLetrasVal = totalEnLetras ?? 'CERO CON 00/100 SOLES';
    final numeroFacturaVal = numeroFactura ?? '001-000000';
    final fechaEmisionVal =
        fechaEmision ?? DateTime.now().toString().substring(0, 10);

    // Usar fecha de hoy como base
    final fechaHoy = DateTime.now();

// Calcular vencimiento: mismo día del próximo mes
    final fechaVencimiento = DateTime(
      fechaHoy.year,
      fechaHoy.month + 1, // Sumar 1 mes
      fechaHoy.day, // Mismo día
    );

// Formatear a DD/MM/YYYY
    final fechaVencimientoStr =
        '${fechaVencimiento.day.toString().padLeft(2, '0')}/' +
            '${fechaVencimiento.month.toString().padLeft(2, '0')}/' +
            fechaVencimiento.year.toString();
    final vendedorVal = vendedor ?? 'SIN ESPECIFICAR';
    final ordenCompraVal = ordenCompra ?? '';
    final condicionPagoVal = condicionPago ?? 'CONTADO';
    final clienteVal = cliente ?? 'CLIENTE GENÉRICO';
    final direccionVal = direccion ?? 'SIN DIRECCIÓN';
    final clienteRUCVal = clienteRUC ?? '00000000000';
    final observacionesVal = observaciones ?? '';
    final placaVal = placa ?? '';
    final marcaVal = marca ?? '';
    final modeloVal = modelo ?? '';
    final kmVal = km ?? '';
    final qrDataVal = qrData ?? 'SIN DATOS QR';
    final tituloVal = titulo ?? 'FACTURA ELECTRÓNICA';
    final nroCotVal = nroCot ?? '';

    // Calcular detracción si el total supera los 700 soles
    double? detraccion;
    double? montoNetoPendiente;
    if (totalVal > 700) {
      detraccion = totalVal * 0.12;
      montoNetoPendiente = totalVal - detraccion;
    }

    // Validar URLs de logos
    if (logoUrlVal.isEmpty || !Uri.parse(logoUrlVal).isAbsolute) {
      throw Exception('La URL del logo principal no es válida');
    }

    if (erpLogoUrlVal.isEmpty || !Uri.parse(erpLogoUrlVal).isAbsolute) {
      throw Exception('La URL del logo ERP no es válida');
    }

    final pdf = pw.Document();

    // ═══════════════════════════════════════════════════════════
    // CARGAR IMÁGENES CON MANEJO DE ERRORES
    // ═══════════════════════════════════════════════════════════

    pw.MemoryImage? logoImage;
    pw.MemoryImage? erpLogoImage;

    try {
      final respLogo = await http.get(Uri.parse(logoUrlVal));
      if (respLogo.statusCode != 200) {
        throw Exception(
            'Error al cargar el logo principal. Código HTTP: ${respLogo.statusCode}');
      }
      logoImage = pw.MemoryImage(respLogo.bodyBytes);
    } catch (e) {
      throw Exception('Error al descargar el logo principal: $e');
    }

    try {
      final respErp = await http.get(Uri.parse(erpLogoUrlVal));
      if (respErp.statusCode != 200) {
        throw Exception(
            'Error al cargar el logo ERP. Código HTTP: ${respErp.statusCode}');
      }
      erpLogoImage = pw.MemoryImage(respErp.bodyBytes);
    } catch (e) {
      throw Exception('Error al descargar el logo ERP: $e');
    }

    // Los importes son iguales a los precios ya que cantidad siempre es 1
    List<double> importeItems = List.from(itemsPrecios);

    // ═══════════════════════════════════════════════════════════
    // GENERAR PDF
    // ═══════════════════════════════════════════════════════════

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
                      child: pw.Image(logoImage!),
                    ),
                    pw.SizedBox(width: 10),
                    pw.Expanded(
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('GEAR MOTOR PARTS S.A.C.',
                              style: pw.TextStyle(
                                  fontSize: 12,
                                  fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 2),
                          pw.Text(
                              'Dirección fiscal: Coo. Veintisiete de abril. Av. Nicolás Ayllón 3270, Ate, Lima',
                              style: pw.TextStyle(fontSize: 8)),
                          pw.Text(
                              'Asc. Santa Cruz de Vista Alegre - Santa Anita',
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
                    pw.Text(tituloVal,
                        style: pw.TextStyle(
                            fontSize: 13, fontWeight: pw.FontWeight.bold)),
                    pw.SizedBox(height: 8),
                    pw.Text('Nº $numeroFacturaVal',
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
                          pw.Text('SEÑOR (ES) : ',
                              style: pw.TextStyle(
                                  fontSize: 9, fontWeight: pw.FontWeight.bold)),
                          pw.Expanded(
                            child: pw.Text(clienteVal.toUpperCase(),
                                style: pw.TextStyle(fontSize: 9)),
                          ),
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
                          pw.Text(fechaEmisionVal,
                              style: pw.TextStyle(fontSize: 9)),
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
                          pw.Expanded(
                            child: pw.Text(direccionVal.toUpperCase(),
                                style: pw.TextStyle(fontSize: 9)),
                          ),
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
                          pw.Expanded(
                            child: pw.Text(vendedorVal.toUpperCase(),
                                style: pw.TextStyle(fontSize: 9)),
                          ),
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
                          pw.Text(clienteRUCVal,
                              style: pw.TextStyle(fontSize: 9)),
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
                          pw.Expanded(
                            child: pw.Text(ordenCompraVal,
                                style: pw.TextStyle(fontSize: 9)),
                          ),
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
                          pw.Text(nroCotVal, style: pw.TextStyle(fontSize: 9)),
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
                          pw.Expanded(
                            child: pw.Text(condicionPagoVal.toUpperCase(),
                                style: pw.TextStyle(fontSize: 9)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 4),
                // Quinta fila - OBSERVA
                if (observacionesVal.isNotEmpty)
                  pw.Row(
                    children: [
                      pw.Text('OBSERVA : ',
                          style: pw.TextStyle(
                              fontSize: 9, fontWeight: pw.FontWeight.bold)),
                      pw.Expanded(
                        child: pw.Text(observacionesVal,
                            style: pw.TextStyle(fontSize: 9)),
                      ),
                    ],
                  ),
                if (observacionesVal.isNotEmpty) pw.SizedBox(height: 4),
                // Divider
                pw.Divider(thickness: 0.5),
                // Datos del vehículo
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Row(
                      children: [
                        pw.Text('PLACA : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(placaVal.toUpperCase(),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('MARCA : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(marcaVal.toUpperCase(),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('MODELO : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(modeloVal.toUpperCase(),
                            style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('KM : ',
                            style: pw.TextStyle(
                                fontSize: 9, fontWeight: pw.FontWeight.bold)),
                        pw.Text(kmVal, style: pw.TextStyle(fontSize: 9)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          pw.SizedBox(height: 15),

          // ── TABLA DE ITEMS ───────────────────────────────────
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
                    child: pw.Text('P.UNITARIO',
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
              // Filas de items
              for (int i = 0; i < itemsNombre.length; i++)
                pw.TableRow(
                  children: [
                    pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(itemsCodigos[i],
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text('1',
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text('UND',
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.center),
                    ),
                    pw.Container(
                      padding:
                          pw.EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      child: pw.Text(itemsNombre[i].toUpperCase(),
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.left),
                    ),
                    pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(itemsPrecios[i].toStringAsFixed(2),
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.right),
                    ),
                    pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      child: pw.Text(importeItems[i].toStringAsFixed(2),
                          style: pw.TextStyle(fontSize: 8),
                          textAlign: pw.TextAlign.right),
                    ),
                  ],
                ),
              // Agregar filas vacías si hay menos de 10 items
              for (int i = itemsNombre.length; i < 10; i++)
                pw.TableRow(
                  children: List.generate(
                    6,
                    (index) => pw.Container(
                      padding: pw.EdgeInsets.all(4),
                      height: 20,
                      child: pw.Text('', style: pw.TextStyle(fontSize: 8)),
                    ),
                  ),
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
                pw.Expanded(
                  child: pw.Text(totalEnLetrasVal.toUpperCase(),
                      style: pw.TextStyle(fontSize: 9)),
                ),
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
                    data: qrDataVal,
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
              // Cuentas bancarias y fecha de vencimiento
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    // Contenedor de cuentas bancarias
                    pw.Container(
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

                    // Fecha de vencimiento FUERA del contenedor
                    pw.SizedBox(height: 8),
                    pw.Container(
                      padding: pw.EdgeInsets.only(left: 4),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('FECHA DE VENCIMIENTO:',
                              style: pw.TextStyle(
                                  fontSize: 9, fontWeight: pw.FontWeight.bold)),
                          pw.Text(fechaVencimientoStr, // ← Aquí va la fecha
                              style: pw.TextStyle(
                                  fontSize: 10,
                                  color: PdfColors.red,
                                  fontWeight: pw.FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(width: 10),
              // Totales y detracción
              pw.Column(
                children: [
                  // Caja de totales original
                  pw.Container(
                    width: 180,
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
                            pw.Text('OP. GRAVADA',
                                style: pw.TextStyle(fontSize: 9)),
                            pw.Text('S/ ${subTotalVal.toStringAsFixed(2)}',
                                style: pw.TextStyle(fontSize: 9)),
                          ],
                        ),
                        pw.SizedBox(height: 4),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('I.G.V. (18%)',
                                style: pw.TextStyle(fontSize: 9)),
                            pw.Text('S/ ${igvVal.toStringAsFixed(2)}',
                                style: pw.TextStyle(fontSize: 9)),
                          ],
                        ),
                        pw.Divider(thickness: 0.5),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text('IMPORTE TOTAL',
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                            pw.Text('S/ ${totalVal.toStringAsFixed(2)}',
                                style: pw.TextStyle(
                                    fontSize: 10,
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),

                        // Detracción si aplica
                        if (detraccion != null &&
                            montoNetoPendiente != null) ...[
                          pw.Divider(thickness: 0.5),
                          pw.Container(
                            color: PdfColors.grey100,
                            padding: pw.EdgeInsets.all(6),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('DETRACCIÓN 12%',
                                    style: pw.TextStyle(
                                        fontSize: 9,
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 4),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text('Base:',
                                        style: pw.TextStyle(fontSize: 8)),
                                    pw.Text('S/ ${totalVal.toStringAsFixed(2)}',
                                        style: pw.TextStyle(fontSize: 8)),
                                  ],
                                ),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text('Monto:',
                                        style: pw.TextStyle(fontSize: 8)),
                                    pw.Text(
                                        'S/ ${detraccion.toStringAsFixed(2)}',
                                        style: pw.TextStyle(fontSize: 8)),
                                  ],
                                ),
                                pw.Divider(thickness: 0.5, height: 8),
                                pw.Row(
                                  mainAxisAlignment:
                                      pw.MainAxisAlignment.spaceBetween,
                                  children: [
                                    pw.Text('Neto a pagar:',
                                        style: pw.TextStyle(
                                            fontSize: 9,
                                            fontWeight: pw.FontWeight.bold)),
                                    pw.Text(
                                        'S/ ${montoNetoPendiente.toStringAsFixed(2)}',
                                        style: pw.TextStyle(
                                            fontSize: 9,
                                            fontWeight: pw.FontWeight.bold)),
                                  ],
                                ),
                                pw.SizedBox(height: 4),
                                pw.Text(
                                    'Sujeto a Sistema de Pago Obligaciones Tributarias',
                                    style: pw.TextStyle(fontSize: 6)),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
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
              child: pw.Image(erpLogoImage!),
            ),
          ),
        ],
      ),
    );

    // ═══════════════════════════════════════════════════════════
    // GENERAR Y COMPARTIR PDF
    // ═══════════════════════════════════════════════════════════

    final Uint8List pdfBytes = await pdf.save();
    await Printing.sharePdf(
        bytes: pdfBytes, filename: 'factura_$numeroFacturaVal.pdf');
  } catch (e) {
    // Capturar cualquier error y mostrarlo al usuario
    print('Error al generar PDF: $e');
    throw Exception('No se pudo generar el PDF: $e');
  }
}
