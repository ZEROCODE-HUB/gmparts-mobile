import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double sumalist(List<double> sumar) {
  double total = 0.0;
  for (double num in sumar) {
    total += num;
  }
  return total;
}

String codigomoreone(String lastCode) {
  // Sumar +1 a este valor: CT001-0000001
  // Extract the numeric part of the code
  String numericPart = lastCode.substring(6);

  // Convert the numeric part to an integer and add 1
  int newNumericValue = int.parse(numericPart) + 1;

  // Format the new numeric value with leading zeros
  String newNumericPart = newNumericValue.toString().padLeft(7, '0');

  // Combine the prefix and the new numeric part
  String newCode = 'CT001-$newNumericPart';

  return newCode;
}

DateTime fechaHasta(DateTime fecha) {
  // suma 86399 segundos a la fecha
  return fecha.add(Duration(seconds: 86399));
}

String doubleToWords(double amount) {
  List<String> unidades = [
    '',
    'UNO',
    'DOS',
    'TRES',
    'CUATRO',
    'CINCO',
    'SEIS',
    'SIETE',
    'OCHO',
    'NUEVE'
  ];

  List<String> especiales = [
    'DIEZ',
    'ONCE',
    'DOCE',
    'TRECE',
    'CATORCE',
    'QUINCE',
    'DIECISÉIS',
    'DIECISIETE',
    'DIECIOCHO',
    'DIECINUEVE'
  ];

  List<String> decenas = [
    '',
    '',
    'VEINTE',
    'TREINTA',
    'CUARENTA',
    'CINCUENTA',
    'SESENTA',
    'SETENTA',
    'OCHENTA',
    'NOVENTA'
  ];

  List<String> centenas = [
    '',
    'CIEN',
    'DOSCIENTOS',
    'TRESCIENTOS',
    'CUATROCIENTOS',
    'QUINIENTOS',
    'SEISCIENTOS',
    'SETECIENTOS',
    'OCHOCIENTOS',
    'NOVECIENTOS'
  ];

  String convertirNumero(int numero) {
    if (numero == 0) return "CERO";
    if (numero < 10) return unidades[numero];
    if (numero < 20) return especiales[numero - 10];
    if (numero < 100) {
      return decenas[numero ~/ 10] +
          (numero % 10 > 0 ? " Y " + unidades[numero % 10] : "");
    }
    if (numero < 1000) {
      return centenas[numero ~/ 100] +
          (numero % 100 > 0 ? " " + convertirNumero(numero % 100) : "");
    }
    if (numero < 1000000) {
      return (numero ~/ 1000 == 1
              ? "MIL"
              : convertirNumero(numero ~/ 1000) + " MIL") +
          (numero % 1000 > 0 ? " " + convertirNumero(numero % 1000) : "");
    }
    return "Número demasiado grande";
  }

  int parteEntera = amount.floor();
  int centavos = ((amount - parteEntera) * 100).round();

  String textoEntero = convertirNumero(parteEntera);
  String textoCentavos = centavos < 10 ? "0$centavos" : "$centavos";

  return "$textoEntero Y $textoCentavos/100 SOLES";
}

String seriefactura(int numero) {
  // Debes devolverme un valor de 4 digitos que empiece en F y 3 digitos si o si que sean el valor del "numero" ejemplo si el "numero es "1" entonces debe devolver F001
  return 'F' + numero.toString().padLeft(4, '0');
}

String? getCodeSerial() {
  // haceme una funcion que devuelva un string qsaue genere codigos en este formato de maner aleatoria...	F001-00021150 en ese formato tiene que ser
  final random = math.Random();
  final prefix = 'F';
  final numberPart = random.nextInt(10000).toString().padLeft(4, '0');
  return '$prefix$numberPart';
}

List<dynamic> getListDetailFactura(
    List<FacturasArticulosStruct> facturaArticulos) {
  double round2(num value) => double.parse(value.toStringAsFixed(2));
  return facturaArticulos.map((articulo) {
    final valorUnitario = round2(articulo.precioVenta);
    final cantidad = articulo.cantidad;
    final valorVenta = round2(valorUnitario * cantidad);
    final igv = round2(valorVenta * 0.18);
    final precioUnitarioConIgv = round2(valorUnitario * 1.18);

    return {
      "unidad": "NIU",
      "cantidad": cantidad,
      "cod_Producto": articulo.codigo,
      "descripcion": articulo.descripcion,
      "monto_Valor_Unitario": valorUnitario,
      "monto_Base_Igv": valorVenta,
      "porcentaje_Igv": 18,
      "igv": igv,
      "tip_Afe_Igv": "10", // ✅ como string
      "total_Impuestos": igv,
      "monto_Precio_Unitario": precioUnitarioConIgv,
      "monto_Valor_Venta": valorVenta,
      "factor_Icbper": 0,
    };
  }).toList();
}

List<dynamic> getListDetailFactura2(
    List<FacturasArticulosStruct> facturaArticulos) {
  double round2(num value) => double.parse(value.toStringAsFixed(2));

  return facturaArticulos.map((articulo) {
    final cantidad = articulo.cantidad;

    // 🔹 precio que viene CON IGV (ej: 550)
    final precioConIgv = articulo.precioVenta;

    // 🔹 obtener valor real SIN IGV
    final valorUnitario = round2(precioConIgv / 1.18);

    // 🔹 base imponible
    final valorVenta = round2(valorUnitario * cantidad);

    // 🔹 IGV
    final igv = round2(valorVenta * 0.18);

    // 🔹 precio unitario con IGV
    final precioUnitarioConIgv = round2(valorUnitario * 1.18);

    return {
      "unidad": "NIU",
      "cantidad": cantidad,
      "cod_Producto": articulo.codigo,
      "descripcion": articulo.descripcion,
      "monto_Valor_Unitario": valorUnitario, // 466.10
      "monto_Base_Igv": valorVenta, // 466.10
      "porcentaje_Igv": 18,
      "igv": igv, // 83.90
      "tip_Afe_Igv": "10",
      "total_Impuestos": igv,
      "monto_Precio_Unitario": precioUnitarioConIgv, // 550.00
      "monto_Valor_Venta": valorVenta,
      "factor_Icbper": 0,
    };
  }).toList();
}

String? incrementNroSerie(String input) {
  // haceme una custom function donde le paso un F0002 por ejemplo y me devuelve sumado osea F0003 o si le paso paso F0023 que devuelva F0024 osea que le sume siempre en ese formato y de 4 digitos los nros con F siempre l principicio
  if (input.startsWith('F') && input.length == 4) {
    String numberPart = input.substring(1); // Extrae los 3 dígitos
    int number = int.tryParse(numberPart) ?? 0;
    number++;
    if (number > 999) return null; // Opcional: límite de 3 dígitos
    return 'F${number.toString().padLeft(3, '0')}';
  }
  return null;
}

DateTime? sumarFechas(
  DateTime? fecha,
  int? dias,
) {
  print("Prbando");
  if (fecha == null || dias == null) return fecha;
  return fecha.add(Duration(days: dias));
}

double? convertiradouble(String valor) {
  return double.tryParse(valor.replaceAll(',', '.'));
}
