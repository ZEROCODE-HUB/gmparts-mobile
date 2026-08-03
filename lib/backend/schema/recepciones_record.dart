import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RecepcionesRecord extends FirestoreRecord {
  RecepcionesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "numeroorden" field.
  int? _numeroorden;
  int get numeroorden => _numeroorden ?? 0;
  bool hasNumeroorden() => _numeroorden != null;

  // "tipo_persona" field.
  String? _tipoPersona;
  String get tipoPersona => _tipoPersona ?? '';
  bool hasTipoPersona() => _tipoPersona != null;

  // "nombre_cliente" field.
  String? _nombreCliente;
  String get nombreCliente => _nombreCliente ?? '';
  bool hasNombreCliente() => _nombreCliente != null;

  // "telefono" field.
  String? _telefono;
  String get telefono => _telefono ?? '';
  bool hasTelefono() => _telefono != null;

  // "placa" field.
  String? _placa;
  String get placa => _placa ?? '';
  bool hasPlaca() => _placa != null;

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "modelo" field.
  String? _modelo;
  String get modelo => _modelo ?? '';
  bool hasModelo() => _modelo != null;

  // "km_ingreso" field.
  String? _kmIngreso;
  String get kmIngreso => _kmIngreso ?? '';
  bool hasKmIngreso() => _kmIngreso != null;

  // "tecnico_servicio" field.
  String? _tecnicoServicio;
  String get tecnicoServicio => _tecnicoServicio ?? '';
  bool hasTecnicoServicio() => _tecnicoServicio != null;

  // "tipo_servicio" field.
  String? _tipoServicio;
  String get tipoServicio => _tipoServicio ?? '';
  bool hasTipoServicio() => _tipoServicio != null;

  // "motivo_ingreso" field.
  String? _motivoIngreso;
  String get motivoIngreso => _motivoIngreso ?? '';
  bool hasMotivoIngreso() => _motivoIngreso != null;

  // "fotos" field.
  List<String>? _fotos;
  List<String> get fotos => _fotos ?? const [];
  bool hasFotos() => _fotos != null;

  // "DNI" field.
  String? _dni;
  String get dni => _dni ?? '';
  bool hasDni() => _dni != null;

  // "RUCempresa" field.
  String? _rUCempresa;
  String get rUCempresa => _rUCempresa ?? '';
  bool hasRUCempresa() => _rUCempresa != null;

  // "Razon_social" field.
  String? _razonSocial;
  String get razonSocial => _razonSocial ?? '';
  bool hasRazonSocial() => _razonSocial != null;

  // "Nombre_encargado" field.
  String? _nombreEncargado;
  String get nombreEncargado => _nombreEncargado ?? '';
  bool hasNombreEncargado() => _nombreEncargado != null;

  // "Correo_electronico" field.
  String? _correoElectronico;
  String get correoElectronico => _correoElectronico ?? '';
  bool hasCorreoElectronico() => _correoElectronico != null;

  // "Numero_VIN" field.
  String? _numeroVIN;
  String get numeroVIN => _numeroVIN ?? '';
  bool hasNumeroVIN() => _numeroVIN != null;

  // "Ano_fabricacion" field.
  String? _anoFabricacion;
  String get anoFabricacion => _anoFabricacion ?? '';
  bool hasAnoFabricacion() => _anoFabricacion != null;

  // "Nivel_combustible" field.
  String? _nivelCombustible;
  String get nivelCombustible => _nivelCombustible ?? '';
  bool hasNivelCombustible() => _nivelCombustible != null;

  // "Observaciones_adicionales" field.
  String? _observacionesAdicionales;
  String get observacionesAdicionales => _observacionesAdicionales ?? '';
  bool hasObservacionesAdicionales() => _observacionesAdicionales != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "aprobacion_cliente" field.
  bool? _aprobacionCliente;
  bool get aprobacionCliente => _aprobacionCliente ?? false;
  bool hasAprobacionCliente() => _aprobacionCliente != null;

  // "fecha_creacion" field.
  DateTime? _fechaCreacion;
  DateTime? get fechaCreacion => _fechaCreacion;
  bool hasFechaCreacion() => _fechaCreacion != null;

  // "Subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "Total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "IGV" field.
  double? _igv;
  double get igv => _igv ?? 0.0;
  bool hasIgv() => _igv != null;

  // "aprobacion_cotizacion" field.
  bool? _aprobacionCotizacion;
  bool get aprobacionCotizacion => _aprobacionCotizacion ?? false;
  bool hasAprobacionCotizacion() => _aprobacionCotizacion != null;

  // "Inventario" field.
  List<String>? _inventario;
  List<String> get inventario => _inventario ?? const [];
  bool hasInventario() => _inventario != null;

  // "fotos_finalizacion" field.
  List<String>? _fotosFinalizacion;
  List<String> get fotosFinalizacion => _fotosFinalizacion ?? const [];
  bool hasFotosFinalizacion() => _fotosFinalizacion != null;

  // "comentarios_finalizacion" field.
  String? _comentariosFinalizacion;
  String get comentariosFinalizacion => _comentariosFinalizacion ?? '';
  bool hasComentariosFinalizacion() => _comentariosFinalizacion != null;

  // "Controlcalidad1" field.
  String? _controlcalidad1;
  String get controlcalidad1 => _controlcalidad1 ?? '';
  bool hasControlcalidad1() => _controlcalidad1 != null;

  // "Controlcalidad2" field.
  String? _controlcalidad2;
  String get controlcalidad2 => _controlcalidad2 ?? '';
  bool hasControlcalidad2() => _controlcalidad2 != null;

  // "Controlcalidad3" field.
  String? _controlcalidad3;
  String get controlcalidad3 => _controlcalidad3 ?? '';
  bool hasControlcalidad3() => _controlcalidad3 != null;

  // "Clientecontrolcalidad1" field.
  String? _clientecontrolcalidad1;
  String get clientecontrolcalidad1 => _clientecontrolcalidad1 ?? '';
  bool hasClientecontrolcalidad1() => _clientecontrolcalidad1 != null;

  // "Clientecontrolcalidad2" field.
  String? _clientecontrolcalidad2;
  String get clientecontrolcalidad2 => _clientecontrolcalidad2 ?? '';
  bool hasClientecontrolcalidad2() => _clientecontrolcalidad2 != null;

  // "Clientecontrolcalidad3" field.
  String? _clientecontrolcalidad3;
  String get clientecontrolcalidad3 => _clientecontrolcalidad3 ?? '';
  bool hasClientecontrolcalidad3() => _clientecontrolcalidad3 != null;

  // "Clientecontrolcalidad4" field.
  String? _clientecontrolcalidad4;
  String get clientecontrolcalidad4 => _clientecontrolcalidad4 ?? '';
  bool hasClientecontrolcalidad4() => _clientecontrolcalidad4 != null;

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

  // "vehiculoRef" field.
  DocumentReference? _vehiculoRef;
  DocumentReference? get vehiculoRef => _vehiculoRef;
  bool hasVehiculoRef() => _vehiculoRef != null;

  // "clienteRef" field.
  DocumentReference? _clienteRef;
  DocumentReference? get clienteRef => _clienteRef;
  bool hasClienteRef() => _clienteRef != null;

  // "codeCT" field.
  String? _codeCT;
  String get codeCT => _codeCT ?? '';
  bool hasCodeCT() => _codeCT != null;

  // "moneda" field.
  String? _moneda;
  String get moneda => _moneda ?? '';
  bool hasMoneda() => _moneda != null;

  // "validoferta" field.
  String? _validoferta;
  String get validoferta => _validoferta ?? '';
  bool hasValidoferta() => _validoferta != null;

  // "diaentrega" field.
  String? _diaentrega;
  String get diaentrega => _diaentrega ?? '';
  bool hasDiaentrega() => _diaentrega != null;

  // "condpago" field.
  String? _condpago;
  String get condpago => _condpago ?? '';
  bool hasCondpago() => _condpago != null;

  // "garantia" field.
  String? _garantia;
  String get garantia => _garantia ?? '';
  bool hasGarantia() => _garantia != null;

  // "fechavencimiento" field.
  String? _fechavencimiento;
  String get fechavencimiento => _fechavencimiento ?? '';
  bool hasFechavencimiento() => _fechavencimiento != null;

  // "tipoigv" field.
  String? _tipoigv;
  String get tipoigv => _tipoigv ?? '';
  bool hasTipoigv() => _tipoigv != null;

  // "facturado" field.
  bool? _facturado;
  bool get facturado => _facturado ?? false;
  bool hasFacturado() => _facturado != null;

  // "tecnicoservicioRef" field.
  DocumentReference? _tecnicoservicioRef;
  DocumentReference? get tecnicoservicioRef => _tecnicoservicioRef;
  bool hasTecnicoservicioRef() => _tecnicoservicioRef != null;

  void _initializeFields() {
    _numeroorden = castToType<int>(snapshotData['numeroorden']);
    _tipoPersona = snapshotData['tipo_persona'] as String?;
    _nombreCliente = snapshotData['nombre_cliente'] as String?;
    _telefono = snapshotData['telefono'] as String?;
    _placa = snapshotData['placa'] as String?;
    _marca = snapshotData['marca'] as String?;
    _modelo = snapshotData['modelo'] as String?;
    _kmIngreso = snapshotData['km_ingreso'] as String?;
    _tecnicoServicio = snapshotData['tecnico_servicio'] as String?;
    _tipoServicio = snapshotData['tipo_servicio'] as String?;
    _motivoIngreso = snapshotData['motivo_ingreso'] as String?;
    _fotos = getDataList(snapshotData['fotos']);
    _dni = snapshotData['DNI'] as String?;
    _rUCempresa = snapshotData['RUCempresa'] as String?;
    _razonSocial = snapshotData['Razon_social'] as String?;
    _nombreEncargado = snapshotData['Nombre_encargado'] as String?;
    _correoElectronico = snapshotData['Correo_electronico'] as String?;
    _numeroVIN = snapshotData['Numero_VIN'] as String?;
    _anoFabricacion = snapshotData['Ano_fabricacion'] as String?;
    _nivelCombustible = snapshotData['Nivel_combustible'] as String?;
    _observacionesAdicionales =
        snapshotData['Observaciones_adicionales'] as String?;
    _status = snapshotData['status'] as String?;
    _aprobacionCliente = snapshotData['aprobacion_cliente'] as bool?;
    _fechaCreacion = snapshotData['fecha_creacion'] as DateTime?;
    _subtotal = castToType<double>(snapshotData['Subtotal']);
    _total = castToType<double>(snapshotData['Total']);
    _igv = castToType<double>(snapshotData['IGV']);
    _aprobacionCotizacion = snapshotData['aprobacion_cotizacion'] as bool?;
    _inventario = getDataList(snapshotData['Inventario']);
    _fotosFinalizacion = getDataList(snapshotData['fotos_finalizacion']);
    _comentariosFinalizacion =
        snapshotData['comentarios_finalizacion'] as String?;
    _controlcalidad1 = snapshotData['Controlcalidad1'] as String?;
    _controlcalidad2 = snapshotData['Controlcalidad2'] as String?;
    _controlcalidad3 = snapshotData['Controlcalidad3'] as String?;
    _clientecontrolcalidad1 = snapshotData['Clientecontrolcalidad1'] as String?;
    _clientecontrolcalidad2 = snapshotData['Clientecontrolcalidad2'] as String?;
    _clientecontrolcalidad3 = snapshotData['Clientecontrolcalidad3'] as String?;
    _clientecontrolcalidad4 = snapshotData['Clientecontrolcalidad4'] as String?;
    _direccionFiscal = snapshotData['direccion_fiscal'] as String?;
    _distrito = snapshotData['distrito'] as String?;
    _provincias = snapshotData['provincias'] as String?;
    _departamento = snapshotData['departamento'] as String?;
    _tipoDocumento = snapshotData['tipo_documento'] as String?;
    _vehiculoRef = snapshotData['vehiculoRef'] as DocumentReference?;
    _clienteRef = snapshotData['clienteRef'] as DocumentReference?;
    _codeCT = snapshotData['codeCT'] as String?;
    _moneda = snapshotData['moneda'] as String?;
    _validoferta = snapshotData['validoferta'] as String?;
    _diaentrega = snapshotData['diaentrega'] as String?;
    _condpago = snapshotData['condpago'] as String?;
    _garantia = snapshotData['garantia'] as String?;
    _fechavencimiento = snapshotData['fechavencimiento'] as String?;
    _tipoigv = snapshotData['tipoigv'] as String?;
    _facturado = snapshotData['facturado'] as bool?;
    _tecnicoservicioRef =
        snapshotData['tecnicoservicioRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recepciones');

  static Stream<RecepcionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RecepcionesRecord.fromSnapshot(s));

  static Future<RecepcionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RecepcionesRecord.fromSnapshot(s));

  static RecepcionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RecepcionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RecepcionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RecepcionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RecepcionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RecepcionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRecepcionesRecordData({
  int? numeroorden,
  String? tipoPersona,
  String? nombreCliente,
  String? telefono,
  String? placa,
  String? marca,
  String? modelo,
  String? kmIngreso,
  String? tecnicoServicio,
  String? tipoServicio,
  String? motivoIngreso,
  String? dni,
  String? rUCempresa,
  String? razonSocial,
  String? nombreEncargado,
  String? correoElectronico,
  String? numeroVIN,
  String? anoFabricacion,
  String? nivelCombustible,
  String? observacionesAdicionales,
  String? inventario,
  List<String>? fotosFinalizacion,
  String? comentariosFinalizacion,
  String? status,
  bool? aprobacionCliente,
  DateTime? fechaCreacion,
  double? subtotal,
  double? total,
  double? igv,
  bool? aprobacionCotizacion,
  String? controlcalidad1,
  String? controlcalidad2,
  String? controlcalidad3,
  String? clientecontrolcalidad1,
  String? clientecontrolcalidad2,
  String? clientecontrolcalidad3,
  String? clientecontrolcalidad4,
  String? direccionFiscal,
  String? distrito,
  String? provincias,
  String? departamento,
  String? tipoDocumento,
  DocumentReference? vehiculoRef,
  DocumentReference? clienteRef,
  String? codeCT,
  String? moneda,
  String? validoferta,
  String? diaentrega,
  String? condpago,
  String? garantia,
  String? fechavencimiento,
  String? tipoigv,
  bool? facturado,
  DocumentReference? tecnicoservicioRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'numeroorden': numeroorden,
      'tipo_persona': tipoPersona,
      'nombre_cliente': nombreCliente,
      'telefono': telefono,
      'placa': placa,
      'marca': marca,
      'modelo': modelo,
      'km_ingreso': kmIngreso,
      'tecnico_servicio': tecnicoServicio,
      'tipo_servicio': tipoServicio,
      'motivo_ingreso': motivoIngreso,
      'DNI': dni,
      'RUCempresa': rUCempresa,
      'Razon_social': razonSocial,
      'Nombre_encargado': nombreEncargado,
      'Correo_electronico': correoElectronico,
      'Numero_VIN': numeroVIN,
      'Ano_fabricacion': anoFabricacion,
      'anio': anoFabricacion,
      'Nivel_combustible': nivelCombustible,
      'nivelCombustible': nivelCombustible,
      'Observaciones_adicionales': observacionesAdicionales,
      'observaciones': observacionesAdicionales,
      'Inventario': inventario,
      'inventario': inventario,
      'fotos_finalizacion': fotosFinalizacion,
      'comentarios_finalizacion': comentariosFinalizacion,
      'status': status,
      'aprobacion_cliente': aprobacionCliente,
      'fecha_creacion': fechaCreacion,
      'Subtotal': subtotal,
      'Total': total,
      'IGV': igv,
      'aprobacion_cotizacion': aprobacionCotizacion,
      'Controlcalidad1': controlcalidad1,
      'Controlcalidad2': controlcalidad2,
      'Controlcalidad3': controlcalidad3,
      'Clientecontrolcalidad1': clientecontrolcalidad1,
      'Clientecontrolcalidad2': clientecontrolcalidad2,
      'Clientecontrolcalidad3': clientecontrolcalidad3,
      'Clientecontrolcalidad4': clientecontrolcalidad4,
      'direccion_fiscal': direccionFiscal,
      'distrito': distrito,
      'provincias': provincias,
      'departamento': departamento,
      'tipo_documento': tipoDocumento,
      'vehiculoRef': vehiculoRef,
      'clienteRef': clienteRef,
      'codeCT': codeCT,
      'moneda': moneda,
      'validoferta': validoferta,
      'diaentrega': diaentrega,
      'condpago': condpago,
      'garantia': garantia,
      'fechavencimiento': fechavencimiento,
      'tipoigv': tipoigv,
      'facturado': facturado,
      'tecnicoservicioRef': tecnicoservicioRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class RecepcionesRecordDocumentEquality implements Equality<RecepcionesRecord> {
  const RecepcionesRecordDocumentEquality();

  @override
  bool equals(RecepcionesRecord? e1, RecepcionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.numeroorden == e2?.numeroorden &&
        e1?.tipoPersona == e2?.tipoPersona &&
        e1?.nombreCliente == e2?.nombreCliente &&
        e1?.telefono == e2?.telefono &&
        e1?.placa == e2?.placa &&
        e1?.marca == e2?.marca &&
        e1?.modelo == e2?.modelo &&
        e1?.kmIngreso == e2?.kmIngreso &&
        e1?.tecnicoServicio == e2?.tecnicoServicio &&
        e1?.tipoServicio == e2?.tipoServicio &&
        e1?.motivoIngreso == e2?.motivoIngreso &&
        listEquality.equals(e1?.fotos, e2?.fotos) &&
        e1?.dni == e2?.dni &&
        e1?.rUCempresa == e2?.rUCempresa &&
        e1?.razonSocial == e2?.razonSocial &&
        e1?.nombreEncargado == e2?.nombreEncargado &&
        e1?.correoElectronico == e2?.correoElectronico &&
        e1?.numeroVIN == e2?.numeroVIN &&
        e1?.anoFabricacion == e2?.anoFabricacion &&
        e1?.nivelCombustible == e2?.nivelCombustible &&
        e1?.observacionesAdicionales == e2?.observacionesAdicionales &&
        e1?.status == e2?.status &&
        e1?.aprobacionCliente == e2?.aprobacionCliente &&
        e1?.fechaCreacion == e2?.fechaCreacion &&
        e1?.subtotal == e2?.subtotal &&
        e1?.total == e2?.total &&
        e1?.igv == e2?.igv &&
        e1?.aprobacionCotizacion == e2?.aprobacionCotizacion &&
        listEquality.equals(e1?.inventario, e2?.inventario) &&
        listEquality.equals(e1?.fotosFinalizacion, e2?.fotosFinalizacion) &&
        e1?.comentariosFinalizacion == e2?.comentariosFinalizacion &&
        e1?.controlcalidad1 == e2?.controlcalidad1 &&
        e1?.controlcalidad2 == e2?.controlcalidad2 &&
        e1?.controlcalidad3 == e2?.controlcalidad3 &&
        e1?.clientecontrolcalidad1 == e2?.clientecontrolcalidad1 &&
        e1?.clientecontrolcalidad2 == e2?.clientecontrolcalidad2 &&
        e1?.clientecontrolcalidad3 == e2?.clientecontrolcalidad3 &&
        e1?.clientecontrolcalidad4 == e2?.clientecontrolcalidad4 &&
        e1?.direccionFiscal == e2?.direccionFiscal &&
        e1?.distrito == e2?.distrito &&
        e1?.provincias == e2?.provincias &&
        e1?.departamento == e2?.departamento &&
        e1?.tipoDocumento == e2?.tipoDocumento &&
        e1?.vehiculoRef == e2?.vehiculoRef &&
        e1?.clienteRef == e2?.clienteRef &&
        e1?.codeCT == e2?.codeCT &&
        e1?.moneda == e2?.moneda &&
        e1?.validoferta == e2?.validoferta &&
        e1?.diaentrega == e2?.diaentrega &&
        e1?.condpago == e2?.condpago &&
        e1?.garantia == e2?.garantia &&
        e1?.fechavencimiento == e2?.fechavencimiento &&
        e1?.tipoigv == e2?.tipoigv &&
        e1?.facturado == e2?.facturado &&
        e1?.tecnicoservicioRef == e2?.tecnicoservicioRef;
  }

  @override
  int hash(RecepcionesRecord? e) => const ListEquality().hash([
        e?.numeroorden,
        e?.tipoPersona,
        e?.nombreCliente,
        e?.telefono,
        e?.placa,
        e?.marca,
        e?.modelo,
        e?.kmIngreso,
        e?.tecnicoServicio,
        e?.tipoServicio,
        e?.motivoIngreso,
        e?.fotos,
        e?.dni,
        e?.rUCempresa,
        e?.razonSocial,
        e?.nombreEncargado,
        e?.correoElectronico,
        e?.numeroVIN,
        e?.anoFabricacion,
        e?.nivelCombustible,
        e?.observacionesAdicionales,
        e?.status,
        e?.aprobacionCliente,
        e?.fechaCreacion,
        e?.subtotal,
        e?.total,
        e?.igv,
        e?.aprobacionCotizacion,
        e?.inventario,
        e?.fotosFinalizacion,
        e?.comentariosFinalizacion,
        e?.controlcalidad1,
        e?.controlcalidad2,
        e?.controlcalidad3,
        e?.clientecontrolcalidad1,
        e?.clientecontrolcalidad2,
        e?.clientecontrolcalidad3,
        e?.clientecontrolcalidad4,
        e?.direccionFiscal,
        e?.distrito,
        e?.provincias,
        e?.departamento,
        e?.tipoDocumento,
        e?.vehiculoRef,
        e?.clienteRef,
        e?.codeCT,
        e?.moneda,
        e?.validoferta,
        e?.diaentrega,
        e?.condpago,
        e?.garantia,
        e?.fechavencimiento,
        e?.tipoigv,
        e?.facturado,
        e?.tecnicoservicioRef
      ]);

  @override
  bool isValidKey(Object? o) => o is RecepcionesRecord;
}
