import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlmacenRecord extends FirestoreRecord {
  AlmacenRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "Ciudad" field.
  String? _ciudad;
  String get ciudad => _ciudad ?? '';
  bool hasCiudad() => _ciudad != null;

  // "Vehiculos" field.
  List<DocumentReference>? _vehiculos;
  List<DocumentReference> get vehiculos => _vehiculos ?? const [];
  bool hasVehiculos() => _vehiculos != null;

  // "Created_Date" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _direccion = snapshotData['Direccion'] as String?;
    _ciudad = snapshotData['Ciudad'] as String?;
    _vehiculos = getDataList(snapshotData['Vehiculos']);
    _createdDate = snapshotData['Created_Date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Almacen');

  static Stream<AlmacenRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlmacenRecord.fromSnapshot(s));

  static Future<AlmacenRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlmacenRecord.fromSnapshot(s));

  static AlmacenRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlmacenRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlmacenRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlmacenRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlmacenRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlmacenRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlmacenRecordData({
  String? nombre,
  String? direccion,
  String? ciudad,
  DateTime? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Direccion': direccion,
      'Ciudad': ciudad,
      'Created_Date': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlmacenRecordDocumentEquality implements Equality<AlmacenRecord> {
  const AlmacenRecordDocumentEquality();

  @override
  bool equals(AlmacenRecord? e1, AlmacenRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombre == e2?.nombre &&
        e1?.direccion == e2?.direccion &&
        e1?.ciudad == e2?.ciudad &&
        listEquality.equals(e1?.vehiculos, e2?.vehiculos) &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(AlmacenRecord? e) => const ListEquality()
      .hash([e?.nombre, e?.direccion, e?.ciudad, e?.vehiculos, e?.createdDate]);

  @override
  bool isValidKey(Object? o) => o is AlmacenRecord;
}
