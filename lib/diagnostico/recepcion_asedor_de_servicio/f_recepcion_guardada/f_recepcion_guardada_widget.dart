import '/custom_code/actions/generate_link.dart';
import '/diagnostico/recepcion_asedor_de_servicio/enviocliente/enviocliente_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'f_recepcion_guardada_model.dart';
export 'f_recepcion_guardada_model.dart';

class FRecepcionGuardadaWidget extends StatefulWidget {
  const FRecepcionGuardadaWidget({
    super.key,
    this.id,
    this.documentId,
  });

  final int? id;
  final String? documentId;

  static String routeName = 'f-RecepcionGuardada';
  static String routePath = '/fRecepcionGuardada';

  @override
  State<FRecepcionGuardadaWidget> createState() =>
      _FRecepcionGuardadaWidgetState();
}

class _FRecepcionGuardadaWidgetState extends State<FRecepcionGuardadaWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late FRecepcionGuardadaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FRecepcionGuardadaModel());

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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Column(
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
                        Expanded(
                          child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/Icon.png',
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Tu recepción se ha \nguardado correctamente',
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
                    ],
                  ),
                ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                       final receptionId = widget.id;
                       if (receptionId == null) {
                         if (context.mounted) {
                           ScaffoldMessenger.of(context).showSnackBar(
                             const SnackBar(
                               content: Text(
                                   'No se pudo obtener el número de recepción. Vuelve a intentarlo.'),
                               duration: Duration(seconds: 3),
                             ),
                           );
                         }
                         return;
                       }
                       String url;
                       try {
                         url = await generateLink(
                           receptionId,
                           'reception',
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
                    text: 'Enviar detalle al cliente',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 45.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
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
    );
  }
}
