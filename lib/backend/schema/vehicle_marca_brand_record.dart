import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleMarcaBrandRecord extends FirestoreRecord {
  VehicleMarcaBrandRecord._(
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
      FirebaseFirestore.instance.collection('vehicle_marca_brand');

  static Stream<VehicleMarcaBrandRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleMarcaBrandRecord.fromSnapshot(s));

  static Future<VehicleMarcaBrandRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VehicleMarcaBrandRecord.fromSnapshot(s));

  static VehicleMarcaBrandRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleMarcaBrandRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleMarcaBrandRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleMarcaBrandRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleMarcaBrandRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleMarcaBrandRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleMarcaBrandRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleMarcaBrandRecordDocumentEquality
    implements Equality<VehicleMarcaBrandRecord> {
  const VehicleMarcaBrandRecordDocumentEquality();

  @override
  bool equals(VehicleMarcaBrandRecord? e1, VehicleMarcaBrandRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(VehicleMarcaBrandRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is VehicleMarcaBrandRecord;
}
