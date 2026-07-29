import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'manode_obra_factura_model.dart';
export 'manode_obra_factura_model.dart';

class ManodeObraFacturaWidget extends StatefulWidget {
  const ManodeObraFacturaWidget({super.key});

  @override
  State<ManodeObraFacturaWidget> createState() =>
      _ManodeObraFacturaWidgetState();
}

class _ManodeObraFacturaWidgetState extends State<ManodeObraFacturaWidget> {
  late ManodeObraFacturaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ManodeObraFacturaModel());

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
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 350.0,
        decoration: BoxDecoration(
          color: _theme.primaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, _model.dtyperepuestos);
                    },
                    child: Icon(
                      Icons.close,
                      color: _theme.primary,
                      size: 30.0,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Text(
                    'Elige la cantidad de horas',
                    style: _theme.bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            fontStyle: _theme
                                .bodyMedium
                                .fontStyle,
                          ),
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(-1.0, 0.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: TextFormField(
                    controller: _model.textController,
                    focusNode: _model.textFieldFocusNode,
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Ingresa las horas de trabajo',
                      labelStyle:
                          _theme.bodyMedium.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: _theme
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: _theme
                                      .bodyMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: _theme
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: _theme
                                    .bodyMedium
                                    .fontStyle,
                              ),
                      hintStyle:
                          _theme.labelMedium.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: _theme
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: _theme
                                      .labelMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: _theme
                                    .labelMedium
                                    .fontWeight,
                                fontStyle: _theme
                                    .labelMedium
                                    .fontStyle,
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.alternate,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    style: _theme.bodyMedium.override(
                          font: GoogleFonts.montserrat(
                            fontWeight: _theme
                                .bodyMedium
                                .fontWeight,
                            fontStyle: _theme
                                .bodyMedium
                                .fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight: _theme
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                    keyboardType: TextInputType.number,
                    validator:
                        _model.textControllerValidator.asValidator(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                      FFAppState().addToCrearFacturas(FacturasArticulosStruct(
                        descripcion: 'Mano de obra',
                        cantidad: int.tryParse(_model.textController.text),
                        precioVenta: int.parse(_model.textController.text) *
                            FFAppState().costo,
                      ));
                      _model.updatePage(() {});
                    },
                    text: 'Guardar',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: _theme.primary,
                      textStyle:
                          _theme.titleSmall.override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: _theme
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: _theme
                                      .titleSmall
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: _theme
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: _theme
                                    .titleSmall
                                    .fontStyle,
                              ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
