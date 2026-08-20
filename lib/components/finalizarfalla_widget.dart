import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'finalizarfalla_model.dart';
export 'finalizarfalla_model.dart';

class FinalizarfallaWidget extends StatefulWidget {
  const FinalizarfallaWidget({
    super.key,
    required this.indexx,
    required this.fallaref,
    this.status,
  });

  final int? indexx;
  final DocumentReference? fallaref;
  final String? status;

  @override
  State<FinalizarfallaWidget> createState() => _FinalizarfallaWidgetState();
}

class _FinalizarfallaWidgetState extends State<FinalizarfallaWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late FinalizarfallaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalizarfallaModel());

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
    return StreamBuilder<DiagnosticosRecord>(
      stream: DiagnosticosRecord.getDocument(widget.fallaref!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  _theme.primary,
                ),
              ),
            ),
          );
        }

        final containerDiagnosticosRecord = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: _theme.secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Falla ${((widget.indexx!) + 1).toString()}',
                              style: _theme
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: _theme
                                        .secondaryText,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: _theme
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerDiagnosticosRecord.nombreFalla,
                                  'Falla de carburador',
                                ),
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Solución',
                              style: _theme
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: _theme
                                        .secondaryText,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: _theme
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerDiagnosticosRecord.solucion,
                                  'Reemplazo de pieza',
                                ),
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (containerDiagnosticosRecord.fotos.isNotEmpty)
                              ...[
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Fotos de la falla',
                                    style: _theme.bodyMedium.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: _theme.bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: containerDiagnosticosRecord.fotos
                                        .map(
                                          (foto) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                foto,
                                                width: 90.0,
                                                height: 90.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            if (containerDiagnosticosRecord
                                .repuestos.isNotEmpty)
                              ...[
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Repuestos',
                                    style: _theme.bodyMedium.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: _theme.bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ...containerDiagnosticosRecord.repuestos
                                    .map(
                                      (rep) => Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          widget.status == 'Finalizado'
                                              ? '${rep.nombre}  ·  Cant: ${rep.cantidad}  ·  S/ ${rep.precio.toStringAsFixed(2)}'
                                              : '${rep.nombre}  ·  Cant: ${rep.cantidad}',
                                          style: _theme.bodyMedium,
                                        ),
                                      ),
                                    ),
                              ],
                            if (containerDiagnosticosRecord.manoDeObra > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  widget.status == 'Finalizado'
                                      ? '${containerDiagnosticosRecord.nombreFalla}  ·  S/ ${containerDiagnosticosRecord.manoDeObra.toStringAsFixed(2)}'
                                      : containerDiagnosticosRecord.nombreFalla,
                                  style: _theme.bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: _theme.bodyMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Tiempo',
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  containerDiagnosticosRecord.tiempoEstimado,
                                  '-',
                                ),
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
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
                    ),
                  ],
                ),
                ],
            ),
          ),
        );
      },
    );
  }
}
