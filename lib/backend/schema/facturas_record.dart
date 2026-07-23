import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FacturasRecord extends FirestoreRecord {
  FacturasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RazonSNombre" field.
  String? _razonSNombre;
  String get razonSNombre => _razonSNombre ?? '';
  bool hasRazonSNombre() => _razonSNombre != null;

  // "Nserie" field.
  String? _nserie;
  String get nserie => _nserie ?? '';
  bool hasNserie() => _nserie != null;

  // "Fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "FPago" field.
  String? _fPago;
  String get fPago => _fPago ?? '';
  bool hasFPago() => _fPago != null;

  // "Canje" field.
  String? _canje;
  String get canje => _canje ?? '';
  bool hasCanje() => _canje != null;

  // "Usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  bool hasUsuario() => _usuario != null;

  // "NumCotizacion" field.
  String? _numCotizacion;
  String get numCotizacion => _numCotizacion ?? '';
  bool hasNumCotizacion() => _numCotizacion != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "items" field.
  List<FacturasArticulosStruct>? _items;
  List<FacturasArticulosStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "tipofactura" field.
  String? _tipofactura;
  String get tipofactura => _tipofactura ?? '';
  bool hasTipofactura() => _tipofactura != null;

  void _initializeFields() {
    _razonSNombre = snapshotData['RazonSNombre'] as String?;
    _nserie = snapshotData['Nserie'] as String?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _total = castToType<double>(snapshotData['Total']);
    _fPago = snapshotData['FPago'] as String?;
    _canje = snapshotData['Canje'] as String?;
    _usuario = snapshotData['Usuario'] as String?;
    _numCotizacion = snapshotData['NumCotizacion'] as String?;
    _estado = snapshotData['Estado'] as String?;
    _items = getStructList(
      snapshotData['items'],
      FacturasArticulosStruct.fromMap,
    );
    _tipofactura = snapshotData['tipofactura'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Facturas');

  static Stream<FacturasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FacturasRecord.fromSnapshot(s));

  static Future<FacturasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FacturasRecord.fromSnapshot(s));

  static FacturasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacturasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacturasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacturasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacturasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacturasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacturasRecordData({
  String? razonSNombre,
  String? nserie,
  DateTime? fecha,
  double? total,
  String? fPago,
  String? canje,
  String? usuario,
  String? numCotizacion,
  String? estado,
  String? tipofactura,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RazonSNombre': razonSNombre,
      'Nserie': nserie,
      'Fecha': fecha,
      'Total': total,
      'FPago': fPago,
      'Canje': canje,
      'Usuario': usuario,
      'NumCotizacion': numCotizacion,
      'Estado': estado,
      'tipofactura': tipofactura,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacturasRecordDocumentEquality implements Equality<FacturasRecord> {
  const FacturasRecordDocumentEquality();

  @override
  bool equals(FacturasRecord? e1, FacturasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.razonSNombre == e2?.razonSNombre &&
        e1?.nserie == e2?.nserie &&
        e1?.fecha == e2?.fecha &&
        e1?.total == e2?.total &&
        e1?.fPago == e2?.fPago &&
        e1?.canje == e2?.canje &&
        e1?.usuario == e2?.usuario &&
        e1?.numCotizacion == e2?.numCotizacion &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.tipofactura == e2?.tipofactura;
  }

  @override
  int hash(FacturasRecord? e) => const ListEquality().hash([
        e?.razonSNombre,
        e?.nserie,
        e?.fecha,
        e?.total,
        e?.fPago,
        e?.canje,
        e?.usuario,
        e?.numCotizacion,
        e?.estado,
        e?.items,
        e?.tipofactura
      ]);

  @override
  bool isValidKey(Object? o) => o is FacturasRecord;
}
