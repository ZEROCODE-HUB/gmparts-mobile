import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'a_cuenta_model.dart';
export 'a_cuenta_model.dart';

class ACuentaWidget extends StatefulWidget {
  const ACuentaWidget({super.key});

  static String routeName = 'a-Cuenta';
  static String routePath = '/aCuenta';

  @override
  State<ACuentaWidget> createState() => _ACuentaWidgetState();
}

class _ACuentaWidgetState extends State<ACuentaWidget> {
  late ACuentaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ACuentaModel());

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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  AuthUserStreamWidget(
                    builder: (context) {
                      final photo = currentUserPhoto;
                      final hasPhoto = photo != null && photo.isNotEmpty;
                      return Container(
                        width: 100.0,
                        height: 100.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: hasPhoto
                            ? Image.network(photo, fit: BoxFit.cover)
                            : Image.asset(
                                'assets/images/perfil.png',
                                fit: BoxFit.cover,
                              ),
                      );
                    },
                  ),
                  SizedBox(height: 8.0),
                  AuthUserStreamWidget(
                    builder: (context) {
                      final name = currentUserDisplayName;
                      return Text(
                        name.isNotEmpty ? name : 'Sin nombre',
                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                              font: GoogleFonts.montserrat(),
                            ),
                      );
                    },
                  ),
                  SizedBox(height: 32.0),
                  AuthUserStreamWidget(
                    builder: (context) => _buildField(
                      context,
                      'Email',
                      currentUserEmail.isNotEmpty ? currentUserEmail : 'No registrado',
                      Icons.email_outlined,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  AuthUserStreamWidget(
                    builder: (context) => _buildField(
                      context,
                      'Teléfono',
                      currentPhoneNumber.isNotEmpty ? currentPhoneNumber : 'No registrado',
                      Icons.phone_outlined,
                    ),
                  ),
                  SizedBox(height: 32.0),
                  _buildButton(
                    context,
                    'CERRAR SESIÓN',
                    Icons.logout,
                    Colors.red,
                    () async {
                      GoRouter.of(context).prepareAuthEvent();
                      await authManager.signOut();
                      GoRouter.of(context).clearRedirectLocation();
                      context.goNamedAuth(
                          IniciarSessionWidget.routeName, context.mounted);
                    },
                  ),
                  SizedBox(height: 12.0),
                  _buildButton(
                    context,
                    'BORRAR CUENTA',
                    Icons.delete_sharp,
                    FlutterFlowTheme.of(context).error,
                    () async {
                      context.pushNamed(AConfirmarBorrarCuentaWidget.routeName);
                    },
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(BuildContext context, String label, String value, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20.0, color: FlutterFlowTheme.of(context).primary),
          SizedBox(width: 12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.montserrat(),
                    ),
              ),
              Text(
                value,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat(),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 20.0),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: FlutterFlowTheme.of(context).primaryText,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
