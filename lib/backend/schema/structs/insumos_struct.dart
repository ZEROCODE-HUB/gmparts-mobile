// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InsumosStruct extends FFFirebaseStruct {
  InsumosStruct({
    String? nombre,
    double? precio,
    DocumentReference? ref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nombre = nombre,
        _precio = precio,
        _ref = ref,
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

  static InsumosStruct fromMap(Map<String, dynamic> data) => InsumosStruct(
        nombre: data['nombre'] as String?,
        precio: castToType<double>(data['precio']),
        ref: data['ref'] as DocumentReference?,
      );

  static InsumosStruct? maybeFromMap(dynamic data) =>
      data is Map ? InsumosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nombre': _nombre,
        'precio': _precio,
        'ref': _ref,
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
      }.withoutNulls;

  static InsumosStruct fromSerializableMap(Map<String, dynamic> data) =>
      InsumosStruct(
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
      );

  static InsumosStruct fromAlgoliaData(Map<String, dynamic> data) =>
      InsumosStruct(
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
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'InsumosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InsumosStruct &&
        nombre == other.nombre &&
        precio == other.precio &&
        ref == other.ref;
  }

  @override
  int get hashCode => const ListEquality().hash([nombre, precio, ref]);
}

InsumosStruct createInsumosStruct({
  String? nombre,
  double? precio,
  DocumentReference? ref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InsumosStruct(
      nombre: nombre,
      precio: precio,
      ref: ref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InsumosStruct? updateInsumosStruct(
  InsumosStruct? insumos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    insumos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInsumosStructData(
  Map<String, dynamic> firestoreData,
  InsumosStruct? insumos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (insumos == null) {
    return;
  }
  if (insumos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && insumos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final insumosData = getInsumosFirestoreData(insumos, forFieldValue);
  final nestedData = insumosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = insumos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInsumosFirestoreData(
  InsumosStruct? insumos, [
  bool forFieldValue = false,
]) {
  if (insumos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(insumos.toMap());

  // Add any Firestore field values
  mapToFirestore(insumos.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInsumosListFirestoreData(
  List<InsumosStruct>? insumoss,
) =>
    insumoss?.map((e) => getInsumosFirestoreData(e, true)).toList() ?? [];
