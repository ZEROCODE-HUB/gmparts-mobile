import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'model_choose_model.dart';
export 'model_choose_model.dart';

class ModelChooseWidget extends StatefulWidget {
  const ModelChooseWidget({super.key});

  @override
  State<ModelChooseWidget> createState() => _ModelChooseWidgetState();
}

class _ModelChooseWidgetState extends State<ModelChooseWidget> {
  late ModelChooseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModelChooseModel());

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
    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: _theme.secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _model.textController,
              focusNode: _model.textFieldFocusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelText: 'Buscar o agregar',
                labelStyle: _theme.labelMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          _theme.labelMedium.fontWeight,
                      fontStyle:
                          _theme.labelMedium.fontStyle,
                    ),
                hintStyle: _theme.labelMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          _theme.labelMedium.fontWeight,
                      fontStyle:
                          _theme.labelMedium.fontStyle,
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
                filled: true,
                fillColor: _theme.primaryBackground,
              ),
              style: _theme.bodyMedium.override(
                    font: GoogleFonts.montserrat(
                      fontWeight:
                          _theme.bodyMedium.fontWeight,
                      fontStyle:
                          _theme.bodyMedium.fontStyle,
                    ),
                    letterSpacing: 0.0,
                    fontWeight:
                        _theme.bodyMedium.fontWeight,
                    fontStyle:
                        _theme.bodyMedium.fontStyle,
                  ),
              validator: _model.textControllerValidator.asValidator(context),
            ),
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    FFAppState().select = '';
                    safeSetState(() {});
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Hello World',
                          style:
                              _theme.bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.normal,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: _theme
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
