import '/backend/backend.dart';
import '/custom_code/actions/generate_link.dart';
import '/custom_code/actions/index.dart';
import '/diagnostico/recepcion_asedor_de_servicio/enviocliente/enviocliente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd_cotizacion_model.dart';
export 'd_cotizacion_model.dart';

class DCotizacionWidget extends StatefulWidget {
  const DCotizacionWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'd-cotizacion';
  static String routePath = '/dCotizacion';

  @override
  State<DCotizacionWidget> createState() => _DCotizacionWidgetState();
}

class _DCotizacionWidgetState extends State<DCotizacionWidget> {
  late DCotizacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DCotizacionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 0.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.chevron_left_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 0.0,
                              buttonSize: 44.0,
                              icon: Icon(
                                Icons.home_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 28.0,
                              ),
                              onPressed: () async {
                                context.goNamed(
                                  ARecepcionesInicioWidget.routeName,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 200.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Icon.png',
                                          width: 82.0,
                                          height: 82.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Tu cotización se ha guardado correctamente',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineLarge
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineLarge
                                                  .fontStyle,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        0.0, 0.0, 0.0, 50.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final recepciones = await queryRecepcionesRecordOnce(
                          queryBuilder: (r) => r.where(
                            'numeroorden',
                            isEqualTo: widget.id,
                          ),
                        );
                        if (recepciones.isEmpty) return;
                        final recepcion = recepciones.first;

                        final logoUrl = Platform.isAndroid
                            ? 'https://firebasestorage.googleapis.com/v0/b/g-m-parts-lac7fg.appspot.com/o/logo.png?alt=media'
                            : 'https://gmpartsprueba.flutterflow.app/logo.png';

                        if (context.mounted) {
                          await generarCotizacionPDF(
                            recepcion.reference,
                            recepcion.razonSocial.isNotEmpty
                                ? recepcion.razonSocial
                                : recepcion.nombreCliente,
                            recepcion.rUCempresa.isNotEmpty
                                ? recepcion.rUCempresa
                                : recepcion.dni,
                            recepcion.nombreCliente,
                            recepcion.telefono,
                            recepcion.nombreEncargado.isNotEmpty
                                ? recepcion.nombreEncargado
                                : recepcion.nombreCliente,
                            recepcion.telefono,
                            recepcion.correoElectronico,
                            recepcion.placa,
                            recepcion.marca,
                            recepcion.modelo,
                            '',
                            '',
                            recepcion.kmIngreso,
                            recepcion.anoFabricacion,
                            recepcion.condpago,
                            recepcion.moneda,
                            '',
                            recepcion.diaentrega,
                            recepcion.validoferta,
                            recepcion.fechaCreacion != null
                                ? '${recepcion.fechaCreacion!.day}/${recepcion.fechaCreacion!.month}/${recepcion.fechaCreacion!.year}'
                                : '',
                            recepcion.tipoServicio,
                            recepcion.motivoIngreso,
                            'COT-${recepcion.numeroorden}',
                            '',
                            recepcion.subtotal,
                            recepcion.igv,
                            recepcion.total,
                            logoUrl,
                            'S/ ${recepcion.total.toStringAsFixed(2)}',
                            recepcion.numeroorden.toString(),
                            recepcion.tipoPersona.toLowerCase() == 'natural',
                          );
                        }

                        final url =
                            await generateLink(widget.id!, 'quote');
                        if (!context.mounted) return;
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: EnvioclienteWidget(
                                  link: url,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      text: 'Enviar PDF al cliente',
                      options: FFButtonOptions(
                        width: 400.0,
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
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
          ),
        ),
      ),
    );
  }
}
