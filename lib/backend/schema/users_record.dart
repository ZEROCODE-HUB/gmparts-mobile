import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "tipo_de_persona" field.
  String? _tipoDePersona;
  String get tipoDePersona => _tipoDePersona ?? '';
  bool hasTipoDePersona() => _tipoDePersona != null;

  // "user_role" field.
  String? _userRole;
  String get userRole => _userRole ?? '';
  bool hasUserRole() => _userRole != null;

  // "IdentityDocument" field.
  String? _identityDocument;
  String get identityDocument => _identityDocument ?? '';
  bool hasIdentityDocument() => _identityDocument != null;

  // "direccion" field.
  String? _direccion;
  String get direccion => _direccion ?? '';
  bool hasDireccion() => _direccion != null;

  // "distrito" field.
  String? _distrito;
  String get distrito => _distrito ?? '';
  bool hasDistrito() => _distrito != null;

  // "provincia" field.
  String? _provincia;
  String get provincia => _provincia ?? '';
  bool hasProvincia() => _provincia != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "fecha_de_nacimiento" field.
  DateTime? _fechaDeNacimiento;
  DateTime? get fechaDeNacimiento => _fechaDeNacimiento;
  bool hasFechaDeNacimiento() => _fechaDeNacimiento != null;

  // "sexo" field.
  String? _sexo;
  String get sexo => _sexo ?? '';
  bool hasSexo() => _sexo != null;

  // "tipo_de_documento" field.
  String? _tipoDeDocumento;
  String get tipoDeDocumento => _tipoDeDocumento ?? '';
  bool hasTipoDeDocumento() => _tipoDeDocumento != null;

  // "edad" field.
  String? _edad;
  String get edad => _edad ?? '';
  bool hasEdad() => _edad != null;

  // "cargo_personal" field.
  String? _cargoPersonal;
  String get cargoPersonal => _cargoPersonal ?? '';
  bool hasCargoPersonal() => _cargoPersonal != null;

  // "cargo_empleado" field.
  String? _cargoEmpleado;
  String get cargoEmpleado => _cargoEmpleado ?? '';
  bool hasCargoEmpleado() => _cargoEmpleado != null;

  // "wsp" field.
  String? _wsp;
  String get wsp => _wsp ?? '';
  bool hasWsp() => _wsp != null;

  // "departamento" field.
  String? _departamento;
  String get departamento => _departamento ?? '';
  bool hasDepartamento() => _departamento != null;

  // "DNI" field.
  String? _dni;
  String get dni => _dni ?? '';
  bool hasDni() => _dni != null;

  // "RUC" field.
  String? _ruc;
  String get ruc => _ruc ?? '';
  bool hasRuc() => _ruc != null;

  DateTime? _toDateTime(dynamic value) {
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value);
    return null;
  }

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = _toDateTime(snapshotData['created_time']);
    _phoneNumber = snapshotData['phone_number'] as String?;
    _tipoDePersona = snapshotData['tipo_de_persona'] as String?;
    _userRole = snapshotData['user_role'] as String?;
    _identityDocument = snapshotData['IdentityDocument'] as String?;
    _direccion = snapshotData['direccion'] as String?;
    _distrito = snapshotData['distrito'] as String?;
    _provincia = snapshotData['provincia'] as String?;
    _codigo = snapshotData['codigo'] as String?;
    _fechaDeNacimiento = _toDateTime(snapshotData['fecha_de_nacimiento']);
    _sexo = snapshotData['sexo'] as String?;
    _tipoDeDocumento = snapshotData['tipo_de_documento'] as String?;
    _edad = snapshotData['edad'] as String?;
    _cargoPersonal = snapshotData['cargo_personal'] as String?;
    _cargoEmpleado = snapshotData['cargo_empleado'] as String?;
    _wsp = snapshotData['wsp'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _dni = snapshotData['DNI'] as String?;
    _ruc = snapshotData['RUC'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? tipoDePersona,
  String? userRole,
  String? identityDocument,
  String? direccion,
  String? distrito,
  String? provincia,
  String? codigo,
  DateTime? fechaDeNacimiento,
  String? sexo,
  String? tipoDeDocumento,
  String? edad,
  String? cargoPersonal,
  String? cargoEmpleado,
  String? wsp,
  String? departamento,
  String? dni,
  String? ruc,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'tipo_de_persona': tipoDePersona,
      'user_role': userRole,
      'IdentityDocument': identityDocument,
      'direccion': direccion,
      'distrito': distrito,
      'provincia': provincia,
      'codigo': codigo,
      'fecha_de_nacimiento': fechaDeNacimiento,
      'sexo': sexo,
      'tipo_de_documento': tipoDeDocumento,
      'edad': edad,
      'cargo_personal': cargoPersonal,
      'cargo_empleado': cargoEmpleado,
      'wsp': wsp,
      'departamento': departamento,
      'DNI': dni,
      'RUC': ruc,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.tipoDePersona == e2?.tipoDePersona &&
        e1?.userRole == e2?.userRole &&
        e1?.identityDocument == e2?.identityDocument &&
        e1?.direccion == e2?.direccion &&
        e1?.distrito == e2?.distrito &&
        e1?.provincia == e2?.provincia &&
        e1?.codigo == e2?.codigo &&
        e1?.fechaDeNacimiento == e2?.fechaDeNacimiento &&
        e1?.sexo == e2?.sexo &&
        e1?.tipoDeDocumento == e2?.tipoDeDocumento &&
        e1?.edad == e2?.edad &&
        e1?.cargoPersonal == e2?.cargoPersonal &&
        e1?.cargoEmpleado == e2?.cargoEmpleado &&
        e1?.wsp == e2?.wsp &&
        e1?.departamento == e2?.departamento &&
        e1?.dni == e2?.dni &&
        e1?.ruc == e2?.ruc;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.tipoDePersona,
        e?.userRole,
        e?.identityDocument,
        e?.direccion,
        e?.distrito,
        e?.provincia,
        e?.codigo,
        e?.fechaDeNacimiento,
        e?.sexo,
        e?.tipoDeDocumento,
        e?.edad,
        e?.cargoPersonal,
        e?.cargoEmpleado,
        e?.wsp,
        e?.departamento,
        e?.dni,
        e?.ruc
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
