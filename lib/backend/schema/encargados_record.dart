import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EncargadosRecord extends FirestoreRecord {
  EncargadosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "recepciones_ref" field.
  DocumentReference? _recepcionesRef;
  DocumentReference? get recepcionesRef => _recepcionesRef;
  bool hasRecepcionesRef() => _recepcionesRef != null;

  // "diagnosticos_ref" field.
  DocumentReference? _diagnosticosRef;
  DocumentReference? get diagnosticosRef => _diagnosticosRef;
  bool hasDiagnosticosRef() => _diagnosticosRef != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "telefono" field.
  int? _telefono;
  int get telefono => _telefono ?? 0;
  bool hasTelefono() => _telefono != null;

  void _initializeFields() {
    _recepcionesRef = snapshotData['recepciones_ref'] as DocumentReference?;
    _diagnosticosRef = snapshotData['diagnosticos_ref'] as DocumentReference?;
    _nombre = snapshotData['nombre'] as String?;
    _telefono = castToType<int>(snapshotData['telefono']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('encargados');

  static Stream<EncargadosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EncargadosRecord.fromSnapshot(s));

  static Future<EncargadosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EncargadosRecord.fromSnapshot(s));

  static EncargadosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EncargadosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EncargadosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EncargadosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EncargadosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EncargadosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEncargadosRecordData({
  DocumentReference? recepcionesRef,
  DocumentReference? diagnosticosRef,
  String? nombre,
  int? telefono,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'recepciones_ref': recepcionesRef,
      'diagnosticos_ref': diagnosticosRef,
      'nombre': nombre,
      'telefono': telefono,
    }.withoutNulls,
  );

  return firestoreData;
}

class EncargadosRecordDocumentEquality implements Equality<EncargadosRecord> {
  const EncargadosRecordDocumentEquality();

  @override
  bool equals(EncargadosRecord? e1, EncargadosRecord? e2) {
    return e1?.recepcionesRef == e2?.recepcionesRef &&
        e1?.diagnosticosRef == e2?.diagnosticosRef &&
        e1?.nombre == e2?.nombre &&
        e1?.telefono == e2?.telefono;
  }

  @override
  int hash(EncargadosRecord? e) => const ListEquality()
      .hash([e?.recepcionesRef, e?.diagnosticosRef, e?.nombre, e?.telefono]);

  @override
  bool isValidKey(Object? o) => o is EncargadosRecord;
}
