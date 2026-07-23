import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PagosCporCobrarRecord extends FirestoreRecord {
  PagosCporCobrarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "usuario" field.
  DocumentReference? _usuario;
  DocumentReference? get usuario => _usuario;
  bool hasUsuario() => _usuario != null;

  // "montopagado" field.
  double? _montopagado;
  double get montopagado => _montopagado ?? 0.0;
  bool hasMontopagado() => _montopagado != null;

  // "montopendiente" field.
  double? _montopendiente;
  double get montopendiente => _montopendiente ?? 0.0;
  bool hasMontopendiente() => _montopendiente != null;

  // "numerocuenta" field.
  String? _numerocuenta;
  String get numerocuenta => _numerocuenta ?? '';
  bool hasNumerocuenta() => _numerocuenta != null;

  // "metodopago" field.
  String? _metodopago;
  String get metodopago => _metodopago ?? '';
  bool hasMetodopago() => _metodopago != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fecha = snapshotData['fecha'] as DateTime?;
    _usuario = snapshotData['usuario'] as DocumentReference?;
    _montopagado = castToType<double>(snapshotData['montopagado']);
    _montopendiente = castToType<double>(snapshotData['montopendiente']);
    _numerocuenta = snapshotData['numerocuenta'] as String?;
    _metodopago = snapshotData['metodopago'] as String?;
    _estado = snapshotData['estado'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('pagos_CporCobrar')
          : FirebaseFirestore.instance.collectionGroup('pagos_CporCobrar');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('pagos_CporCobrar').doc(id);

  static Stream<PagosCporCobrarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PagosCporCobrarRecord.fromSnapshot(s));

  static Future<PagosCporCobrarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PagosCporCobrarRecord.fromSnapshot(s));

  static PagosCporCobrarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PagosCporCobrarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PagosCporCobrarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PagosCporCobrarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PagosCporCobrarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PagosCporCobrarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPagosCporCobrarRecordData({
  DateTime? fecha,
  DocumentReference? usuario,
  double? montopagado,
  double? montopendiente,
  String? numerocuenta,
  String? metodopago,
  String? estado,
  DateTime? fechaCreacion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fecha': fecha,
      'usuario': usuario,
      'montopagado': montopagado,
      'montopendiente': montopendiente,
      'numerocuenta': numerocuenta,
      'metodopago': metodopago,
      'estado': estado,
      'fecha_creacion': fechaCreacion,
    }.withoutNulls,
  );

  return firestoreData;
}

class PagosCporCobrarRecordDocumentEquality
    implements Equality<PagosCporCobrarRecord> {
  const PagosCporCobrarRecordDocumentEquality();

  @override
  bool equals(PagosCporCobrarRecord? e1, PagosCporCobrarRecord? e2) {
    return e1?.fecha == e2?.fecha &&
        e1?.usuario == e2?.usuario &&
        e1?.montopagado == e2?.montopagado &&
        e1?.montopendiente == e2?.montopendiente &&
        e1?.numerocuenta == e2?.numerocuenta &&
        e1?.metodopago == e2?.metodopago &&
        e1?.estado == e2?.estado &&
        e1?.fechaCreacion == e2?.fechaCreacion;
  }

  @override
  int hash(PagosCporCobrarRecord? e) => const ListEquality().hash([
        e?.fecha,
        e?.usuario,
        e?.montopagado,
        e?.montopendiente,
        e?.numerocuenta,
        e?.metodopago,
        e?.estado,
        e?.fechaCreacion
      ]);

  @override
  bool isValidKey(Object? o) => o is PagosCporCobrarRecord;
}
