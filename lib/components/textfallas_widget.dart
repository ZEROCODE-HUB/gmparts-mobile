import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'textfallas_model.dart';
export 'textfallas_model.dart';

class TextfallasWidget extends StatefulWidget {
  const TextfallasWidget({super.key});

  @override
  State<TextfallasWidget> createState() => _TextfallasWidgetState();
}

class _TextfallasWidgetState extends State<TextfallasWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late TextfallasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextfallasModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
    return TextFormField(
      controller: _model.textController,
      focusNode: _model.textFieldFocusNode,
      autofocus: false,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Escribe aquí',
        hintStyle: _theme.labelMedium.override(
              font: GoogleFonts.montserrat(
                fontWeight: _theme.labelMedium.fontWeight,
                fontStyle: _theme.labelMedium.fontStyle,
              ),
              letterSpacing: 0.0,
              fontWeight: _theme.labelMedium.fontWeight,
              fontStyle: _theme.labelMedium.fontStyle,
            ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        contentPadding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
      ),
      style: _theme.bodyMedium.override(
            font: GoogleFonts.montserrat(
              fontWeight: _theme.bodyMedium.fontWeight,
              fontStyle: _theme.bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: _theme.bodyMedium.fontWeight,
            fontStyle: _theme.bodyMedium.fontStyle,
          ),
      validator: _model.textControllerValidator.asValidator(context),
    );
  }
}
