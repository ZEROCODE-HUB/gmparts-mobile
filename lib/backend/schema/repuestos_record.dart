import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepuestosRecord extends FirestoreRecord {
  RepuestosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  void _initializeFields() {
    _nombre = snapshotData['Nombre'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Repuestos');

  static Stream<RepuestosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RepuestosRecord.fromSnapshot(s));

  static Future<RepuestosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RepuestosRecord.fromSnapshot(s));

  static RepuestosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RepuestosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RepuestosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RepuestosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RepuestosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RepuestosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRepuestosRecordData({
  String? nombre,
  double? precio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre': nombre,
      'Precio': precio,
    }.withoutNulls,
  );

  return firestoreData;
}

class RepuestosRecordDocumentEquality implements Equality<RepuestosRecord> {
  const RepuestosRecordDocumentEquality();

  @override
  bool equals(RepuestosRecord? e1, RepuestosRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.precio == e2?.precio;
  }

  @override
  int hash(RepuestosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.precio]);

  @override
  bool isValidKey(Object? o) => o is RepuestosRecord;
}
