import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProveedoresRecord extends FirestoreRecord {
  ProveedoresRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "Documento" field.
  String? _documento;
  String get documento => _documento ?? '';
  bool hasDocumento() => _documento != null;

  // "razon_social" field.
  String? _razonSocial;
  String get razonSocial => _razonSocial ?? '';
  bool hasRazonSocial() => _razonSocial != null;

  // "dirreccion_fiscal" field.
  String? _dirreccionFiscal;
  String get dirreccionFiscal => _dirreccionFiscal ?? '';
  bool hasDirreccionFiscal() => _dirreccionFiscal != null;

  // "correo" field.
  String? _correo;
  String get correo => _correo ?? '';
  bool hasCorreo() => _correo != null;

  // "celular" field.
  int? _celular;
  int get celular => _celular ?? 0;
  bool hasCelular() => _celular != null;

  // "create_time" field.
  DateTime? _createTime;
  DateTime? get createTime => _createTime;
  bool hasCreateTime() => _createTime != null;

  // "item" field.
  int? _item;
  int get item => _item ?? 0;
  bool hasItem() => _item != null;

  // "ruc" field.
  String? _ruc;
  String get ruc => _ruc ?? '';
  bool hasRuc() => _ruc != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "wps" field.
  String? _wps;
  String get wps => _wps ?? '';
  bool hasWps() => _wps != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "distrito" field.
  String? _distrito;
  String get distrito => _distrito ?? '';
  bool hasDistrito() => _distrito != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "uuid" field.
  String? _uuid;
  String get uuid => _uuid ?? '';
  bool hasUuid() => _uuid != null;

  void _initializeFields() {
    _nombre = snapshotData['nombre'] as String?;
    _documento = snapshotData['Documento'] as String?;
    _razonSocial = snapshotData['razon_social'] as String?;
    _dirreccionFiscal = snapshotData['dirreccion_fiscal'] as String?;
    _correo = snapshotData['correo'] as String?;
    _celular = castToType<int>(snapshotData['celular']);
    _createTime = snapshotData['create_time'] as DateTime?;
    _item = castToType<int>(snapshotData['item']);
    _ruc = snapshotData['ruc'] as String?;
    _website = snapshotData['website'] as String?;
    _categoria = snapshotData['categoria'] as String?;
    _wps = snapshotData['wps'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _distrito = snapshotData['distrito'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _uuid = snapshotData['uuid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Proveedores');

  static Stream<ProveedoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProveedoresRecord.fromSnapshot(s));

  static Future<ProveedoresRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProveedoresRecord.fromSnapshot(s));

  static ProveedoresRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProveedoresRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProveedoresRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProveedoresRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProveedoresRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProveedoresRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProveedoresRecordData({
  String? nombre,
  String? documento,
  String? razonSocial,
  String? dirreccionFiscal,
  String? correo,
  int? celular,
  DateTime? createTime,
  int? item,
  String? ruc,
  String? website,
  String? categoria,
  String? wps,
  String? provincia,
  String? distrito,
  String? departamento,
  String? uuid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nombre': nombre,
      'Documento': documento,
      'razon_social': razonSocial,
      'dirreccion_fiscal': dirreccionFiscal,
      'correo': correo,
      'celular': celular,
      'create_time': createTime,
      'item': item,
      'ruc': ruc,
      'website': website,
      'categoria': categoria,
      'wps': wps,
      'provincia': provincia,
      'distrito': distrito,
      'departamento': departamento,
      'uuid': uuid,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProveedoresRecordDocumentEquality implements Equality<ProveedoresRecord> {
  const ProveedoresRecordDocumentEquality();

  @override
  bool equals(ProveedoresRecord? e1, ProveedoresRecord? e2) {
    return e1?.nombre == e2?.nombre &&
        e1?.documento == e2?.documento &&
        e1?.razonSocial == e2?.razonSocial &&
        e1?.dirreccionFiscal == e2?.dirreccionFiscal &&
        e1?.correo == e2?.correo &&
        e1?.celular == e2?.celular &&
        e1?.createTime == e2?.createTime &&
        e1?.item == e2?.item &&
        e1?.ruc == e2?.ruc &&
        e1?.website == e2?.website &&
        e1?.categoria == e2?.categoria &&
        e1?.wps == e2?.wps &&
        e1?.provincia == e2?.provincia &&
        e1?.distrito == e2?.distrito &&
        e1?.departamento == e2?.departamento &&
        e1?.uuid == e2?.uuid;
  }

  @override
  int hash(ProveedoresRecord? e) => const ListEquality().hash([
        e?.nombre,
        e?.documento,
        e?.razonSocial,
        e?.dirreccionFiscal,
        e?.correo,
        e?.celular,
        e?.createTime,
        e?.item,
        e?.ruc,
        e?.website,
        e?.categoria,
        e?.wps,
        e?.provincia,
        e?.distrito,
        e?.departamento,
        e?.uuid
      ]);

  @override
  bool isValidKey(Object? o) => o is ProveedoresRecord;
}
