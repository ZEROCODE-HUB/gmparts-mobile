import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FacturasVentasComprasRecord extends FirestoreRecord {
  FacturasVentasComprasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "RazonNombre" field.
  String? _razonNombre;
  String get razonNombre => _razonNombre ?? '';
  bool hasRazonNombre() => _razonNombre != null;

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

  // "Items" field.
  List<FacturasArticulosStruct>? _items;
  List<FacturasArticulosStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "tipofactura" field.
  String? _tipofactura;
  String get tipofactura => _tipofactura ?? '';
  bool hasTipofactura() => _tipofactura != null;

  // "proveedor" field.
  String? _proveedor;
  String get proveedor => _proveedor ?? '';
  bool hasProveedor() => _proveedor != null;

  // "TipoOperacion" field.
  String? _tipoOperacion;
  String get tipoOperacion => _tipoOperacion ?? '';
  bool hasTipoOperacion() => _tipoOperacion != null;

  // "igv" field.
  String? _igv;
  String get igv => _igv ?? '';
  bool hasIgv() => _igv != null;

  // "Almacen" field.
  String? _almacen;
  String get almacen => _almacen ?? '';
  bool hasAlmacen() => _almacen != null;

  // "EstadoFactura" field.
  String? _estadoFactura;
  String get estadoFactura => _estadoFactura ?? '';
  bool hasEstadoFactura() => _estadoFactura != null;

  void _initializeFields() {
    _razonNombre = snapshotData['RazonNombre'] as String?;
    _nserie = snapshotData['Nserie'] as String?;
    _fecha = snapshotData['Fecha'] as DateTime?;
    _total = castToType<double>(snapshotData['Total']);
    _fPago = snapshotData['FPago'] as String?;
    _canje = snapshotData['Canje'] as String?;
    _usuario = snapshotData['Usuario'] as String?;
    _numCotizacion = snapshotData['NumCotizacion'] as String?;
    _estado = snapshotData['Estado'] as String?;
    _items = getStructList(
      snapshotData['Items'],
      FacturasArticulosStruct.fromMap,
    );
    _tipofactura = snapshotData['tipofactura'] as String?;
    _proveedor = snapshotData['proveedor'] as String?;
    _tipoOperacion = snapshotData['TipoOperacion'] as String?;
    _igv = snapshotData['igv'] as String?;
    _almacen = snapshotData['Almacen'] as String?;
    _estadoFactura = snapshotData['EstadoFactura'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FacturasVentasCompras');

  static Stream<FacturasVentasComprasRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => FacturasVentasComprasRecord.fromSnapshot(s));

  static Future<FacturasVentasComprasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => FacturasVentasComprasRecord.fromSnapshot(s));

  static FacturasVentasComprasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacturasVentasComprasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacturasVentasComprasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacturasVentasComprasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacturasVentasComprasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacturasVentasComprasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacturasVentasComprasRecordData({
  String? razonNombre,
  String? nserie,
  DateTime? fecha,
  double? total,
  String? fPago,
  String? canje,
  String? usuario,
  String? numCotizacion,
  String? estado,
  String? tipofactura,
  String? proveedor,
  String? tipoOperacion,
  String? igv,
  String? almacen,
  String? estadoFactura,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'RazonNombre': razonNombre,
      'Nserie': nserie,
      'Fecha': fecha,
      'Total': total,
      'FPago': fPago,
      'Canje': canje,
      'Usuario': usuario,
      'NumCotizacion': numCotizacion,
      'Estado': estado,
      'tipofactura': tipofactura,
      'proveedor': proveedor,
      'TipoOperacion': tipoOperacion,
      'igv': igv,
      'Almacen': almacen,
      'EstadoFactura': estadoFactura,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacturasVentasComprasRecordDocumentEquality
    implements Equality<FacturasVentasComprasRecord> {
  const FacturasVentasComprasRecordDocumentEquality();

  @override
  bool equals(
      FacturasVentasComprasRecord? e1, FacturasVentasComprasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.razonNombre == e2?.razonNombre &&
        e1?.nserie == e2?.nserie &&
        e1?.fecha == e2?.fecha &&
        e1?.total == e2?.total &&
        e1?.fPago == e2?.fPago &&
        e1?.canje == e2?.canje &&
        e1?.usuario == e2?.usuario &&
        e1?.numCotizacion == e2?.numCotizacion &&
        e1?.estado == e2?.estado &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.tipofactura == e2?.tipofactura &&
        e1?.proveedor == e2?.proveedor &&
        e1?.tipoOperacion == e2?.tipoOperacion &&
        e1?.igv == e2?.igv &&
        e1?.almacen == e2?.almacen &&
        e1?.estadoFactura == e2?.estadoFactura;
  }

  @override
  int hash(FacturasVentasComprasRecord? e) => const ListEquality().hash([
        e?.razonNombre,
        e?.nserie,
        e?.fecha,
        e?.total,
        e?.fPago,
        e?.canje,
        e?.usuario,
        e?.numCotizacion,
        e?.estado,
        e?.items,
        e?.tipofactura,
        e?.proveedor,
        e?.tipoOperacion,
        e?.igv,
        e?.almacen,
        e?.estadoFactura
      ]);

  @override
  bool isValidKey(Object? o) => o is FacturasVentasComprasRecord;
}
