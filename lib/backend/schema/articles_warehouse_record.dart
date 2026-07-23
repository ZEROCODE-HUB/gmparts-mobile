import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArticlesWarehouseRecord extends FirestoreRecord {
  ArticlesWarehouseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Document_Type" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  bool hasDocumentType() => _documentType != null;

  // "Serial_Number" field.
  String? _serialNumber;
  String get serialNumber => _serialNumber ?? '';
  bool hasSerialNumber() => _serialNumber != null;

  // "Register_date" field.
  DateTime? _registerDate;
  DateTime? get registerDate => _registerDate;
  bool hasRegisterDate() => _registerDate != null;

  // "Warehouse" field.
  DocumentReference? _warehouse;
  DocumentReference? get warehouse => _warehouse;
  bool hasWarehouse() => _warehouse != null;

  // "Observation" field.
  String? _observation;
  String get observation => _observation ?? '';
  bool hasObservation() => _observation != null;

  // "Articles" field.
  List<DocumentReference>? _articles;
  List<DocumentReference> get articles => _articles ?? const [];
  bool hasArticles() => _articles != null;

  // "Articale_List" field.
  List<ArticlesWarehouseStruct>? _articaleList;
  List<ArticlesWarehouseStruct> get articaleList => _articaleList ?? const [];
  bool hasArticaleList() => _articaleList != null;

  // "seller" field.
  DocumentReference? _seller;
  DocumentReference? get seller => _seller;
  bool hasSeller() => _seller != null;

  void _initializeFields() {
    _documentType = snapshotData['Document_Type'] as String?;
    _serialNumber = snapshotData['Serial_Number'] as String?;
    _registerDate = snapshotData['Register_date'] as DateTime?;
    _warehouse = snapshotData['Warehouse'] as DocumentReference?;
    _observation = snapshotData['Observation'] as String?;
    _articles = getDataList(snapshotData['Articles']);
    _articaleList = getStructList(
      snapshotData['Articale_List'],
      ArticlesWarehouseStruct.fromMap,
    );
    _seller = snapshotData['seller'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Articles_Warehouse');

  static Stream<ArticlesWarehouseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArticlesWarehouseRecord.fromSnapshot(s));

  static Future<ArticlesWarehouseRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArticlesWarehouseRecord.fromSnapshot(s));

  static ArticlesWarehouseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArticlesWarehouseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArticlesWarehouseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArticlesWarehouseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArticlesWarehouseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArticlesWarehouseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArticlesWarehouseRecordData({
  String? documentType,
  String? serialNumber,
  DateTime? registerDate,
  DocumentReference? warehouse,
  String? observation,
  DocumentReference? seller,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Document_Type': documentType,
      'Serial_Number': serialNumber,
      'Register_date': registerDate,
      'Warehouse': warehouse,
      'Observation': observation,
      'seller': seller,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArticlesWarehouseRecordDocumentEquality
    implements Equality<ArticlesWarehouseRecord> {
  const ArticlesWarehouseRecordDocumentEquality();

  @override
  bool equals(ArticlesWarehouseRecord? e1, ArticlesWarehouseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.documentType == e2?.documentType &&
        e1?.serialNumber == e2?.serialNumber &&
        e1?.registerDate == e2?.registerDate &&
        e1?.warehouse == e2?.warehouse &&
        e1?.observation == e2?.observation &&
        listEquality.equals(e1?.articles, e2?.articles) &&
        listEquality.equals(e1?.articaleList, e2?.articaleList) &&
        e1?.seller == e2?.seller;
  }

  @override
  int hash(ArticlesWarehouseRecord? e) => const ListEquality().hash([
        e?.documentType,
        e?.serialNumber,
        e?.registerDate,
        e?.warehouse,
        e?.observation,
        e?.articles,
        e?.articaleList,
        e?.seller
      ]);

  @override
  bool isValidKey(Object? o) => o is ArticlesWarehouseRecord;
}
