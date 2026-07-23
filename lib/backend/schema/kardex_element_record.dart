import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KardexElementRecord extends FirestoreRecord {
  KardexElementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Article" field.
  DocumentReference? _article;
  DocumentReference? get article => _article;
  bool hasArticle() => _article != null;

  // "Document_Type" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  bool hasDocumentType() => _documentType != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "Client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "Provider" field.
  DocumentReference? _provider;
  DocumentReference? get provider => _provider;
  bool hasProvider() => _provider != null;

  // "Quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "Code_Id" field.
  String? _codeId;
  String get codeId => _codeId ?? '';
  bool hasCodeId() => _codeId != null;

  // "Unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  // "Total_Price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "PricePerUnit" field.
  double? _pricePerUnit;
  double get pricePerUnit => _pricePerUnit ?? 0.0;
  bool hasPricePerUnit() => _pricePerUnit != null;

  // "Warehouse" field.
  DocumentReference? _warehouse;
  DocumentReference? get warehouse => _warehouse;
  bool hasWarehouse() => _warehouse != null;

  // "OEM" field.
  String? _oem;
  String get oem => _oem ?? '';
  bool hasOem() => _oem != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "Document_Number" field.
  int? _documentNumber;
  int get documentNumber => _documentNumber ?? 0;
  bool hasDocumentNumber() => _documentNumber != null;

  // "clientname" field.
  String? _clientname;
  String get clientname => _clientname ?? '';
  bool hasClientname() => _clientname != null;

  // "providername" field.
  String? _providername;
  String get providername => _providername ?? '';
  bool hasProvidername() => _providername != null;

  // "datestring" field.
  String? _datestring;
  String get datestring => _datestring ?? '';
  bool hasDatestring() => _datestring != null;

  void _initializeFields() {
    _article = snapshotData['Article'] as DocumentReference?;
    _documentType = snapshotData['Document_Type'] as String?;
    _date = snapshotData['Date'] as DateTime?;
    _client = snapshotData['Client'] as DocumentReference?;
    _provider = snapshotData['Provider'] as DocumentReference?;
    _quantity = castToType<double>(snapshotData['Quantity']);
    _description = snapshotData['Description'] as String?;
    _codeId = snapshotData['Code_Id'] as String?;
    _unit = snapshotData['Unit'] as String?;
    _totalPrice = castToType<double>(snapshotData['Total_Price']);
    _pricePerUnit = castToType<double>(snapshotData['PricePerUnit']);
    _warehouse = snapshotData['Warehouse'] as DocumentReference?;
    _oem = snapshotData['OEM'] as String?;
    _type = snapshotData['type'] as String?;
    _documentNumber = castToType<int>(snapshotData['Document_Number']);
    _clientname = snapshotData['clientname'] as String?;
    _providername = snapshotData['providername'] as String?;
    _datestring = snapshotData['datestring'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Kardex_element');

  static Stream<KardexElementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => KardexElementRecord.fromSnapshot(s));

  static Future<KardexElementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => KardexElementRecord.fromSnapshot(s));

  static KardexElementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      KardexElementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static KardexElementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      KardexElementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'KardexElementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is KardexElementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createKardexElementRecordData({
  DocumentReference? article,
  String? documentType,
  DateTime? date,
  DocumentReference? client,
  DocumentReference? provider,
  double? quantity,
  String? description,
  String? codeId,
  String? unit,
  double? totalPrice,
  double? pricePerUnit,
  DocumentReference? warehouse,
  String? oem,
  String? type,
  int? documentNumber,
  String? clientname,
  String? providername,
  String? datestring,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Article': article,
      'Document_Type': documentType,
      'Date': date,
      'Client': client,
      'Provider': provider,
      'Quantity': quantity,
      'Description': description,
      'Code_Id': codeId,
      'Unit': unit,
      'Total_Price': totalPrice,
      'PricePerUnit': pricePerUnit,
      'Warehouse': warehouse,
      'OEM': oem,
      'type': type,
      'Document_Number': documentNumber,
      'clientname': clientname,
      'providername': providername,
      'datestring': datestring,
    }.withoutNulls,
  );

  return firestoreData;
}

class KardexElementRecordDocumentEquality
    implements Equality<KardexElementRecord> {
  const KardexElementRecordDocumentEquality();

  @override
  bool equals(KardexElementRecord? e1, KardexElementRecord? e2) {
    return e1?.article == e2?.article &&
        e1?.documentType == e2?.documentType &&
        e1?.date == e2?.date &&
        e1?.client == e2?.client &&
        e1?.provider == e2?.provider &&
        e1?.quantity == e2?.quantity &&
        e1?.description == e2?.description &&
        e1?.codeId == e2?.codeId &&
        e1?.unit == e2?.unit &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.pricePerUnit == e2?.pricePerUnit &&
        e1?.warehouse == e2?.warehouse &&
        e1?.oem == e2?.oem &&
        e1?.type == e2?.type &&
        e1?.documentNumber == e2?.documentNumber &&
        e1?.clientname == e2?.clientname &&
        e1?.providername == e2?.providername &&
        e1?.datestring == e2?.datestring;
  }

  @override
  int hash(KardexElementRecord? e) => const ListEquality().hash([
        e?.article,
        e?.documentType,
        e?.date,
        e?.client,
        e?.provider,
        e?.quantity,
        e?.description,
        e?.codeId,
        e?.unit,
        e?.totalPrice,
        e?.pricePerUnit,
        e?.warehouse,
        e?.oem,
        e?.type,
        e?.documentNumber,
        e?.clientname,
        e?.providername,
        e?.datestring
      ]);

  @override
  bool isValidKey(Object? o) => o is KardexElementRecord;
}
