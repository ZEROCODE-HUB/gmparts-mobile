import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SendDocumentFacturaAndBoletaSellInmediatPaymentNoCreditCall {
  static Future<ApiCallResponse> call({
    String? serie = 'F001',
    String? correlativo = '1',
    String? emissionDate = '2024-02-02T00:00:00-05:00',
    String? rUCCompany = '20601720621',
    String? clientIDCode = '6-Company, 1 Person',
    String? clientIDNumber = '20552103816',
    String? clientName = 'Business name or Name depending on ID cod',
    String? address = 'PJ. JORGE BASADRE NRO. 158, LIMA - LIMA - SANTA ANITA',
    double? totalAmountAffectedByTaxes = 100.00,
    double? saleTax = 18.00,
    double? totalTax = 18.00,
    double? saleValue = 100.00,
    double? subTotal = 18.00,
    double? totalFinalAmount = 118.00,
    double? overallAmount = 118.00,
    String? paymentDate = '2024-02-02T00:00:00-05:00',
    String? documentType = '01-Factura 03-Boleta',
    dynamic detalleJson,
  }) async {
    final detalle = _serializeJson(detalleJson, true);
    final ffApiRequestBody = '''
{
  "tipo_Operacion": "0101",
  "tipo_Doc": "${documentType}",
  "serie": "${serie}",
  "correlativo": "${correlativo}",
  "tipo_Moneda": "PEN",
  "fecha_Emision": "${emissionDate}",
  "empresa_Ruc": "${rUCCompany}",
  "cliente_Tipo_Doc": "${clientIDCode}",
  "cliente_Num_Doc": "${clientIDNumber}",
  "cliente_Razon_Social": "${clientName}",
  "cliente_Direccion": "${address}",
  "monto_Oper_Gravadas": ${totalAmountAffectedByTaxes},
  "monto_Igv": ${saleTax},
  "total_Impuestos": ${totalTax},
  "valor_Venta": ${saleValue},
  "sub_Total": ${subTotal},
  "monto_Imp_Venta": ${totalFinalAmount},
  "monto_Oper_Exoneradas": 0,
  "estado_Documento": "0",
  "manual": false,
  "id_Base_Dato": "15265",
  "detalle": ${detalle},
  "forma_pago": [
    {
      "tipo": "Contado",
      "monto": ${overallAmount},
      "cuota": 0,
      "fecha_Pago": "${paymentDate}"
    }
  ],
  "legend": [
    {
      "legend_Code": "1000",
      "legend_Value": "GM PARTS TALLER"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'send document Factura and Boleta Sell inmediat payment  no credit',
      apiUrl: 'https://apife-qa.factiliza.com/api/v1/invoice/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTUiLCJuYW1lIjoiQUQzNjAiLCJlbWFpbCI6ImxpY2VuY2lhc0BhdXRvZGVhbDM2MC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJjb25zdWx0b3IifQ.exaRMFDSIm-MIrUTQVlRQ6VgrcLbWPnPGCIhdVLHSrs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? trueFactiliza(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  static bool? trueSunat(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.sunatResponse.success''',
      ));
  static String? codigoSunat(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.sunatResponse.cdrResponse.id''',
      ));
  static String? mensaje(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static String? errorDetallado(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.error.message''',
      ));
}

class CreditNoteCall {
  static Future<ApiCallResponse> call({
    String? serie = 'BC11',
    String? correlativo = '000026',
    String? emissionDate = '2024-03-18T00:00:00-05:00',
    String? rucEmmissionCompany = '20138851410',
    String? customerTypeDoc = '1 - person, 6 company',
    String? customerDocument = '00181359',
    String? customerNameOrBusinessName = 'MARULANDA SALAZAR  MARÍA',
    String? customerAddress = 'AV. GREGORIO ESCOBEDO # 570',
    double? saleTax = 0.0,
    double? totalTax = 0.0,
    double? saleValue = 330.0,
    double? affectedOperationAmount = 330.0,
    double? subtTotal = 330.0,
    double? amountWithTaxes = 330.0,
    String? typeOfDocumentInvolved = '01-Factura, 03-Boleta',
    String? numberOfDocumentInvolved = 'BV14-0000005',
    String? reasonOfGenerationCode =
        'According to 09 on https://www.sunat.gob.pe/legislacion/superin/2017/anexoVII-117-2017.pdf',
    String? reasonOfGenerationText =
        'According to 09 on https://www.sunat.gob.pe/legislacion/superin/2017/anexoVII-117-2017.pdf',
    int? productQuantity = 1,
    String? productCode = '1145',
    String? productDescription =
        'NIÑOS ADOLESCENTES Y ADULTOS 3 VECES POR SEMANA',
    double? productUnitPriceValue = 330.0,
    double? productAmountPreTax = 330.0,
    double? productUnitPriceAmount = 330.0,
    double? productAmountSale = 330.0,
    double? productTaxPercentage = 0.0,
    double? productTax = 0.0,
    String? productSaleAffectationType = '20',
    double? productTotalTax = 0.0,
    double? montoOperExoneradas = 0.0,
  }) async {
    final ffApiRequestBody = '''
{
  "tipo_Operacion": "0101",
  "tipo_Doc": "07",
  "serie": "${serie}",
  "correlativo": "${correlativo}",
  "tipo_Moneda": "PEN",
  "estado_Documento": "0",
  "fecha_Emision": "${emissionDate}",
  "Observacion": "",
  "Manual": false,
  "empresa_Ruc": "${rucEmmissionCompany}",
  "cliente_Tipo_Doc": "${customerTypeDoc}",
  "cliente_Num_Doc": "${customerDocument}",
  "cliente_Razon_Social": "${customerNameOrBusinessName}",
  "cliente_Direccion": "${customerAddress}",
  "monto_Igv": ${saleTax},
  "total_Impuestos": ${totalTax},
  "valor_Venta": ${saleValue},
  "monto_Oper_Gravadas": ${affectedOperationAmount},
  "monto_Oper_Exoneradas": ${montoOperExoneradas},
  "sub_Total": ${subtTotal},
  "monto_Imp_Venta": ${amountWithTaxes},
  "afectado_Tipo_Doc": "${typeOfDocumentInvolved}",
  "afectado_Num_Doc": "${numberOfDocumentInvolved}",
  "motivo_Cod": "${reasonOfGenerationCode}",
  "motivo_Des": "${reasonOfGenerationText}",
  "detalle": [
    {
      "unidad": "NIU",
      "cantidad": ${productQuantity},
      "cod_Producto": "${productCode}",
      "descripcion": "${productDescription}",
      "monto_Valor_Unitario": ${productUnitPriceValue},
      "monto_Base_Igv": ${productAmountPreTax},
      "monto_Precio_Unitario": ${productUnitPriceAmount},
      "monto_Valor_Venta": ${productAmountSale},
      "porcentaje_Igv": ${productTaxPercentage},
      "igv": ${productTax},
      "tip_Afe_Igv": "${productSaleAffectationType}",
      "factor_Icbper": 0,
      "total_Impuestos": ${productTotalTax},
      "codigo": "",
      "cod_Prod_Sunat": ""
    }
  ],
  "legend": [
    {
      "legend_Value": "GM PARTS TALLER",
      "legend_Code": "1000"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'credit note',
      apiUrl: 'https://apife-qa.factiliza.com/api/v1/note/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTUiLCJuYW1lIjoiQUQzNjAiLCJlbWFpbCI6ImxpY2VuY2lhc0BhdXRvZGVhbDM2MC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJjb25zdWx0b3IifQ.exaRMFDSIm-MIrUTQVlRQ6VgrcLbWPnPGCIhdVLHSrs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RemissionDeliveryGuideCall {
  static Future<ApiCallResponse> call({
    String? serie = 'T001',
    String? correlativo = '1',
    String? observation = 'PRUEBA DE GUIA',
    String? generationDate = '2024-02-06T12:34:00-05:00',
    String? ownerIDRUC = '20609517922',
    String? clientDocumentType = '6 for business, 1 for person',
    String? clientDocumentNumber = '20604915351',
    String? clientNameOrBusinessName = 'MEN GRAPH S.A.C.',
    String? clientAddress = 'Sample Address',
  }) async {
    final ffApiRequestBody = '''
{
  "tipo_Doc": "09",
  "serie": "${serie}",
  "correlativo": "${correlativo}",
  "observacion": "${observation}",
  "fecha_Emision": "${generationDate}",
  "empresa_Ruc": "${ownerIDRUC}",
  "cliente_Tipo_Doc": "${clientDocumentType}",
  "cliente_Num_Doc": "${clientDocumentNumber}",
  "cliente_Razon_Social": "${clientNameOrBusinessName}",
  "cliente_Direccion": "${clientAddress}",
  "guia_Envio_Cod_Traslado": "01",
  "guia_Envio_Mod_Traslado": "02",
  "guia_Envio_Peso_Total": 12.5,
  "guia_Envio_Und_Peso_Total": "KGM",
  "guia_Envio_Fec_Traslado": "2024-12-31T13:21:12-05:00",
  "guia_Envio_Vehiculo_Placa": "AXI325",
  "guia_Envio_Partida_Ubigeo": "150203",
  "guia_Envio_Partida_Direccion": "AV. CACEREES 459",
  "guia_Envio_Llegada_Ubigeo": "150204",
  "guia_Envio_Llegada_Direccion": "AV. LA MARINA 569",
  "estado_Documento": "0",
  "manual": false,
  "id_Base_Dato": "15265",
  "transportista": [
    {
      "tipo": "Principal",
      "tipo_doc": "1",
      "nro_doc": "44004477",
      "licencia": "0001122085",
      "nombres": "JUAN PEREZ",
      "apellidos": "BENITO CRUZ"
    }
  ],
  "detalle": [
    {
      "unidad": "KGM",
      "cantidad": 1.56,
      "cod_Producto": "140",
      "descripcion": "PRODUCTO 1"
    },
    {
      "unidad": "KGM",
      "cantidad": 1.56,
      "cod_Producto": "126",
      "descripcion": "PRODUCTO 2"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Remission Delivery Guide',
      apiUrl: 'https://apife-qa.factiliza.com/api/v1/despatch/send',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTUiLCJuYW1lIjoiQUQzNjAiLCJlbWFpbCI6ImxpY2VuY2lhc0BhdXRvZGVhbDM2MC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJjb25zdWx0b3IifQ.exaRMFDSIm-MIrUTQVlRQ6VgrcLbWPnPGCIhdVLHSrs',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SegundaApiPruebaCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "tipo_Operacion": "0101",
  "tipo_Doc": "01",
  "serie": "F001",
  "correlativo": "1",
  "tipo_Moneda": "PEN",
  "fecha_Emision": "2025-11-07T00:00:00-05:00",
  "empresa_Ruc": "10749283781",
  "cliente_Tipo_Doc": "6",
  "cliente_Num_Doc": "21552103817",
  "cliente_Razon_Social": "AGROLIGHT PERU S.A.C.",
  "cliente_Direccion": "PJ. JORGE BASADRE NRO. 158, LIMA - LIMA - SANTA ANITA",
  "monto_Oper_Gravadas": 100,
  "monto_Igv": 18,
  "total_Impuestos": 18,
  "valor_Venta": 100,
  "sub_Total": 118,
  "monto_Imp_Venta": 118,
  "monto_Oper_Exoneradas": 0,
  "estado_Documento": "0",
  "manual": false,
  "id_Base_Dato": "15265",
  "detalle": [
    {
      "unidad": "NIU",
      "cantidad": 1,
      "cod_Producto": "CDFG",
      "descripcion": "PRODUCTO 1",
      "monto_Valor_Unitario": 100,
      "monto_Base_Igv": 100,
      "porcentaje_Igv": 18,
      "igv": 18,
      "tip_Afe_Igv": "10",
      "total_Impuestos": 18,
      "monto_Precio_Unitario": 118,
      "monto_Valor_Venta": 100,
      "factor_Icbper": 0
    }
  ],
  "forma_pago": [
    {
      "tipo": "Contado",
      "monto": 118,
      "cuota": 0,
      "fecha_Pago": "2024-02-02T00:00:00-05:00"
    }
  ],
  "legend": [
    {
      "legend_Code": "1000",
      "legend_Value": "SON CIENTO DIECIOCHO CON 00/100 SOLES"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'segunda api prueba',
      apiUrl: 'https://apife-qa.factiliza.com/api/v1/invoice/send',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyNTUiLCJuYW1lIjoiQUQzNjAiLCJlbWFpbCI6ImxpY2VuY2lhc0BhdXRvZGVhbDM2MC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJjb25zdWx0b3IifQ.exaRMFDSIm-MIrUTQVlRQ6VgrcLbWPnPGCIhdVLHSrs',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
