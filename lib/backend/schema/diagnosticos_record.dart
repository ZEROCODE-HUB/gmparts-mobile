import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DiagnosticosRecord extends FirestoreRecord {
  DiagnosticosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Nombre_falla" field.
  String? _nombreFalla;
  String get nombreFalla => _nombreFalla ?? '';
  bool hasNombreFalla() => _nombreFalla != null;

  // "Solucion" field.
  String? _solucion;
  String get solucion => _solucion ?? '';
  bool hasSolucion() => _solucion != null;

  // "Tiempo_estimado" field.
  String? _tiempoEstimado;
  String get tiempoEstimado => _tiempoEstimado ?? '';
  bool hasTiempoEstimado() => _tiempoEstimado != null;

  // "Fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "Repuestos" field.
  List<RepuestosStruct>? _repuestos;
  List<RepuestosStruct> get repuestos => _repuestos ?? const [];
  bool hasRepuestos() => _repuestos != null;

  // "Subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "IGV" field.
  double? _igv;
  double get igv => _igv ?? 0.0;
  bool hasIgv() => _igv != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "Comentarios" field.
  String? _comentarios;
  String get comentarios => _comentarios ?? '';
  bool hasComentarios() => _comentarios != null;

  // "Fotosfinalizar" field.
  List<String>? _fotosfinalizar;
  List<String> get fotosfinalizar => _fotosfinalizar ?? const [];
  bool hasFotosfinalizar() => _fotosfinalizar != null;

  // "Finalizado" field.
  bool? _finalizado;
  bool get finalizado => _finalizado ?? false;
  bool hasFinalizado() => _finalizado != null;

  // "Horas_trabajo" field.
  double? _horasTrabajo;
  double get horasTrabajo => _horasTrabajo ?? 0.0;
  bool hasHorasTrabajo() => _horasTrabajo != null;

  // "Mano_de_obra" field.
  double? _manoDeObra;
  double get manoDeObra => _manoDeObra ?? 0.0;
  bool hasManoDeObra() => _manoDeObra != null;

  // "Tiempo_finalizado" field.
  double? _tiempoFinalizado;
  double get tiempoFinalizado => _tiempoFinalizado ?? 0.0;
  bool hasTiempoFinalizado() => _tiempoFinalizado != null;

  // "Comentarios_finalizado" field.
  String? _comentariosFinalizado;
  String get comentariosFinalizado => _comentariosFinalizado ?? '';
  bool hasComentariosFinalizado() => _comentariosFinalizado != null;

  // "imagenes_finalizado" field.
  List<String>? _imagenesFinalizado;
  List<String> get imagenesFinalizado => _imagenesFinalizado ?? const [];
  bool hasImagenesFinalizado() => _imagenesFinalizado != null;

  // "Imagenes_cotizacion" field.
  List<String>? _imagenesCotizacion;
  List<String> get imagenesCotizacion => _imagenesCotizacion ?? const [];
  bool hasImagenesCotizacion() => _imagenesCotizacion != null;

  // "Aprobacion_cliente" field.
  bool? _aprobacionCliente;
  bool get aprobacionCliente => _aprobacionCliente ?? false;
  bool hasAprobacionCliente() => _aprobacionCliente != null;

  // "repuests_articles" field.
  List<DocumentReference>? _repuestsArticles;
  List<DocumentReference> get repuestsArticles => _repuestsArticles ?? const [];
  bool hasRepuestsArticles() => _repuestsArticles != null;

  // "fecha" field.
  DateTime? _fecha;
  DateTime? get fecha => _fecha;
  bool hasFecha() => _fecha != null;

  // "precioservicio" field.
  double? _precioservicio;
  double get precioservicio => _precioservicio ?? 0.0;
  bool hasPrecioservicio() => _precioservicio != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _nombreFalla = snapshotData['Nombre_falla'] as String?;
    _solucion = snapshotData['Solucion'] as String?;
    _tiempoEstimado = snapshotData['Tiempo_estimado'] as String?;
    _fotos = getDataList(snapshotData['Fotos']);
    _repuestos = getStructList(
      snapshotData['Repuestos'],
      RepuestosStruct.fromMap,
    );
    _subtotal = castToType<double>(snapshotData['Subtotal']);
    _igv = castToType<double>(snapshotData['IGV']);
    _total = castToType<double>(snapshotData['Total']);
    _comentarios = snapshotData['Comentarios'] as String?;
    _fotosfinalizar = getDataList(snapshotData['Fotosfinalizar']);
    _finalizado = snapshotData['Finalizado'] as bool?;
    _horasTrabajo = castToType<double>(snapshotData['Horas_trabajo']);
    _manoDeObra = castToType<double>(snapshotData['Mano_de_obra']);
    _tiempoFinalizado = castToType<double>(snapshotData['Tiempo_finalizado']);
    _comentariosFinalizado = snapshotData['Comentarios_finalizado'] as String?;
    _imagenesFinalizado = getDataList(snapshotData['imagenes_finalizado']);
    _imagenesCotizacion = getDataList(snapshotData['Imagenes_cotizacion']);
    _aprobacionCliente = snapshotData['Aprobacion_cliente'] as bool?;
    _repuestsArticles = getDataList(snapshotData['repuests_articles']);
    _fecha = snapshotData['fecha'] as DateTime?;
    _precioservicio = castToType<double>(snapshotData['precioservicio']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('diagnosticos')
          : FirebaseFirestore.instance.collectionGroup('diagnosticos');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('diagnosticos').doc(id);

  static Stream<DiagnosticosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DiagnosticosRecord.fromSnapshot(s));

  static Future<DiagnosticosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DiagnosticosRecord.fromSnapshot(s));

  static DiagnosticosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DiagnosticosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DiagnosticosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DiagnosticosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DiagnosticosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DiagnosticosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDiagnosticosRecordData({
  String? nombreFalla,
  String? solucion,
  String? tiempoEstimado,
  double? subtotal,
  double? igv,
  double? total,
  String? comentarios,
  bool? finalizado,
  double? horasTrabajo,
  double? manoDeObra,
  double? tiempoFinalizado,
  String? comentariosFinalizado,
  bool? aprobacionCliente,
  DateTime? fecha,
  double? precioservicio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Nombre_falla': nombreFalla,
      'Solucion': solucion,
      'Tiempo_estimado': tiempoEstimado,
      'Subtotal': subtotal,
      'IGV': igv,
      'Total': total,
      'Comentarios': comentarios,
      'Finalizado': finalizado,
      'Horas_trabajo': horasTrabajo,
      'Mano_de_obra': manoDeObra,
      'Tiempo_finalizado': tiempoFinalizado,
      'Comentarios_finalizado': comentariosFinalizado,
      'Aprobacion_cliente': aprobacionCliente,
      'fecha': fecha,
      'precioservicio': precioservicio,
    }.withoutNulls,
  );

  return firestoreData;
}

class DiagnosticosRecordDocumentEquality
    implements Equality<DiagnosticosRecord> {
  const DiagnosticosRecordDocumentEquality();

  @override
  bool equals(DiagnosticosRecord? e1, DiagnosticosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nombreFalla == e2?.nombreFalla &&
        e1?.solucion == e2?.solucion &&
        e1?.tiempoEstimado == e2?.tiempoEstimado &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        listEquality.equals(e1?.repuestos, e2?.repuestos) &&
        e1?.subtotal == e2?.subtotal &&
        e1?.igv == e2?.igv &&
        e1?.total == e2?.total &&
        e1?.comentarios == e2?.comentarios &&
        listEquality.equals(e1?.fotosfinalizar, e2?.fotosfinalizar) &&
        e1?.finalizado == e2?.finalizado &&
        e1?.horasTrabajo == e2?.horasTrabajo &&
        e1?.manoDeObra == e2?.manoDeObra &&
        e1?.tiempoFinalizado == e2?.tiempoFinalizado &&
        e1?.comentariosFinalizado == e2?.comentariosFinalizado &&
        listEquality.equals(e1?.imagenesFinalizado, e2?.imagenesFinalizado) &&
        listEquality.equals(e1?.imagenesCotizacion, e2?.imagenesCotizacion) &&
        e1?.aprobacionCliente == e2?.aprobacionCliente &&
        listEquality.equals(e1?.repuestsArticles, e2?.repuestsArticles) &&
        e1?.fecha == e2?.fecha &&
        e1?.precioservicio == e2?.precioservicio;
  }

  @override
  int hash(DiagnosticosRecord? e) => const ListEquality().hash([
        e?.nombreFalla,
        e?.solucion,
        e?.tiempoEstimado,
        e?.fotos,
        e?.repuestos,
        e?.subtotal,
        e?.igv,
        e?.total,
        e?.comentarios,
        e?.fotosfinalizar,
        e?.finalizado,
        e?.horasTrabajo,
        e?.manoDeObra,
        e?.tiempoFinalizado,
        e?.comentariosFinalizado,
        e?.imagenesFinalizado,
        e?.imagenesCotizacion,
        e?.aprobacionCliente,
        e?.repuestsArticles,
        e?.fecha,
        e?.precioservicio
      ]);

  @override
  bool isValidKey(Object? o) => o is DiagnosticosRecord;
}
