import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlmacenMovementRecord extends FirestoreRecord {
  AlmacenMovementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Article" field.
  DocumentReference? _article;
  DocumentReference? get article => _article;
  bool hasArticle() => _article != null;

  // "Quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "Total_Price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "Movement_type" field.
  String? _movementType;
  String get movementType => _movementType ?? '';
  bool hasMovementType() => _movementType != null;

  void _initializeFields() {
    _article = snapshotData['Article'] as DocumentReference?;
    _quantity = castToType<double>(snapshotData['Quantity']);
    _totalPrice = castToType<double>(snapshotData['Total_Price']);
    _movementType = snapshotData['Movement_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Almacen_movement');

  static Stream<AlmacenMovementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlmacenMovementRecord.fromSnapshot(s));

  static Future<AlmacenMovementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlmacenMovementRecord.fromSnapshot(s));

  static AlmacenMovementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlmacenMovementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlmacenMovementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlmacenMovementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlmacenMovementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlmacenMovementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlmacenMovementRecordData({
  DocumentReference? article,
  double? quantity,
  double? totalPrice,
  String? movementType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Article': article,
      'Quantity': quantity,
      'Total_Price': totalPrice,
      'Movement_type': movementType,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlmacenMovementRecordDocumentEquality
    implements Equality<AlmacenMovementRecord> {
  const AlmacenMovementRecordDocumentEquality();

  @override
  bool equals(AlmacenMovementRecord? e1, AlmacenMovementRecord? e2) {
    return e1?.article == e2?.article &&
        e1?.quantity == e2?.quantity &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.movementType == e2?.movementType;
  }

  @override
  int hash(AlmacenMovementRecord? e) => const ListEquality()
      .hash([e?.article, e?.quantity, e?.totalPrice, e?.movementType]);

  @override
  bool isValidKey(Object? o) => o is AlmacenMovementRecord;
}
