import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehiculosRecord extends FirestoreRecord {
  VehiculosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Placa" field.
  String? _placa;
  String get placa => _placa ?? '';
  bool hasPlaca() => _placa != null;

  // "Propietario" field.
  DocumentReference? _propietario;
  DocumentReference? get propietario => _propietario;
  bool hasPropietario() => _propietario != null;

  // "Marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "Modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "TipoMotor" field.
  String? _tipoMotor;
  String get tipoMotor => _tipoMotor ?? '';
  bool hasTipoMotor() => _tipoMotor != null;

  // "Almacen" field.
  DocumentReference? _almacen;
  DocumentReference? get almacen => _almacen;
  bool hasAlmacen() => _almacen != null;

  // "Estado" field.
  String? _estado;
  String get estado => _estado ?? '';
  bool hasEstado() => _estado != null;

  // "anio_de_fabricion" field.
  String? _anioDeFabricion;
  String get anioDeFabricion => _anioDeFabricion ?? '';
  bool hasAnioDeFabricion() => _anioDeFabricion != null;

  // "Propietario_name" field.
  String? _propietarioName;
  String get propietarioName => _propietarioName ?? '';
  bool hasPropietarioName() => _propietarioName != null;

  // "Propietario_Document" field.
  String? _propietarioDocument;
  String get propietarioDocument => _propietarioDocument ?? '';
  bool hasPropietarioDocument() => _propietarioDocument != null;

  // "Propietario_Type" field.
  String? _propietarioType;
  String get propietarioType => _propietarioType ?? '';
  bool hasPropietarioType() => _propietarioType != null;

  // "Proveedor" field.
  DocumentReference? _proveedor;
  DocumentReference? get proveedor => _proveedor;
  bool hasProveedor() => _proveedor != null;

  // "Proveedor_document" field.
  String? _proveedorDocument;
  String get proveedorDocument => _proveedorDocument ?? '';
  bool hasProveedorDocument() => _proveedorDocument != null;

  // "Version" field.
  String? _version;
  String get version => _version ?? '';
  bool hasVersion() => _version != null;

  // "aniodemodelo" field.
  String? _aniodemodelo;
  String get aniodemodelo => _aniodemodelo ?? '';
  bool hasAniodemodelo() => _aniodemodelo != null;

  // "Color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "NroMotor" field.
  String? _nroMotor;
  String get nroMotor => _nroMotor ?? '';
  bool hasNroMotor() => _nroMotor != null;

  // "VIN_Serie" field.
  String? _vINSerie;
  String get vINSerie => _vINSerie ?? '';
  bool hasVINSerie() => _vINSerie != null;

  // "TipoCombustible" field.
  String? _tipoCombustible;
  String get tipoCombustible => _tipoCombustible ?? '';
  bool hasTipoCombustible() => _tipoCombustible != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "Carroceria" field.
  String? _carroceria;
  String get carroceria => _carroceria ?? '';
  bool hasCarroceria() => _carroceria != null;

  // "SOAT_Expiration" field.
  DateTime? _sOATExpiration;
  DateTime? get sOATExpiration => _sOATExpiration;
  bool hasSOATExpiration() => _sOATExpiration != null;

  // "ITV_Expiration" field.
  DateTime? _iTVExpiration;
  DateTime? get iTVExpiration => _iTVExpiration;
  bool hasITVExpiration() => _iTVExpiration != null;

  // "GNV_Expiration" field.
  DateTime? _gNVExpiration;
  DateTime? get gNVExpiration => _gNVExpiration;
  bool hasGNVExpiration() => _gNVExpiration != null;

  // "Transmision" field.
  String? _transmision;
  String get transmision => _transmision ?? '';
  bool hasTransmision() => _transmision != null;

  // "FormRodante" field.
  String? _formRodante;
  String get formRodante => _formRodante ?? '';
  bool hasFormRodante() => _formRodante != null;

  void _initializeFields() {
    _placa = snapshotData['Placa'] as String?;
    _propietario = snapshotData['Propietario'] as DocumentReference?;
    _marca = snapshotData['Marca'] as String?;
    _modelo = snapshotData['Modelo'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _tipoMotor = snapshotData['TipoMotor'] as String?;
    _almacen = snapshotData['Almacen'] as DocumentReference?;
    _estado = snapshotData['Estado'] as String?;
    _anioDeFabricion = snapshotData['anio_de_fabricion'] as String?;
    _propietarioName = snapshotData['Propietario_name'] as String?;
    _propietarioDocument = snapshotData['Propietario_Document'] as String?;
    _propietarioType = snapshotData['Propietario_Type'] as String?;
    _proveedor = snapshotData['Proveedor'] as DocumentReference?;
    _proveedorDocument = snapshotData['Proveedor_document'] as String?;
    _version = snapshotData['Version'] as String?;
    _aniodemodelo = snapshotData['aniodemodelo'] as String?;
    _color = snapshotData['Color'] as String?;
    _nroMotor = snapshotData['NroMotor'] as String?;
    _vINSerie = snapshotData['VIN_Serie'] as String?;
    _tipoCombustible = snapshotData['TipoCombustible'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _carroceria = snapshotData['Carroceria'] as String?;
    _sOATExpiration = snapshotData['SOAT_Expiration'] as DateTime?;
    _iTVExpiration = snapshotData['ITV_Expiration'] as DateTime?;
    _gNVExpiration = snapshotData['GNV_Expiration'] as DateTime?;
    _transmision = snapshotData['Transmision'] as String?;
    _formRodante = snapshotData['FormRodante'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Vehiculos');

  static Stream<VehiculosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehiculosRecord.fromSnapshot(s));

  static Future<VehiculosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehiculosRecord.fromSnapshot(s));

  static VehiculosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehiculosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehiculosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehiculosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehiculosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehiculosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehiculosRecordData({
  String? placa,
  DocumentReference? propietario,
  String? marca,
  String? modelo,
  String? descripcion,
  String? tipoMotor,
  DocumentReference? almacen,
  String? estado,
  String? anioDeFabricion,
  String? propietarioName,
  String? propietarioDocument,
  String? propietarioType,
  DocumentReference? proveedor,
  String? proveedorDocument,
  String? version,
  String? aniodemodelo,
  String? color,
  String? nroMotor,
  String? vINSerie,
  String? tipoCombustible,
  String? categoria,
  String? carroceria,
  DateTime? sOATExpiration,
  DateTime? iTVExpiration,
  DateTime? gNVExpiration,
  String? transmision,
  String? formRodante,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Placa': placa,
      'Propietario': propietario,
      'Marca': marca,
      'Modelo': modelo,
      'Descripcion': descripcion,
      'TipoMotor': tipoMotor,
      'Almacen': almacen,
      'Estado': estado,
      'anio_de_fabricion': anioDeFabricion,
      'Propietario_name': propietarioName,
      'Propietario_Document': propietarioDocument,
      'Propietario_Type': propietarioType,
      'Proveedor': proveedor,
      'Proveedor_document': proveedorDocument,
      'Version': version,
      'aniodemodelo': aniodemodelo,
      'Color': color,
      'NroMotor': nroMotor,
      'VIN_Serie': vINSerie,
      'TipoCombustible': tipoCombustible,
      'Categoria': categoria,
      'Carroceria': carroceria,
      'SOAT_Expiration': sOATExpiration,
      'ITV_Expiration': iTVExpiration,
      'GNV_Expiration': gNVExpiration,
      'Transmision': transmision,
      'FormRodante': formRodante,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehiculosRecordDocumentEquality implements Equality<VehiculosRecord> {
  const VehiculosRecordDocumentEquality();

  @override
  bool equals(VehiculosRecord? e1, VehiculosRecord? e2) {
    return e1?.placa == e2?.placa &&
        e1?.propietario == e2?.propietario &&
        e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.tipoMotor == e2?.tipoMotor &&
        e1?.almacen == e2?.almacen &&
        e1?.estado == e2?.estado &&
        e1?.anioDeFabricion == e2?.anioDeFabricion &&
        e1?.propietarioName == e2?.propietarioName &&
        e1?.propietarioDocument == e2?.propietarioDocument &&
        e1?.propietarioType == e2?.propietarioType &&
        e1?.proveedor == e2?.proveedor &&
        e1?.proveedorDocument == e2?.proveedorDocument &&
        e1?.version == e2?.version &&
        e1?.aniodemodelo == e2?.aniodemodelo &&
        e1?.color == e2?.color &&
        e1?.nroMotor == e2?.nroMotor &&
        e1?.vINSerie == e2?.vINSerie &&
        e1?.tipoCombustible == e2?.tipoCombustible &&
        e1?.categoria == e2?.categoria &&
        e1?.carroceria == e2?.carroceria &&
        e1?.sOATExpiration == e2?.sOATExpiration &&
        e1?.iTVExpiration == e2?.iTVExpiration &&
        e1?.gNVExpiration == e2?.gNVExpiration &&
        e1?.transmision == e2?.transmision &&
        e1?.formRodante == e2?.formRodante;
  }

  @override
  int hash(VehiculosRecord? e) => const ListEquality().hash([
        e?.placa,
        e?.propietario,
        e?.marca,
        e?.modelo,
        e?.descripcion,
        e?.tipoMotor,
        e?.almacen,
        e?.estado,
        e?.anioDeFabricion,
        e?.propietarioName,
        e?.propietarioDocument,
        e?.propietarioType,
        e?.proveedor,
        e?.proveedorDocument,
        e?.version,
        e?.aniodemodelo,
        e?.color,
        e?.nroMotor,
        e?.vINSerie,
        e?.tipoCombustible,
        e?.categoria,
        e?.carroceria,
        e?.sOATExpiration,
        e?.iTVExpiration,
        e?.gNVExpiration,
        e?.transmision,
        e?.formRodante
      ]);

  @override
  bool isValidKey(Object? o) => o is VehiculosRecord;
}
