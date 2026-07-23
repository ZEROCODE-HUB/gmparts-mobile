import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CuentasPorCobrarRecord extends FirestoreRecord {
  CuentasPorCobrarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "montoTotal" field.
  double? _montoTotal;
  double get montoTotal => _montoTotal ?? 0.0;
  bool hasMontoTotal() => _montoTotal != null;

  // "saldoPendiente" field.
  double? _saldoPendiente;
  double get saldoPendiente => _saldoPendiente ?? 0.0;
  bool hasSaldoPendiente() => _saldoPendiente != null;

  // "estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "numeroCotizacion" field.
  String? _numeroCotizacion;
  String get numeroCotizacion => _numeroCotizacion ?? '';
  bool hasNumeroCotizacion() => _numeroCotizacion != null;

  // "tipoDocumento" field.
  String? _tipoDocumento;
  String get tipoDocumento => _tipoDocumento ?? '';
  bool hasTipoDocumento() => _tipoDocumento != null;

  // "pagoTotalActual" field.
  double? _pagoTotalActual;
  double get pagoTotalActual => _pagoTotalActual ?? 0.0;
  bool hasPagoTotalActual() => _pagoTotalActual != null;

  // "clienteid" field.
  DocumentReference? _clienteid;
  DocumentReference? get clienteid => _clienteid;
  bool hasClienteid() => _clienteid != null;

  // "clientenombre" field.
  String? _clientenombre;
  String get clientenombre => _clientenombre ?? '';
  bool hasClientenombre() => _clientenombre != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "tipoCuenta" field.
  String? _tipoCuenta;
  String get tipoCuenta => _tipoCuenta ?? '';
  bool hasTipoCuenta() => _tipoCuenta != null;

  // "proveedorid" field.
  DocumentReference? _proveedorid;
  DocumentReference? get proveedorid => _proveedorid;
  bool hasProveedorid() => _proveedorid != null;

  void _initializeFields() {
    _montoTotal = castToType<double>(snapshotData['montoTotal']);
    _saldoPendiente = castToType<double>(snapshotData['saldoPendiente']);
    _estado = snapshotData['estado'] as String?;
    _fecha = snapshotData['fecha'] as DateTime?;
    _numeroCotizacion = snapshotData['numeroCotizacion'] as String?;
    _tipoDocumento = snapshotData['tipoDocumento'] as String?;
    _pagoTotalActual = castToType<double>(snapshotData['pagoTotalActual']);
    _clienteid = snapshotData['clienteid'] as DocumentReference?;
    _clientenombre = snapshotData['clientenombre'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _tipoCuenta = snapshotData['tipoCuenta'] as String?;
    _proveedorid = snapshotData['proveedorid'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cuentasPorCobrar');

  static Stream<CuentasPorCobrarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CuentasPorCobrarRecord.fromSnapshot(s));

  static Future<CuentasPorCobrarRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CuentasPorCobrarRecord.fromSnapshot(s));

  static CuentasPorCobrarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CuentasPorCobrarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CuentasPorCobrarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CuentasPorCobrarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CuentasPorCobrarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CuentasPorCobrarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCuentasPorCobrarRecordData({
  double? montoTotal,
  double? saldoPendiente,
  String? estado,
  DateTime? fecha,
  String? numeroCotizacion,
  String? tipoDocumento,
  double? pagoTotalActual,
  DocumentReference? clienteid,
  String? clientenombre,
  DateTime? fechaCreacion,
  String? tipoCuenta,
  DocumentReference? proveedorid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'montoTotal': montoTotal,
      'saldoPendiente': saldoPendiente,
      'estado': estado,
      'fecha': fecha,
      'numeroCotizacion': numeroCotizacion,
      'tipoDocumento': tipoDocumento,
      'pagoTotalActual': pagoTotalActual,
      'clienteid': clienteid,
      'clientenombre': clientenombre,
      'fecha_creacion': fechaCreacion,
      'tipoCuenta': tipoCuenta,
      'proveedorid': proveedorid,
    }.withoutNulls,
  );

  return firestoreData;
}

class CuentasPorCobrarRecordDocumentEquality
    implements Equality<CuentasPorCobrarRecord> {
  const CuentasPorCobrarRecordDocumentEquality();

  @override
  bool equals(CuentasPorCobrarRecord? e1, CuentasPorCobrarRecord? e2) {
    return e1?.montoTotal == e2?.montoTotal &&
        e1?.saldoPendiente == e2?.saldoPendiente &&
        e1?.estado == e2?.estado &&
        e1?.fecha == e2?.fecha &&
        e1?.numeroCotizacion == e2?.numeroCotizacion &&
        e1?.tipoDocumento == e2?.tipoDocumento &&
        e1?.pagoTotalActual == e2?.pagoTotalActual &&
        e1?.clienteid == e2?.clienteid &&
        e1?.clientenombre == e2?.clientenombre &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.tipoCuenta == e2?.tipoCuenta &&
        e1?.proveedorid == e2?.proveedorid;
  }

  @override
  int hash(CuentasPorCobrarRecord? e) => const ListEquality().hash([
        e?.montoTotal,
        e?.saldoPendiente,
        e?.estado,
        e?.fecha,
        e?.numeroCotizacion,
        e?.tipoDocumento,
        e?.pagoTotalActual,
        e?.clienteid,
        e?.clientenombre,
        e?.fechaCreacion,
        e?.tipoCuenta,
        e?.proveedorid
      ]);

  @override
  bool isValidKey(Object? o) => o is CuentasPorCobrarRecord;
}
