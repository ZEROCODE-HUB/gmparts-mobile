import 'dart:async';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
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

  void _editName(BuildContext context) {
    final controller = TextEditingController(text: currentUserDisplayName);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Editar nombre'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Ingresa tu nombre'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              final newName = controller.text.trim();
              if (newName.isNotEmpty) {
                await currentUserDocument?.reference.update({
                  'display_name': newName,
                });
              }
              if (ctx.mounted) Navigator.pop(ctx);
            },
            child: Text('Guardar'),
          ),
        ],
      ),
    );
  }

  void _editDateOfBirth(BuildContext context) {
    final currentDob = currentUserDocument?.fechaDeNacimiento;
    showDatePicker(
      context: context,
      initialDate: currentDob ?? DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es'),
    ).then((date) {
      if (date != null) {
        currentUserDocument?.reference.update({
          'fecha_de_nacimiento': date,
        });
      }
    });
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
                    onTap: () => context.safePop(),
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
                      return InkWell(
                        onTap: () async {
                          final selected =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                            maxWidth: 1080,
                            maxHeight: 1080,
                          );
                          if (selected != null && selected.isNotEmpty) {
                            final url = await uploadData(
                                selected.first.storagePath,
                                selected.first.bytes);
                            if (url != null) {
                              await currentUserDocument?.reference
                                  .update({'photo_url': url});
                            }
                          }
                        },
                        child: Stack(
                          alignment: AlignmentDirectional(1.0, 1.0),
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              clipBehavior: Clip.antiAlias,
                              decoration:
                                  BoxDecoration(shape: BoxShape.circle),
                              child: (photo != null && photo.isNotEmpty)
                                  ? Image.network(photo, fit: BoxFit.cover)
                                  : Image.asset('assets/images/perfil.png',
                                      fit: BoxFit.cover),
                            ),
                            Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 16.0,
                                color:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24.0),
                  _buildEditableField(
                    context,
                    'Nombre',
                    currentUserDisplayName.isNotEmpty
                        ? currentUserDisplayName
                        : 'Sin nombre',
                    Icons.person_outline,
                    onEdit: () => _editName(context),
                  ),
                  SizedBox(height: 12.0),
                  _buildField(
                    context,
                    'Email',
                    currentUserEmail.isNotEmpty
                        ? currentUserEmail
                        : 'No registrado',
                    Icons.email_outlined,
                  ),
                  SizedBox(height: 12.0),
                  _buildField(
                    context,
                    'Teléfono',
                    currentPhoneNumber.isNotEmpty
                        ? currentPhoneNumber
                        : 'No registrado',
                    Icons.phone_outlined,
                  ),
                  SizedBox(height: 12.0),
                  _buildEditableField(
                    context,
                    'Fecha de Nacimiento',
                    currentUserDocument?.fechaDeNacimiento != null
                        ? '${currentUserDocument!.fechaDeNacimiento!.day.toString().padLeft(2, '0')}/${currentUserDocument!.fechaDeNacimiento!.month.toString().padLeft(2, '0')}/${currentUserDocument!.fechaDeNacimiento!.year}'
                        : 'No registrada',
                    Icons.calendar_today_outlined,
                    onEdit: () => _editDateOfBirth(context),
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        await authManager.signOut();
                        GoRouter.of(context).clearRedirectLocation();
                        context.goNamedAuth(
                            IniciarSessionWidget.routeName, context.mounted);
                      },
                      icon: Icon(Icons.logout, size: 20.0),
                      label: Text('CERRAR SESIÓN'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        foregroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  SizedBox(
                    width: double.infinity,
                    height: 45.0,
                    child: ElevatedButton.icon(
                      onPressed: () => context
                          .pushNamed(AConfirmarBorrarCuentaWidget.routeName),
                      icon: Icon(Icons.delete_sharp, size: 20.0),
                      label: Text('BORRAR CUENTA'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FlutterFlowTheme.of(context).error,
                        foregroundColor:
                            FlutterFlowTheme.of(context).primaryText,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
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

  Widget _buildField(
      BuildContext context, String label, String value, IconData icon) {
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
              Text(label,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: GoogleFonts.montserrat())),
              Text(value,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.montserrat())),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEditableField(BuildContext context, String label, String value,
      IconData icon, {VoidCallback? onEdit}) {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.montserrat())),
                Text(value,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.montserrat())),
              ],
            ),
          ),
          if (onEdit != null)
            InkWell(
              onTap: onEdit,
              child: Icon(Icons.edit, size: 18.0,
                  color: FlutterFlowTheme.of(context).primary),
            ),
        ],
      ),
    );
  }
}
