// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarcaStruct extends FFFirebaseStruct {
  MarcaStruct({
    List<String>? field,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _field = field,
        super(firestoreUtilData);

  // "Field" field.
  List<String>? _field;
  List<String> get field => _field ?? const [];
  set field(List<String>? val) => _field = val;

  void updateField(Function(List<String>) updateFn) {
    updateFn(_field ??= []);
  }

  bool hasField() => _field != null;

  static MarcaStruct fromMap(Map<String, dynamic> data) => MarcaStruct(
        field: getDataList(data['Field']),
      );

  static MarcaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MarcaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Field': _field,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Field': serializeParam(
          _field,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static MarcaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MarcaStruct(
        field: deserializeParam<String>(
          data['Field'],
          ParamType.String,
          true,
        ),
      );

  static MarcaStruct fromAlgoliaData(Map<String, dynamic> data) => MarcaStruct(
        field: convertAlgoliaParam<String>(
          data['Field'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'MarcaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MarcaStruct && listEquality.equals(field, other.field);
  }

  @override
  int get hashCode => const ListEquality().hash([field]);
}

MarcaStruct createMarcaStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MarcaStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MarcaStruct? updateMarcaStruct(
  MarcaStruct? marca, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    marca
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMarcaStructData(
  Map<String, dynamic> firestoreData,
  MarcaStruct? marca,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (marca == null) {
    return;
  }
  if (marca.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && marca.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final marcaData = getMarcaFirestoreData(marca, forFieldValue);
  final nestedData = marcaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = marca.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMarcaFirestoreData(
  MarcaStruct? marca, [
  bool forFieldValue = false,
]) {
  if (marca == null) {
    return {};
  }
  final firestoreData = mapToFirestore(marca.toMap());

  // Add any Firestore field values
  mapToFirestore(marca.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMarcaListFirestoreData(
  List<MarcaStruct>? marcas,
) =>
    marcas?.map((e) => getMarcaFirestoreData(e, true)).toList() ?? [];
