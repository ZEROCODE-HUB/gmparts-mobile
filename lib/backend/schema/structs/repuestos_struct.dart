// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RepuestosStruct extends FFFirebaseStruct {
  RepuestosStruct({
    String? nombre,
    double? precio,
    DocumentReference? ref,
    int? cantidad,
    String? tipo,
    double? total,
    String? codigo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _precio = precio,
        _ref = ref,
        _cantidad = cantidad,
        _tipo = tipo,
        _total = total,
        _codigo = codigo,
        super(firestoreUtilData);

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  set precio(double? val) => _precio = val;

  void incrementPrecio(double amount) => precio = precio + amount;

  bool hasPrecio() => _precio != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  // "cantidad" field.
  int? _cantidad;
  int get cantidad => _cantidad ?? 0;
  set cantidad(int? val) => _cantidad = val;

  void incrementCantidad(int amount) => cantidad = cantidad + amount;

  bool hasCantidad() => _cantidad != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  set tipo(String? val) => _tipo = val;

  bool hasTipo() => _tipo != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  set codigo(String? val) => _codigo = val;

  bool hasCodigo() => _codigo != null;

  static RepuestosStruct fromMap(Map<String, dynamic> data) => RepuestosStruct(
        nombre: data['nombre'] as String?,
        precio: castToType<double>(data['precio']),
        ref: data['ref'] as DocumentReference?,
        cantidad: castToType<int>(data['cantidad']),
        tipo: data['tipo'] as String?,
        total: castToType<double>(data['total']),
        codigo: data['codigo'] as String?,
      );

  static RepuestosStruct? maybeFromMap(dynamic data) => data is Map
      ? RepuestosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'precio': _precio,
        'ref': _ref,
        'cantidad': _cantidad,
        'tipo': _tipo,
        'total': _total,
        'codigo': _codigo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'precio': serializeParam(
          _precio,
          ParamType.double,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
        'cantidad': serializeParam(
          _cantidad,
          ParamType.int,
        ),
        'tipo': serializeParam(
          _tipo,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.String,
        ),
      }.withoutNulls;

  static RepuestosStruct fromSerializableMap(Map<String, dynamic> data) =>
      RepuestosStruct(
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        precio: deserializeParam(
          data['precio'],
          ParamType.double,
          false,
        ),
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Articles'],
        ),
        cantidad: deserializeParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
        tipo: deserializeParam(
          data['tipo'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.String,
          false,
        ),
      );

  static RepuestosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      RepuestosStruct(
        nombre: convertAlgoliaParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        precio: convertAlgoliaParam(
          data['precio'],
          ParamType.double,
          false,
        ),
        ref: convertAlgoliaParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
        ),
        cantidad: convertAlgoliaParam(
          data['cantidad'],
          ParamType.int,
          false,
        ),
        tipo: convertAlgoliaParam(
          data['tipo'],
          ParamType.String,
          false,
        ),
        total: convertAlgoliaParam(
          data['total'],
          ParamType.double,
          false,
        ),
        codigo: convertAlgoliaParam(
          data['codigo'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'RepuestosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RepuestosStruct &&
        nombre == other.nombre &&
        precio == other.precio &&
        ref == other.ref &&
        cantidad == other.cantidad &&
        tipo == other.tipo &&
        total == other.total &&
        codigo == other.codigo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([nombre, precio, ref, cantidad, tipo, total, codigo]);
}

RepuestosStruct createRepuestosStruct({
  String? nombre,
  double? precio,
  DocumentReference? ref,
  int? cantidad,
  String? tipo,
  double? total,
  String? codigo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RepuestosStruct(
      nombre: nombre,
      precio: precio,
      ref: ref,
      cantidad: cantidad,
      tipo: tipo,
      total: total,
      codigo: codigo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RepuestosStruct? updateRepuestosStruct(
  RepuestosStruct? repuestos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    repuestos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRepuestosStructData(
  Map<String, dynamic> firestoreData,
  RepuestosStruct? repuestos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (repuestos == null) {
    return;
  }
  if (repuestos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && repuestos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final repuestosData = getRepuestosFirestoreData(repuestos, forFieldValue);
  final nestedData = repuestosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = repuestos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRepuestosFirestoreData(
  RepuestosStruct? repuestos, [
  bool forFieldValue = false,
]) {
  if (repuestos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(repuestos.toMap());

  // Add any Firestore field values
  mapToFirestore(repuestos.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRepuestosListFirestoreData(
  List<RepuestosStruct>? repuestoss,
) =>
    repuestoss?.map((e) => getRepuestosFirestoreData(e, true)).toList() ?? [];
