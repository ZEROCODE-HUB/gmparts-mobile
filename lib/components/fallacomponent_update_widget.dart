import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'fallacomponent_update_model.dart';
export 'fallacomponent_update_model.dart';

class FallacomponentUpdateWidget extends StatefulWidget {
  const FallacomponentUpdateWidget({
    super.key,
    required this.fallaref,
    this.indexx,
    this.recepcionRef,
    this.nombreFalla,
    this.servicioSolucion,
    this.tiempoEstimado,
    this.actiontotal,
  });

  final DiagnosticosRecord? fallaref;
  final int? indexx;
  final DocumentReference? recepcionRef;
  final String? nombreFalla;
  final String? servicioSolucion;
  final String? tiempoEstimado;
  final Future Function()? actiontotal;

  @override
  State<FallacomponentUpdateWidget> createState() =>
      _FallacomponentUpdateWidgetState();
}

class _FallacomponentUpdateWidgetState
    extends State<FallacomponentUpdateWidget> {
  late FallacomponentUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FallacomponentUpdateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
