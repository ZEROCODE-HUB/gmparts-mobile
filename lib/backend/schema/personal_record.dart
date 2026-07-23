import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PersonalRecord extends FirestoreRecord {
  PersonalRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numeroorden" field.
  int? _numeroorden;
  int get numeroorden => _numeroorden ?? 0;
  bool hasNumeroorden() => _numeroorden != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "DNI" field.
  String? _dni;
  String get dni => _dni ?? '';
  bool hasDni() => _dni != null;

  // "Razon_social" field.
  String? _razonSocial;
  String get razonSocial => _razonSocial ?? '';
  bool hasRazonSocial() => _razonSocial != null;

  // "Correo_electronico" field.
  String? _correoElectronico;
  String get correoElectronico => _correoElectronico ?? '';
  bool hasCorreoElectronico() => _correoElectronico != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "direccion_fiscal" field.
  String? _direccionFiscal;
  String get direccionFiscal => _direccionFiscal ?? '';
  bool hasDireccionFiscal() => _direccionFiscal != null;

  // "distrito" field.
  String? _distrito;
  String get distrito => _distrito ?? '';
  bool hasDistrito() => _distrito != null;

  // "provincias" field.
  String? _provincias;
  String get provincias => _provincias ?? '';
  bool hasProvincias() => _provincias != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "tipo_documento" field.
  String? _tipoDocumento;
  String get tipoDocumento => _tipoDocumento ?? '';
  bool hasTipoDocumento() => _tipoDocumento != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "edad" field.
  String? _edad;
  String get edad => _edad ?? '';
  bool hasEdad() => _edad != null;

  // "fecha_nacimiento" field.
  DateTime? _fechaNacimiento;
  DateTime? get fechaNacimiento => _fechaNacimiento;
  bool hasFechaNacimiento() => _fechaNacimiento != null;

  // "cargo_personal" field.
  String? _cargoPersonal;
  String get cargoPersonal => _cargoPersonal ?? '';
  bool hasCargoPersonal() => _cargoPersonal != null;

  // "cargo_empleado" field.
  String? _cargoEmpleado;
  String get cargoEmpleado => _cargoEmpleado ?? '';
  bool hasCargoEmpleado() => _cargoEmpleado != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  bool hasNombre() => _nombre != null;

  // "wsp" field.
  String? _wsp;
  String get wsp => _wsp ?? '';
  bool hasWsp() => _wsp != null;

  void _initializeFields() {
    _numeroorden = castToType<int>(snapshotData['numeroorden']);
    _telefono = snapshotData['telefono'] as String?;
    _dni = snapshotData['DNI'] as String?;
    _razonSocial = snapshotData['Razon_social'] as String?;
    _correoElectronico = snapshotData['Correo_electronico'] as String?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _direccionFiscal = snapshotData['direccion_fiscal'] as String?;
    _distrito = snapshotData['distrito'] as String?;
    _provincias = snapshotData['provincias'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _tipoDocumento = snapshotData['tipo_documento'] as String?;
    _sexo = snapshotData['sexo'] as String?;
    _edad = snapshotData['edad'] as String?;
    _fechaNacimiento = snapshotData['fecha_nacimiento'] as DateTime?;
    _cargoPersonal = snapshotData['cargo_personal'] as String?;
    _cargoEmpleado = snapshotData['cargo_empleado'] as String?;
    _nombre = snapshotData['nombre'] as String?;
    _wsp = snapshotData['wsp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('personal');

  static Stream<PersonalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PersonalRecord.fromSnapshot(s));

  static Future<PersonalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PersonalRecord.fromSnapshot(s));

  static PersonalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PersonalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PersonalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PersonalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PersonalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PersonalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPersonalRecordData({
  int? numeroorden,
  String? telefono,
  String? dni,
  String? razonSocial,
  String? correoElectronico,
  DateTime? fechaCreacion,
  String? direccionFiscal,
  String? distrito,
  String? provincias,
  String? departamento,
  String? tipoDocumento,
  String? sexo,
  String? edad,
  DateTime? fechaNacimiento,
  String? cargoPersonal,
  String? cargoEmpleado,
  String? nombre,
  String? wsp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numeroorden': numeroorden,
      'telefono': telefono,
      'DNI': dni,
      'Razon_social': razonSocial,
      'Correo_electronico': correoElectronico,
      'fecha_creacion': fechaCreacion,
      'direccion_fiscal': direccionFiscal,
      'distrito': distrito,
      'provincias': provincias,
      'departamento': departamento,
      'tipo_documento': tipoDocumento,
      'sexo': sexo,
      'edad': edad,
      'fecha_nacimiento': fechaNacimiento,
      'cargo_personal': cargoPersonal,
      'cargo_empleado': cargoEmpleado,
      'nombre': nombre,
      'wsp': wsp,
    }.withoutNulls,
  );

  return firestoreData;
}

class PersonalRecordDocumentEquality implements Equality<PersonalRecord> {
  const PersonalRecordDocumentEquality();

  @override
  bool equals(PersonalRecord? e1, PersonalRecord? e2) {
    return e1?.numeroorden == e2?.numeroorden &&
        e1?.telefono == e2?.telefono &&
        e1?.dni == e2?.dni &&
        e1?.razonSocial == e2?.razonSocial &&
        e1?.correoElectronico == e2?.correoElectronico &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.direccionFiscal == e2?.direccionFiscal &&
        e1?.distrito == e2?.distrito &&
        e1?.provincias == e2?.provincias &&
        e1?.departamento == e2?.departamento &&
        e1?.tipoDocumento == e2?.tipoDocumento &&
        e1?.sexo == e2?.sexo &&
        e1?.edad == e2?.edad &&
        e1?.fechaNacimiento == e2?.fechaNacimiento &&
        e1?.cargoPersonal == e2?.cargoPersonal &&
        e1?.cargoEmpleado == e2?.cargoEmpleado &&
        e1?.nombre == e2?.nombre &&
        e1?.wsp == e2?.wsp;
  }

  @override
  int hash(PersonalRecord? e) => const ListEquality().hash([
        e?.numeroorden,
        e?.telefono,
        e?.dni,
        e?.razonSocial,
        e?.correoElectronico,
        e?.fechaCreacion,
        e?.direccionFiscal,
        e?.distrito,
        e?.provincias,
        e?.departamento,
        e?.tipoDocumento,
        e?.sexo,
        e?.edad,
        e?.fechaNacimiento,
        e?.cargoPersonal,
        e?.cargoEmpleado,
        e?.nombre,
        e?.wsp
      ]);

  @override
  bool isValidKey(Object? o) => o is PersonalRecord;
}
