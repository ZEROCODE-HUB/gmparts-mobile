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

  Widget _profileImage() {
    final hasPhoto = currentUserPhoto.isNotEmpty;
    return Container(
      width: 100.0,
      height: 100.0,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: hasPhoto
          ? Image.network(currentUserPhoto, fit: BoxFit.cover)
          : Image.asset('assets/images/perfil.png', fit: BoxFit.cover),
    );
  }

  Widget _infoRow(String label, String value, {bool editable = false}) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 100.0,
            child: Text(
              label,
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.montserrat(),
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.montserrat(),
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String text, IconData icon, VoidCallback onTap, {Color? color}) {
    final bgColor = color ?? FlutterFlowTheme.of(context).primary;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          elevation: 3.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.85,
            height: 45.0,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: FlutterFlowTheme.of(context).titleLarge.override(
                        font: GoogleFonts.montserrat(fontSize: 14.0),
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Icon(icon, color: FlutterFlowTheme.of(context).primaryText, size: 20.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
                    builder: (context) => Stack(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      children: [
                        _profileImage(),
                        Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  AuthUserStreamWidget(
                    builder: (context) => TextFormField(
                      controller: _model.nameController,
                      focusNode: _model.nameFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.montserrat(),
                            ),
                        hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                              font: GoogleFonts.montserrat(),
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        suffixIcon: InkWell(
                          onTap: () async {
                            final newName = _model.nameController.text.trim();
                            if (newName.isEmpty) return;
                            await currentUserDocument?.reference.update({
                              'display_name': newName,
                            });
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Nombre actualizado')),
                              );
                            }
                          },
                          child: Icon(
                            Icons.check,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            font: GoogleFonts.montserrat(),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _infoRow('Email', currentUserEmail),
                  _infoRow('Teléfono', currentPhoneNumber),
                  AuthUserStreamWidget(
                    builder: (context) {
                      final dob = currentUserDocument?.fechaDeNacimiento;
                      final dobText = dob != null
                          ? '${dob.day.toString().padLeft(2, '0')}/${dob.month.toString().padLeft(2, '0')}/${dob.year}'
                          : 'No registrada';
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: dob ?? DateTime(2000, 1, 1),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                              locale: const Locale('es'),
                            );
                            if (date != null && context.mounted) {
                              await currentUserDocument?.reference.update({
                                'fecha_de_nacimiento': date,
                              });
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 100.0,
                                child: Text(
                                  'F. Nacimiento',
                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                        font: GoogleFonts.montserrat(),
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  dobText,
                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.montserrat(),
                                      ),
                                ),
                              ),
                              Icon(Icons.edit_calendar, size: 18.0, color: FlutterFlowTheme.of(context).primary),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32.0),
                  _actionButton('CERRAR SESIÓN', Icons.logout, () async {
                    GoRouter.of(context).prepareAuthEvent();
                    await authManager.signOut();
                    GoRouter.of(context).clearRedirectLocation();
                    context.goNamedAuth(IniciarSessionWidget.routeName, context.mounted);
                  }),
                  _actionButton(
                    'BORRAR CUENTA',
                    Icons.delete_sharp,
                    () async {
                      context.pushNamed(AConfirmarBorrarCuentaWidget.routeName);
                    },
                    color: FlutterFlowTheme.of(context).error,
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
}
