import '/auth/firebase_auth/auth_util.dart';
import '/custom_code/actions/generate_link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/diagnostico/recepcion_asedor_de_servicio/enviocliente/enviocliente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd_controldecalidadenviarcliente_model.dart';
export 'd_controldecalidadenviarcliente_model.dart';

class DControldecalidadenviarclienteWidget extends StatefulWidget {
  const DControldecalidadenviarclienteWidget({
    super.key,
    required this.id,
    this.documentId,
  });

  final int? id;
  final String? documentId;

  static String routeName = 'd-controldecalidadenviarcliente';
  static String routePath = '/dControldecalidadenviarcliente';

  @override
  State<DControldecalidadenviarclienteWidget> createState() =>
      _DControldecalidadenviarclienteWidgetState();
}

class _DControldecalidadenviarclienteWidgetState
    extends State<DControldecalidadenviarclienteWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late DControldecalidadenviarclienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DControldecalidadenviarclienteModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: _theme.primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _theme.secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              color: _theme.primary,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.goNamed(
                                ARecepcionesInicioWidget.routeName,
                              );
                            },
                          ),
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 0.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              Icons.home_rounded,
                              color: _theme.primary,
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 230.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: _theme
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
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/Icon.png',
                                      width: 82.0,
                                      height: 82.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                'Se han completado todas las fallas',
                                textAlign: TextAlign.center,
                                style: _theme
                                    .headlineLarge
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: _theme
                                            .headlineLarge
                                            .fontWeight,
                                        fontStyle: _theme
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .headlineLarge
                                          .fontWeight,
                                      fontStyle: _theme
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                         final reportId = widget.id;
                         if (reportId == null) {
                           if (context.mounted) {
                             ScaffoldMessenger.of(context).showSnackBar(
                               const SnackBar(
                                 content: Text(
                                     'No se pudo obtener el número de orden. Vuelve a intentarlo.'),
                                 duration: Duration(seconds: 3),
                               ),
                             );
                           }
                           return;
                         }
                         String url;
                         try {
                            url = await generateLink(
                              reportId,
                              'report',
                              documentId: widget.documentId,
                            );
                         } catch (e) {
                           if (context.mounted) {
                             ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(
                                 content: Text(
                                     'No se pudo generar el enlace. Revisa tu conexión e inténtalo de nuevo.'),
                                 duration: Duration(seconds: 3),
                               ),
                             );
                           }
                           return;
                         }
                         // Este boton solo generaba el enlace del informe: no dejaba
                         // ni rastro de que el taller hubiera terminado. Como `status`
                         // solo pasa a «Finalizado» cuando el CLIENTE contesta la encuesta,
                         // una orden acabada cuyo cliente no responde se queda en
                         // «Reparacion» para siempre, y eso es justo lo que se ve en
                         // produccion: hay ordenes con el control de calidad hecho que el
                         // panel sigue mostrando como si el coche estuviera en el taller.
                         //
                         // No se toca `status` a proposito: anadir un estado nuevo obliga a
                         // cambiar los tres repos a la vez y esa decision no esta tomada.
                         // Lo que si se puede hacer sin romper nada es dejar constancia de
                         // la fecha y de quien dio el trabajo por terminado, que es el dato
                         // que hoy se pierde.
                         final docId = widget.documentId;
                         if (docId != null && docId.isNotEmpty) {
                           try {
                             await FirebaseFirestore.instance
                                 .collection('recepciones')
                                 .doc(docId)
                                 .update({
                               'listoParaEntrega': true,
                               'listoParaEntregaAt':
                                   FieldValue.serverTimestamp(),
                               'listoParaEntregaPor': currentUserUid,
                             });
                           } catch (e) {
                             // Que no se pueda anotar no debe impedir avisar al cliente:
                             // el enlace ya esta generado y es lo que el cliente espera.
                             debugPrint('No se pudo marcar listo para entrega: $e');
                           }
                         }

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
                      text: 'Está listo para entregar',
                      options: FFButtonOptions(
                        width: 400.0,
                        height: 45.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: _theme.primary,
                        textStyle:
                            _theme.titleLarge.override(
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
