import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticleBrandMarcaRecord extends FirestoreRecord {
  ArticleBrandMarcaRecord._(
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
      FirebaseFirestore.instance.collection('article_brand_marca');

  static Stream<ArticleBrandMarcaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticleBrandMarcaRecord.fromSnapshot(s));

  static Future<ArticleBrandMarcaRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArticleBrandMarcaRecord.fromSnapshot(s));

  static ArticleBrandMarcaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticleBrandMarcaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticleBrandMarcaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticleBrandMarcaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticleBrandMarcaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticleBrandMarcaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticleBrandMarcaRecordData({
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticleBrandMarcaRecordDocumentEquality
    implements Equality<ArticleBrandMarcaRecord> {
  const ArticleBrandMarcaRecordDocumentEquality();

  @override
  bool equals(ArticleBrandMarcaRecord? e1, ArticleBrandMarcaRecord? e2) {
    return e1?.name == e2?.name;
  }

  @override
  int hash(ArticleBrandMarcaRecord? e) => const ListEquality().hash([e?.name]);

  @override
  bool isValidKey(Object? o) => o is ArticleBrandMarcaRecord;
}
