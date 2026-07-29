import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'encuestacliente_model.dart';
export 'encuestacliente_model.dart';

class EncuestaclienteWidget extends StatefulWidget {
  const EncuestaclienteWidget({
    super.key,
    required this.id,
  });

  final int? id;

  static String routeName = 'encuestacliente';
  static String routePath = '/encuestacliente';

  @override
  State<EncuestaclienteWidget> createState() => _EncuestaclienteWidgetState();
}

class _EncuestaclienteWidgetState extends State<EncuestaclienteWidget> {
  late EncuestaclienteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EncuestaclienteModel());

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: _theme.secondaryBackground,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 25.0, 0.0),
                      child: Text(
                        'Valoramos tu opinión. Comparte tus comentarios en nuestra encuesta de satisfacción para mejorar tu experiencia con nosotros. ¡Gracias!',
                        textAlign: TextAlign.center,
                        style:
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
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 35.0, 0.0, 30.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      DetalleFallasWidget.routeName,
                      queryParameters: {
                        'nroOrdden': serializeParam(
                          widget.id,
                          ParamType.int,
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
                  text: 'Comenzar',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: _theme.primary,
                    textStyle: _theme.titleSmall.override(
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
                          fontStyle:
                              _theme.titleSmall.fontStyle,
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
    );
  }
}
