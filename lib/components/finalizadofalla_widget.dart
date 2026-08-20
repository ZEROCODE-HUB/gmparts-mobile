import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'finalizadofalla_model.dart';
export 'finalizadofalla_model.dart';

class FinalizadofallaWidget extends StatefulWidget {
  const FinalizadofallaWidget({
    super.key,
    required this.fallaref,
    required this.indexx,
  });

  final DocumentReference? fallaref;
  final int? indexx;

  @override
  State<FinalizadofallaWidget> createState() => _FinalizadofallaWidgetState();
}

class _FinalizadofallaWidgetState extends State<FinalizadofallaWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late FinalizadofallaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalizadofallaModel());

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
                                    fontSize: 12.0,
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
                                containerDiagnosticosRecord.nombreFalla,
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
                                    fontSize: 12.0,
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
                                containerDiagnosticosRecord.solucion,
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
                    if (containerDiagnosticosRecord.fotos.isNotEmpty)
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
                                'Fotos de la falla',
                                style: _theme.bodyMedium.override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: _theme.bodyMedium.fontStyle,
                                  ),
                                  color: _theme.secondaryText,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: containerDiagnosticosRecord.fotos
                                        .map(
                                          (foto) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
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
                                        .divide(SizedBox(width: 8.0)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (false)
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tiempo',
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
                                      fontSize: 12.0,
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
                                    containerDiagnosticosRecord.tiempoFinalizado
                                        .toString(),
                                    ' 0',
                                  ),
                                  style: _theme
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              _theme
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
                              'Comentarios u observaciones',
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
                                    fontSize: 12.0,
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
                                containerDiagnosticosRecord
                                    .comentariosFinalizado,
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
                    if (containerDiagnosticosRecord.repuestos.isNotEmpty)
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
                                'Repuestos',
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
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              ...containerDiagnosticosRecord.repuestos.map(
                                (rep) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 6.0, 0.0, 0.0),
                                  child: Text(
                                    '${rep.nombre}  ·  Cant: ${rep.cantidad}  ·  S/ ${rep.precio.toStringAsFixed(2)}',
                                    style: _theme.bodyMedium.override(
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (containerDiagnosticosRecord.manoDeObra > 0)
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
                                'Mano de obra',
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
                                      fontSize: 12.0,
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
                                    0.0, 6.0, 0.0, 0.0),
                                child: Text(
                                  '${containerDiagnosticosRecord.nombreFalla}  ·  S/ ${containerDiagnosticosRecord.manoDeObra.toStringAsFixed(2)}',
                                  style: _theme.bodyMedium.override(
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final imagenesfallasf =
                                              containerDiagnosticosRecord
                                                  .imagenesFinalizado
                                                  .toList();

                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                imagenesfallasf.length,
                                                (imagenesfallasfIndex) {
                                              final imagenesfallasfItem =
                                                  imagenesfallasf[
                                                      imagenesfallasfIndex];
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          imagenesfallasfItem,
                                                          'https://static.vecteezy.com/system/resources/previews/005/723/771/non_2x/photo-album-icon-image-symbol-or-no-image-flat-design-on-a-white-background-vector.jpg',
                                                        ),
                                                        width: 100.0,
                                                        height: 100.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).divide(SizedBox(width: 15.0)),
                                          );
                                        },
                                      ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 12.0))
                                      .addToEnd(SizedBox(width: 12.0)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Finalizado',
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
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
