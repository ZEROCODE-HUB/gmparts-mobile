import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'restaurar_contrasena2_model.dart';
export 'restaurar_contrasena2_model.dart';

class RestaurarContrasena2Widget extends StatefulWidget {
  const RestaurarContrasena2Widget({super.key});

  static String routeName = 'RestaurarContrasena2';
  static String routePath = '/restaurarContrasena2';

  @override
  State<RestaurarContrasena2Widget> createState() =>
      _RestaurarContrasena2WidgetState();
}

class _RestaurarContrasena2WidgetState
    extends State<RestaurarContrasena2Widget> {
  late RestaurarContrasena2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurarContrasena2Model());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderColor: _theme.primary,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 32.0,
                            icon: Icon(
                              Icons.chevron_left_rounded,
                              color: _theme.primary,
                              size: 16.0,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Restaurar Contraseña',
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
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 26.0),
                              child: Text(
                                'Entroduce una nueva contraseña segura\n',
                                textAlign: TextAlign.start,
                                style: _theme
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: _theme
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          _theme.accent1,
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: _theme
                                          .titleSmall
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Contraseña',
                            style: _theme
                                .titleSmall
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: _theme
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: _theme
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: _theme
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: _theme
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController1,
                            focusNode: _model.textFieldFocusNode1,
                            autofocus: true,
                            obscureText: !_model.passwordVisibility1,
                            decoration: InputDecoration(
                              labelText: 'Ingrese contraseña',
                              labelStyle: _theme
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: _theme
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: _theme.accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: _theme
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintStyle: _theme
                                  .labelMedium
                                  .override(
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: _theme.accent2,
                              suffixIcon: InkWell(
                                onTap: () async {
                                  safeSetState(() =>
                                      _model.passwordVisibility1 =
                                          !_model.passwordVisibility1);
                                },
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility1
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: _theme.primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
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
                                  letterSpacing: 0.0,
                                  fontWeight: _theme
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: _theme
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Repetir contraseña',
                            style: _theme
                                .titleSmall
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: _theme
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: _theme
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: _theme
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: _theme
                                      .titleSmall
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _model.textController2,
                            focusNode: _model.textFieldFocusNode2,
                            autofocus: true,
                            obscureText: !_model.passwordVisibility2,
                            decoration: InputDecoration(
                              labelText: 'Ingrese contraseña',
                              labelStyle: _theme
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: _theme
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    color: _theme.accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: _theme
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintStyle: _theme
                                  .labelMedium
                                  .override(
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _theme.error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: _theme.accent2,
                              suffixIcon: InkWell(
                                onTap: () async {
                                  safeSetState(() =>
                                      _model.passwordVisibility2 =
                                          !_model.passwordVisibility2);
                                },
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility2
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: _theme.primary,
                                  size: 24.0,
                                ),
                              ),
                            ),
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
                                  letterSpacing: 0.0,
                                  fontWeight: _theme
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: _theme
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.textController2Validator
                                .asValidator(context),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            '-Debe contener 8 caracteres\n-1 letra Mayúscula\n-Un número o símbolo',
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
                                  color: _theme.accent1,
                                  letterSpacing: 0.0,
                                  fontWeight: _theme
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: _theme
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 140.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: 'Restaurar contraseña',
                            options: FFButtonOptions(
                              width: 320.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: _theme.primary,
                              textStyle: _theme
                                  .titleLarge
                                  .override(
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
