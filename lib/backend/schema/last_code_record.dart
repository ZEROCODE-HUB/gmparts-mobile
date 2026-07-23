import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LastCodeRecord extends FirestoreRecord {
  LastCodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lastCode" field.
  String? _lastCode;
  String get lastCode => _lastCode ?? '';
  bool hasLastCode() => _lastCode != null;

  // "lastCodeVenta" field.
  String? _lastCodeVenta;
  String get lastCodeVenta => _lastCodeVenta ?? '';
  bool hasLastCodeVenta() => _lastCodeVenta != null;

  // "uid" field.
  int? _uid;
  int get uid => _uid ?? 0;
  bool hasUid() => _uid != null;

  // "lastCodeCompra" field.
  String? _lastCodeCompra;
  String get lastCodeCompra => _lastCodeCompra ?? '';
  bool hasLastCodeCompra() => _lastCodeCompra != null;

  void _initializeFields() {
    _lastCode = snapshotData['lastCode'] as String?;
    _lastCodeVenta = snapshotData['lastCodeVenta'] as String?;
    _uid = castToType<int>(snapshotData['uid']);
    _lastCodeCompra = snapshotData['lastCodeCompra'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LastCode');

  static Stream<LastCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LastCodeRecord.fromSnapshot(s));

  static Future<LastCodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LastCodeRecord.fromSnapshot(s));

  static LastCodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LastCodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LastCodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LastCodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LastCodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LastCodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLastCodeRecordData({
  String? lastCode,
  String? lastCodeVenta,
  int? uid,
  String? lastCodeCompra,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lastCode': lastCode,
      'lastCodeVenta': lastCodeVenta,
      'uid': uid,
      'lastCodeCompra': lastCodeCompra,
    }.withoutNulls,
  );

  return firestoreData;
}

class LastCodeRecordDocumentEquality implements Equality<LastCodeRecord> {
  const LastCodeRecordDocumentEquality();

  @override
  bool equals(LastCodeRecord? e1, LastCodeRecord? e2) {
    return e1?.lastCode == e2?.lastCode &&
        e1?.lastCodeVenta == e2?.lastCodeVenta &&
        e1?.uid == e2?.uid &&
        e1?.lastCodeCompra == e2?.lastCodeCompra;
  }

  @override
  int hash(LastCodeRecord? e) => const ListEquality()
      .hash([e?.lastCode, e?.lastCodeVenta, e?.uid, e?.lastCodeCompra]);

  @override
  bool isValidKey(Object? o) => o is LastCodeRecord;
}
