import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'seleccionar_formato_model.dart';
export 'seleccionar_formato_model.dart';

class SeleccionarFormatoWidget extends StatefulWidget {
  const SeleccionarFormatoWidget({super.key});

  @override
  State<SeleccionarFormatoWidget> createState() =>
      _SeleccionarFormatoWidgetState();
}

class _SeleccionarFormatoWidgetState extends State<SeleccionarFormatoWidget> {
  late SeleccionarFormatoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeleccionarFormatoModel());

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
    return FlutterFlowDropDown<String>(
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(null),
      options: ['Option 1', 'Option 2', 'Option 3'],
      onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
      width: 200.0,
      height: 43.0,
      textStyle: _theme.bodyMedium.override(
            font: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              fontStyle: _theme.bodyMedium.fontStyle,
            ),
            letterSpacing: 0.0,
            fontWeight: FontWeight.w500,
            fontStyle: _theme.bodyMedium.fontStyle,
          ),
      hintText: 'Seleccionar Formato',
      icon: Icon(
        Icons.expand_circle_down_outlined,
        color: _theme.primary,
        size: 24.0,
      ),
      fillColor: _theme.primaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
