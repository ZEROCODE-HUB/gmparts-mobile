import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'total_model.dart';
export 'total_model.dart';

class TotalWidget extends StatefulWidget {
  const TotalWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
    required this.refrecepcion,
    required this.id,
    this.subtotal,
    this.igv,
    this.total,
  });

  final List<double>? parameter1;
  final List<double>? parameter2;
  final List<double>? parameter3;
  final DocumentReference? refrecepcion;
  final int? id;
  final double? subtotal;
  final double? igv;
  final double? total;

  @override
  State<TotalWidget> createState() => _TotalWidgetState();
}

class _TotalWidgetState extends State<TotalWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late TotalModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalModel());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
        child: Container(
          decoration: BoxDecoration(
            color: _theme.accent2,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          functions.sumalist(widget.parameter1!.toList()),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'S/',
                        ),
                        'S/0',
                      ),
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'IGV',
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          functions.sumalist(widget.parameter2!.toList()),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'S/',
                        ),
                        'S/0',
                      ),
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        formatNumber(
                          widget.total,
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: 'S/',
                        ),
                        'S/0',
                      ),
                      style: _theme.titleLarge.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .titleLarge
                                .fontWeight,
                            fontStyle: _theme
                                .titleLarge
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await widget.refrecepcion!
                          .update(createRecepcionesRecordData(
                        subtotal: valueOrDefault<double>(
                          functions.sumalist(widget.parameter1!.toList()),
                          0.0,
                        ),
                        igv: valueOrDefault<double>(
                          functions.sumalist(widget.parameter2!.toList()),
                          0.0,
                        ),
                        total: widget.total,
                        status: FFAppConstants.Cotizacion,
                      ));

                      context.pushNamed(
                        DCotizacionWidget.routeName,
                        queryParameters: {
                          'id': serializeParam(
                            widget.id,
                            ParamType.int,
                          ),
                          'documentId': serializeParam(
                            widget.refrecepcion?.id,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    text: 'Siguiente',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
                        color: _theme.primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Seguir editando',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: _theme.accent2,
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
                        color: _theme.primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ].divide(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
