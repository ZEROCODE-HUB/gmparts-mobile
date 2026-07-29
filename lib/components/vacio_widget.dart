import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'vacio_model.dart';
export 'vacio_model.dart';

class VacioWidget extends StatefulWidget {
  const VacioWidget({super.key});

  @override
  State<VacioWidget> createState() => _VacioWidgetState();
}

class _VacioWidgetState extends State<VacioWidget> {
  late VacioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VacioModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    return Container(
      width: 250.0,
      height: 250.0,
      decoration: BoxDecoration(
        color: _theme.primaryBackground,
        image: DecorationImage(
          fit: BoxFit.contain,
          image: Image.asset(
            'assets/images/Frame_14766.png',
          ).image,
        ),
      ),
    );
  }
}
