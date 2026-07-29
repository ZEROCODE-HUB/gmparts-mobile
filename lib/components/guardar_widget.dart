import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'guardar_model.dart';
export 'guardar_model.dart';

class GuardarWidget extends StatefulWidget {
  const GuardarWidget({
    super.key,
    this.actionpost,
  });

  final Future Function()? actionpost;

  @override
  State<GuardarWidget> createState() => _GuardarWidgetState();
}

class _GuardarWidgetState extends State<GuardarWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late GuardarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GuardarModel());

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
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 743.0,
        height: 476.0,
        decoration: BoxDecoration(
          color: _theme.secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlutterFlowIconButton(
                    borderColor: _theme.primary,
                    borderRadius: 5.0,
                    borderWidth: 1.0,
                    buttonSize: 24.0,
                    fillColor: _theme.primary,
                    icon: Icon(
                      Icons.close,
                      color: _theme.primaryBackground,
                      size: 8.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: _theme.primary,
                      size: 92.0,
                    ),
                    Text(
                      'Los cambios se \nhan guardado correctamente',
                      textAlign: TextAlign.center,
                      style: _theme.bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontStyle: _theme
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: _theme
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                        await widget.actionpost?.call();
                      },
                      text: 'Aceptar',
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
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
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ].divide(SizedBox(height: 40.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
