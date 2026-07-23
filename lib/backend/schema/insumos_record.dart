import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InsumosRecord extends FirestoreRecord {
  InsumosRecord._(
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
      FirebaseFirestore.instance.collection('Insumos');

  static Stream<InsumosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InsumosRecord.fromSnapshot(s));

  static Future<InsumosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InsumosRecord.fromSnapshot(s));

  static InsumosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InsumosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InsumosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InsumosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InsumosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InsumosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInsumosRecordData({
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

class InsumosRecordDocumentEquality implements Equality<InsumosRecord> {
  const InsumosRecordDocumentEquality();

  @override
  bool equals(InsumosRecord? e1, InsumosRecord? e2) {
    return e1?.nombre == e2?.nombre && e1?.precio == e2?.precio;
  }

  @override
  int hash(InsumosRecord? e) =>
      const ListEquality().hash([e?.nombre, e?.precio]);

  @override
  bool isValidKey(Object? o) => o is InsumosRecord;
}
