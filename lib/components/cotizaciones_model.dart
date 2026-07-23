import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cotizaciones_widget.dart' show CotizacionesWidget;
import 'package:flutter/material.dart';

class CotizacionesModel extends FlutterFlowModel<CotizacionesWidget> {
  ///  Local state fields for this component.

  int? indexdiagnostico;

  int? indexrepuestos;

  int actualdiagnostico = 0;

  int actualrepuesto = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<DiagnosticosRecord>? diagnosticoglobal;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<DiagnosticosRecord>? diagnosticos2Copy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
