// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FacturasArticulosStruct extends FFFirebaseStruct {
  FacturasArticulosStruct({
    String? descripcion,
    int? cantidad,
    double? precioVenta,
    double? total,
    String? moneda,
    double? precioCompra,
    String? codigo,
    DocumentReference? referenceCode,
    double? utilidad,
    int? stock,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _descripcion = descripcion,
        _cantidad = cantidad,
        _precioVenta = precioVenta,
        _total = total,
        _moneda = moneda,
        _precioCompra = precioCompra,
        _codigo = codigo,
        _referenceCode = referenceCode,
        _utilidad = utilidad,
        _stock = stock,
        super(firestoreUtilData);

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  set descripcion(String? val) => _descripcion = val;

  bool hasDescripcion() => _descripcion != null;

  // "Cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  // "PrecioVenta" field.
  double? _precioVenta;
  double get precioVenta => _precioVenta ?? 0.0;
  set precioVenta(double? val) => _precioVenta = val;

  void incrementPrecioVenta(double amount) =>
      precioVenta = precioVenta + amount;

  bool hasPrecioVenta() => _precioVenta != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "Moneda" field.
  String? _moneda;
  String get moneda => _moneda ?? '';
  set moneda(String? val) => _moneda = val;

  bool hasMoneda() => _moneda != null;

  // "PrecioCompra" field.
  double? _precioCompra;
  double get precioCompra => _precioCompra ?? 0.0;
  set precioCompra(double? val) => _precioCompra = val;

  void incrementPrecioCompra(double amount) =>
      precioCompra = precioCompra + amount;

  bool hasPrecioCompra() => _precioCompra != null;

  // "Codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  set codigo(String? val) => _codigo = val;

  bool hasCodigo() => _codigo != null;

  // "referenceCode" field.
  DocumentReference? _referenceCode;
  DocumentReference? get referenceCode => _referenceCode;
  set referenceCode(DocumentReference? val) => _referenceCode = val;

  bool hasReferenceCode() => _referenceCode != null;

  // "utilidad" field.
  double? _utilidad;
  double get utilidad => _utilidad ?? 0.0;
  set utilidad(double? val) => _utilidad = val;

  void incrementUtilidad(double amount) => utilidad = utilidad + amount;

  bool hasUtilidad() => _utilidad != null;

  // "stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  set stock(int? val) => _stock = val;

  void incrementStock(int amount) => stock = stock + amount;

  bool hasStock() => _stock != null;

  static FacturasArticulosStruct fromMap(Map<String, dynamic> data) =>
      FacturasArticulosStruct(
        descripcion: data['Descripcion'] as String?,
        cantidad: castToType<int>(data['Cantidad']),
        precioVenta: castToType<double>(data['PrecioVenta']),
        total: castToType<double>(data['Total']),
        moneda: data['Moneda'] as String?,
        precioCompra: castToType<double>(data['PrecioCompra']),
        codigo: data['Codigo'] as String?,
        referenceCode: data['referenceCode'] as DocumentReference?,
        utilidad: castToType<double>(data['utilidad']),
        stock: castToType<int>(data['stock']),
      );

  static FacturasArticulosStruct? maybeFromMap(dynamic data) => data is Map
      ? FacturasArticulosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Descripcion': _descripcion,
        'Cantidad': _cantidad,
        'PrecioVenta': _precioVenta,
        'Total': _total,
        'Moneda': _moneda,
        'PrecioCompra': _precioCompra,
        'Codigo': _codigo,
        'referenceCode': _referenceCode,
        'utilidad': _utilidad,
        'stock': _stock,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Descripcion': serializeParam(
          _descripcion,
          ParamType.String,
        ),
        'Cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
        'PrecioVenta': serializeParam(
          _precioVenta,
          ParamType.double,
        ),
        'Total': serializeParam(
          _total,
          ParamType.double,
        ),
        'Moneda': serializeParam(
          _moneda,
          ParamType.String,
        ),
        'PrecioCompra': serializeParam(
          _precioCompra,
          ParamType.double,
        ),
        'Codigo': serializeParam(
          _codigo,
          ParamType.String,
        ),
        'referenceCode': serializeParam(
          _referenceCode,
          ParamType.DocumentReference,
        ),
        'utilidad': serializeParam(
          _utilidad,
          ParamType.double,
        ),
        'stock': serializeParam(
          _stock,
          ParamType.int,
        ),
      }.withoutNulls;

  static FacturasArticulosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FacturasArticulosStruct(
        descripcion: deserializeParam(
          data['Descripcion'],
          ParamType.String,
          false,
        ),
        cantidad: deserializeParam(
          data['Cantidad'],
          ParamType.int,
          false,
        ),
        precioVenta: deserializeParam(
          data['PrecioVenta'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['Total'],
          ParamType.double,
          false,
        ),
        moneda: deserializeParam(
          data['Moneda'],
          ParamType.String,
          false,
        ),
        precioCompra: deserializeParam(
          data['PrecioCompra'],
          ParamType.double,
          false,
        ),
        codigo: deserializeParam(
          data['Codigo'],
          ParamType.String,
          false,
        ),
        referenceCode: deserializeParam(
          data['referenceCode'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Articles'],
        ),
        utilidad: deserializeParam(
          data['utilidad'],
          ParamType.double,
          false,
        ),
        stock: deserializeParam(
          data['stock'],
          ParamType.int,
          false,
        ),
      );

  static FacturasArticulosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      FacturasArticulosStruct(
        descripcion: convertAlgoliaParam(
          data['Descripcion'],
          ParamType.String,
          false,
        ),
        cantidad: convertAlgoliaParam(
          data['Cantidad'],
          ParamType.int,
          false,
        ),
        precioVenta: convertAlgoliaParam(
          data['PrecioVenta'],
          ParamType.double,
          false,
        ),
        total: convertAlgoliaParam(
          data['Total'],
          ParamType.double,
          false,
        ),
        moneda: convertAlgoliaParam(
          data['Moneda'],
          ParamType.String,
          false,
        ),
        precioCompra: convertAlgoliaParam(
          data['PrecioCompra'],
          ParamType.double,
          false,
        ),
        codigo: convertAlgoliaParam(
          data['Codigo'],
          ParamType.String,
          false,
        ),
        referenceCode: convertAlgoliaParam(
          data['referenceCode'],
          ParamType.DocumentReference,
          false,
        ),
        utilidad: convertAlgoliaParam(
          data['utilidad'],
          ParamType.double,
          false,
        ),
        stock: convertAlgoliaParam(
          data['stock'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'FacturasArticulosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FacturasArticulosStruct &&
        descripcion == other.descripcion &&
        cantidad == other.cantidad &&
        precioVenta == other.precioVenta &&
        total == other.total &&
        moneda == other.moneda &&
        precioCompra == other.precioCompra &&
        codigo == other.codigo &&
        referenceCode == other.referenceCode &&
        utilidad == other.utilidad &&
        stock == other.stock;
  }

  @override
  int get hashCode => const ListEquality().hash([
        descripcion,
        cantidad,
        precioVenta,
        total,
        moneda,
        precioCompra,
        codigo,
        referenceCode,
        utilidad,
        stock
      ]);
}

FacturasArticulosStruct createFacturasArticulosStruct({
  String? descripcion,
  int? cantidad,
  double? precioVenta,
  double? total,
  String? moneda,
  double? precioCompra,
  String? codigo,
  DocumentReference? referenceCode,
  double? utilidad,
  int? stock,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FacturasArticulosStruct(
      descripcion: descripcion,
      cantidad: cantidad,
      precioVenta: precioVenta,
      total: total,
      moneda: moneda,
      precioCompra: precioCompra,
      codigo: codigo,
      referenceCode: referenceCode,
      utilidad: utilidad,
      stock: stock,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FacturasArticulosStruct? updateFacturasArticulosStruct(
  FacturasArticulosStruct? facturasArticulos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    facturasArticulos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFacturasArticulosStructData(
  Map<String, dynamic> firestoreData,
  FacturasArticulosStruct? facturasArticulos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (facturasArticulos == null) {
    return;
  }
  if (facturasArticulos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && facturasArticulos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final facturasArticulosData =
      getFacturasArticulosFirestoreData(facturasArticulos, forFieldValue);
  final nestedData =
      facturasArticulosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = facturasArticulos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFacturasArticulosFirestoreData(
  FacturasArticulosStruct? facturasArticulos, [
  bool forFieldValue = false,
]) {
  if (facturasArticulos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(facturasArticulos.toMap());

  // Add any Firestore field values
  mapToFirestore(facturasArticulos.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFacturasArticulosListFirestoreData(
  List<FacturasArticulosStruct>? facturasArticuloss,
) =>
    facturasArticuloss
        ?.map((e) => getFacturasArticulosFirestoreData(e, true))
        .toList() ??
    [];
