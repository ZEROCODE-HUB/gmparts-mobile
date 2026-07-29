import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'restaurar_contrasena3_model.dart';
export 'restaurar_contrasena3_model.dart';

class RestaurarContrasena3Widget extends StatefulWidget {
  const RestaurarContrasena3Widget({super.key});

  static String routeName = 'RestaurarContrasena3';
  static String routePath = '/restaurarContrasena3';

  @override
  State<RestaurarContrasena3Widget> createState() =>
      _RestaurarContrasena3WidgetState();
}

class _RestaurarContrasena3WidgetState
    extends State<RestaurarContrasena3Widget> {
  late RestaurarContrasena3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurarContrasena3Model());

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
        backgroundColor: _theme.secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: _theme.secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 80.0),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: Text(
                              'Correo enviado',
                              textAlign: TextAlign.center,
                              style: _theme
                                  .headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 0.0),
                            child: Text(
                              'El correo de reinicio de contraseña fue enviado exitosamente a su bandeja.',
                              textAlign: TextAlign.center,
                              style: _theme
                                  .bodyLarge,
                            ),
                          ),
                          SizedBox(height: 32.0),
                        ],
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      context.goNamed(
                        IniciarSessionWidget.routeName,
                      );
                    },
                    text: 'Volver al inicio de sesión',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 45.0,
                      padding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
