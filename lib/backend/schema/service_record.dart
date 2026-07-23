import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceRecord extends FirestoreRecord {
  ServiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  bool hasCodigo() => _codigo != null;

  // "Descripcion" field.
  String? _descripcion;
  String get descripcion => _descripcion ?? '';
  bool hasDescripcion() => _descripcion != null;

  // "Precio" field.
  double? _precio;
  double get precio => _precio ?? 0.0;
  bool hasPrecio() => _precio != null;

  // "Note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "Currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "Alert_in_days" field.
  String? _alertInDays;
  String get alertInDays => _alertInDays ?? '';
  bool hasAlertInDays() => _alertInDays != null;

  // "marcabrand" field.
  String? _marcabrand;
  String get marcabrand => _marcabrand ?? '';
  bool hasMarcabrand() => _marcabrand != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  // "Sistema" field.
  String? _sistema;
  String get sistema => _sistema ?? '';
  bool hasSistema() => _sistema != null;

  // "Tipo_de_servicio" field.
  String? _tipoDeServicio;
  String get tipoDeServicio => _tipoDeServicio ?? '';
  bool hasTipoDeServicio() => _tipoDeServicio != null;

  // "Categoria_MTC" field.
  String? _categoriaMTC;
  String get categoriaMTC => _categoriaMTC ?? '';
  bool hasCategoriaMTC() => _categoriaMTC != null;

  // "Tipo_de_vehiculo" field.
  String? _tipoDeVehiculo;
  String get tipoDeVehiculo => _tipoDeVehiculo ?? '';
  bool hasTipoDeVehiculo() => _tipoDeVehiculo != null;

  // "Carroceria" field.
  String? _carroceria;
  String get carroceria => _carroceria ?? '';
  bool hasCarroceria() => _carroceria != null;

  void _initializeFields() {
    _codigo = snapshotData['Codigo'] as String?;
    _descripcion = snapshotData['Descripcion'] as String?;
    _precio = castToType<double>(snapshotData['Precio']);
    _note = snapshotData['Note'] as String?;
    _currency = snapshotData['Currency'] as String?;
    _alertInDays = snapshotData['Alert_in_days'] as String?;
    _marcabrand = snapshotData['marcabrand'] as String?;
    _model = snapshotData['model'] as String?;
    _year = snapshotData['year'] as String?;
    _sistema = snapshotData['Sistema'] as String?;
    _tipoDeServicio = snapshotData['Tipo_de_servicio'] as String?;
    _categoriaMTC = snapshotData['Categoria_MTC'] as String?;
    _tipoDeVehiculo = snapshotData['Tipo_de_vehiculo'] as String?;
    _carroceria = snapshotData['Carroceria'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service');

  static Stream<ServiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceRecord.fromSnapshot(s));

  static Future<ServiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceRecord.fromSnapshot(s));

  static ServiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceRecordData({
  String? codigo,
  String? descripcion,
  double? precio,
  String? note,
  String? currency,
  String? alertInDays,
  String? marcabrand,
  String? model,
  String? year,
  String? sistema,
  String? tipoDeServicio,
  String? categoriaMTC,
  String? tipoDeVehiculo,
  String? carroceria,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Codigo': codigo,
      'Descripcion': descripcion,
      'Precio': precio,
      'Note': note,
      'Currency': currency,
      'Alert_in_days': alertInDays,
      'marcabrand': marcabrand,
      'model': model,
      'year': year,
      'Sistema': sistema,
      'Tipo_de_servicio': tipoDeServicio,
      'Categoria_MTC': categoriaMTC,
      'Tipo_de_vehiculo': tipoDeVehiculo,
      'Carroceria': carroceria,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceRecordDocumentEquality implements Equality<ServiceRecord> {
  const ServiceRecordDocumentEquality();

  @override
  bool equals(ServiceRecord? e1, ServiceRecord? e2) {
    return e1?.codigo == e2?.codigo &&
        e1?.descripcion == e2?.descripcion &&
        e1?.precio == e2?.precio &&
        e1?.note == e2?.note &&
        e1?.currency == e2?.currency &&
        e1?.alertInDays == e2?.alertInDays &&
        e1?.marcabrand == e2?.marcabrand &&
        e1?.model == e2?.model &&
        e1?.year == e2?.year &&
        e1?.sistema == e2?.sistema &&
        e1?.tipoDeServicio == e2?.tipoDeServicio &&
        e1?.categoriaMTC == e2?.categoriaMTC &&
        e1?.tipoDeVehiculo == e2?.tipoDeVehiculo &&
        e1?.carroceria == e2?.carroceria;
  }

  @override
  int hash(ServiceRecord? e) => const ListEquality().hash([
        e?.codigo,
        e?.descripcion,
        e?.precio,
        e?.note,
        e?.currency,
        e?.alertInDays,
        e?.marcabrand,
        e?.model,
        e?.year,
        e?.sistema,
        e?.tipoDeServicio,
        e?.categoriaMTC,
        e?.tipoDeVehiculo,
        e?.carroceria
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceRecord;
}
