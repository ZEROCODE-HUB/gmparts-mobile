import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeasurementUnitRecord extends FirestoreRecord {
  MeasurementUnitRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('measurement_unit');

  static Stream<MeasurementUnitRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeasurementUnitRecord.fromSnapshot(s));

  static Future<MeasurementUnitRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeasurementUnitRecord.fromSnapshot(s));

  static MeasurementUnitRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeasurementUnitRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeasurementUnitRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeasurementUnitRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeasurementUnitRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeasurementUnitRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeasurementUnitRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeasurementUnitRecordDocumentEquality
    implements Equality<MeasurementUnitRecord> {
  const MeasurementUnitRecordDocumentEquality();

  @override
  bool equals(MeasurementUnitRecord? e1, MeasurementUnitRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(MeasurementUnitRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is MeasurementUnitRecord;
}
