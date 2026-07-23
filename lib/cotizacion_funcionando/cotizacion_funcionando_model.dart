import '/components/cotizacion_n_u_e_v_o_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cotizacion_funcionando_widget.dart' show CotizacionFuncionandoWidget;
import 'package:flutter/material.dart';

class CotizacionFuncionandoModel
    extends FlutterFlowModel<CotizacionFuncionandoWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for CotizacionNUEVO dynamic component.
  late FlutterFlowDynamicModels<CotizacionNUEVOModel> cotizacionNUEVOModels;

  @override
  void initState(BuildContext context) {
    cotizacionNUEVOModels =
        FlutterFlowDynamicModels(() => CotizacionNUEVOModel());
  }

  @override
  void dispose() {
    cotizacionNUEVOModels.dispose();
  }
}
