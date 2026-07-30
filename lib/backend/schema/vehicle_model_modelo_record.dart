import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleModelModeloRecord extends FirestoreRecord {
  VehicleModelModeloRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "brand" field.
  DocumentReference? _brand;
  DocumentReference? get brand => _brand;
  bool hasBrand() => _brand != null;

  // "brandname" field.
  String? _brandname;
  String get brandname => _brandname ?? '';
  bool hasBrandname() => _brandname != null;

  // "marca" field (used by web-admin).
  String? _marca;
  String get marca => _marca ?? _brandname ?? '';
  bool hasMarca() => _marca != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _brand = snapshotData['brand'] as DocumentReference?;
    _brandname = snapshotData['brandname'] as String?;
    _marca = snapshotData['marca'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicle_model_modelo');

  static Stream<VehicleModelModeloRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleModelModeloRecord.fromSnapshot(s));

  static Future<VehicleModelModeloRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => VehicleModelModeloRecord.fromSnapshot(s));

  static VehicleModelModeloRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleModelModeloRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleModelModeloRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleModelModeloRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleModelModeloRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleModelModeloRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleModelModeloRecordData({
  String? name,
  DocumentReference? brand,
  String? brandname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'brand': brand,
      'brandname': brandname,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleModelModeloRecordDocumentEquality
    implements Equality<VehicleModelModeloRecord> {
  const VehicleModelModeloRecordDocumentEquality();

  @override
  bool equals(VehicleModelModeloRecord? e1, VehicleModelModeloRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.brand == e2?.brand &&
        e1?.brandname == e2?.brandname;
  }

  @override
  int hash(VehicleModelModeloRecord? e) =>
      const ListEquality().hash([e?.name, e?.brand, e?.brandname]);

  @override
  bool isValidKey(Object? o) => o is VehicleModelModeloRecord;
}
