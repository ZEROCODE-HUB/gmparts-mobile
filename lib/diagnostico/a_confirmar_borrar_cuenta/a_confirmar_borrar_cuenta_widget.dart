import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a_confirmar_borrar_cuenta_model.dart';
export 'a_confirmar_borrar_cuenta_model.dart';

class AConfirmarBorrarCuentaWidget extends StatefulWidget {
  const AConfirmarBorrarCuentaWidget({super.key});

  static String routeName = 'a-ConfirmarBorrarCuenta';
  static String routePath = '/aConfirmarBorrarcuenta';

  @override
  State<AConfirmarBorrarCuentaWidget> createState() =>
      _AConfirmarBorrarCuentaWidgetState();
}

class _AConfirmarBorrarCuentaWidgetState
    extends State<AConfirmarBorrarCuentaWidget> {
  late AConfirmarBorrarCuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AConfirmarBorrarCuentaModel());

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
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: _theme.primaryText,
                      size: 24.0,
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                      child: Text(
                        '¿Esta seguro que quiere eliminar su cuenta?',
                        style: _theme.titleLarge.override(
                              font: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontStyle: _theme
                                    .titleLarge
                                    .fontStyle,
                              ),
                              color: _theme.alternate,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: _theme
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Estás a punto de iniciar un proceso irreversible: la eliminación total de tu cuenta y todos los datos personales asociados a ella.\n\n- Tu nombre, dirección de correo electrónico y cualquier otra información de identificación proporcionada durante el uso de nuestros servicios que esté vinculada directamente a tu identidad, una vez que confirmes esta acción, toda esta información será eliminada de forma permanente de nuestros sistemas. No podrás recuperar tu cuenta ni los datos personales asociados en el futuro. Esta medida se toma en conformidad con nuestras políticas de privacidad y protección de datos.\nEs importante que tengas en cuenta que esta acción es definitiva e irreversible. Si en algún momento decides volver a utilizar nuestros servicios, deberás crear una nueva cuenta desde cero y proporcionar nuevamente tus datos personales.\n\nPor razones de seguridad y para proteger tu privacidad, te pedimos que confirmes esta decisión solo si estás completamente seguro/a.\n\n¿Deseas continuar con la eliminación permanente de tu cuenta y tus datos personales?',
                      style: _theme.bodyMedium.override(
                            font: GoogleFonts.montserrat(
                              fontWeight: _theme
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: _theme
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: _theme
                                .bodyMedium
                                .fontWeight,
                            fontStyle: _theme
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 40.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await authManager.deleteUser(context);

                          context.goNamedAuth(
                              SplashWidget.routeName, context.mounted);
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Container(
                            height: 48.0,
                            decoration: BoxDecoration(
                              color: _theme.primary,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Text(
                                        'ELIMINAR CUENTA',
                                        style: _theme
                                            .titleLarge
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleLarge
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleLarge
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.delete_sharp,
                                        color: _theme
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
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
