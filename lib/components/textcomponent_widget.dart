import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textcomponent_model.dart';
export 'textcomponent_model.dart';

class TextcomponentWidget extends StatefulWidget {
  const TextcomponentWidget({
    super.key,
    String? nombre,
    required this.pagselect,
  }) : this.nombre = nombre ?? '';

  final String nombre;
  final String? pagselect;

  @override
  State<TextcomponentWidget> createState() => _TextcomponentWidgetState();
}

class _TextcomponentWidgetState extends State<TextcomponentWidget> {
  late TextcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextcomponentModel());

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
    return Text(
      widget.nombre,
      style: _theme.titleMedium.override(
            font: GoogleFonts.montserrat(
              fontWeight: _theme.titleMedium.fontWeight,
              fontStyle: _theme.titleMedium.fontStyle,
            ),
            color: valueOrDefault<Color>(
              _model.pagselect == widget.nombre
                  ? _theme.primaryText
                  : _theme.accent1,
              _theme.accent1,
            ),
            letterSpacing: 0.0,
            fontWeight: _theme.titleMedium.fontWeight,
            fontStyle: _theme.titleMedium.fontStyle,
          ),
    );
  }
}
