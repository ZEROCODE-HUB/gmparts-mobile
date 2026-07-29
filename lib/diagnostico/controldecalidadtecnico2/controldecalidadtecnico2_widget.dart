import '/auth/firebase_auth/auth_util.dart';
import '/components/user_avatar_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controldecalidadtecnico2_model.dart';
export 'controldecalidadtecnico2_model.dart';

class Controldecalidadtecnico2Widget extends StatefulWidget {
  const Controldecalidadtecnico2Widget({
    super.key,
    required this.idrecep,
    required this.id,
  });

  final DocumentReference? idrecep;
  final int? id;

  static String routeName = 'Controldecalidadtecnico2';
  static String routePath = '/controldecalidadtecnico2';

  @override
  State<Controldecalidadtecnico2Widget> createState() =>
      _Controldecalidadtecnico2WidgetState();
}

class _Controldecalidadtecnico2WidgetState
    extends State<Controldecalidadtecnico2Widget> {
  late Controldecalidadtecnico2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Controldecalidadtecnico2Model());

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
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    _theme.primary,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 32.0,
                                icon: Icon(
                                  Icons.chevron_left_rounded,
                                  color: _theme.primary,
                                  size: 16.0,
                                ),
                                onPressed: () async {
                                  context.safePop();
                                },
                              ),
                            ),
                            InkWell(
  onTap: () async {
    context.pushNamed(
      ACuentaWidget.routeName,
    );
  },
  child: Container(
                              width: 70.0,
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Container(
                                        width: 32.0,
                                        height: 32.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: UserAvatarWidget(size: 32.0),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault<String>(
                                          currentUserDisplayName,
                                          '-',
                                        ),
                                        textAlign: TextAlign.end,
                                        style: _theme
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .labelSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                
                                      Align(
                                        alignment: AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            'Ver perfil',
                                            style: _theme.labelSmall.override(
                                              font: GoogleFonts.montserrat(fontSize: 10.0),
                                              fontSize: 10.0,
                                              color: _theme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
],
                              ),
                            )
),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 40.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Control de calidad',
                            style: _theme
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: _theme
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: _theme
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    '1. ¿Se completó la prueba de ruta de manera satisfactoria?',
                                    style: _theme
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              _theme
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: FlutterFlowRadioButton(
                                    options: ['Si', 'No'].toList(),
                                    onChanged: (val) => safeSetState(() {}),
                                    controller:
                                        _model.radioButtonValueController1 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: _theme
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                _theme
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              _theme
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    textPadding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 10.0, 0.0),
                                    buttonPosition: RadioButtonPosition.right,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        _theme.primary,
                                    inactiveRadioButtonColor:
                                        _theme
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.center,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    '2. ¿El vehículo está listo para entregar?',
                                    style: _theme
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              _theme
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: FlutterFlowRadioButton(
                                    options: ['Si', 'No'].toList(),
                                    onChanged: (val) => safeSetState(() {}),
                                    controller:
                                        _model.radioButtonValueController2 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: _theme
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                _theme
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              _theme
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    textPadding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 10.0, 0.0),
                                    buttonPosition: RadioButtonPosition.right,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        _theme.primary,
                                    inactiveRadioButtonColor:
                                        _theme
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.center,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 40.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    '3. ¿Las fallas se resolvieron?',
                                    style: _theme
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              _theme
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 25.0, 0.0, 0.0),
                                  child: FlutterFlowRadioButton(
                                    options: ['Si', 'No'].toList(),
                                    onChanged: (val) => safeSetState(() {}),
                                    controller:
                                        _model.radioButtonValueController3 ??=
                                            FormFieldController<String>(null),
                                    optionHeight: 32.0,
                                    textStyle: _theme
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                _theme
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              _theme
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .labelMedium
                                                  .fontStyle,
                                        ),
                                    textPadding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 10.0, 0.0),
                                    buttonPosition: RadioButtonPosition.right,
                                    direction: Axis.horizontal,
                                    radioButtonColor:
                                        _theme.primary,
                                    inactiveRadioButtonColor:
                                        _theme
                                            .secondaryText,
                                    toggleable: false,
                                    horizontalAlignment: WrapAlignment.center,
                                    verticalAlignment: WrapCrossAlignment.start,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await widget.idrecep!.update(createRecepcionesRecordData(
                      controlcalidad1: _model.radioButtonValue1,
                      controlcalidad2: _model.radioButtonValue2,
                      controlcalidad3: _model.radioButtonValue3,
                    ));

                    context.pushNamed(
                      DControldecalidadenviarclienteWidget.routeName,
                      queryParameters: {
                        'id': serializeParam(
                          widget.id,
                          ParamType.int,
                        ),
                      }.withoutNulls,
                    );
                  },
                  text: 'Guardar y enviar',
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
