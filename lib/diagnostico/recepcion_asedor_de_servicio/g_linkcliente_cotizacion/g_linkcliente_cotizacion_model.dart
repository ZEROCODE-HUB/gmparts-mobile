import '/components/cotizacioncliente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'g_linkcliente_cotizacion_widget.dart' show GLinkclienteCotizacionWidget;
import 'package:flutter/material.dart';

class GLinkclienteCotizacionModel
    extends FlutterFlowModel<GLinkclienteCotizacionWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Cotizacioncliente dynamic component.
  late FlutterFlowDynamicModels<CotizacionclienteModel> cotizacionclienteModels;

  @override
  void initState(BuildContext context) {
    cotizacionclienteModels =
        FlutterFlowDynamicModels(() => CotizacionclienteModel());
  }

  @override
  void dispose() {
    cotizacionclienteModels.dispose();
  }
}
