import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crearcuentacobrar_model.dart';
export 'crearcuentacobrar_model.dart';

/// Create a component que tenga:
/// contenedor de fecha
/// dropdown
/// entrada de texto de Cuenta por cobrar
/// estado
/// dropdown
/// botón de crear
///
/// Con una interfaz bonita
///
class CrearcuentacobrarWidget extends StatefulWidget {
  const CrearcuentacobrarWidget({super.key});

  @override
  State<CrearcuentacobrarWidget> createState() =>
      _CrearcuentacobrarWidgetState();
}

class _CrearcuentacobrarWidgetState extends State<CrearcuentacobrarWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late CrearcuentacobrarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearcuentacobrarModel());

    _model.montoTextController ??= TextEditingController();
    _model.montoFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 570.0,
        ),
        decoration: BoxDecoration(
          color: _theme.secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: _theme.primary,
                  icon: Icon(
                    Icons.close,
                    color: _theme.info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Fecha',
                      style: _theme.bodyMedium.override(
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
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet<bool>(
                          context: context,
                          builder: (context) {
                            return ScrollConfiguration(
                              behavior: const MaterialScrollBehavior().copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.unknown
                                },
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                width: MediaQuery.of(context).size.width,
                                child: CupertinoDatePicker(
                                  mode: CupertinoDatePickerMode.date,
                                  minimumDate: DateTime(1900),
                                  initialDateTime: getCurrentTimestamp,
                                  maximumDate: DateTime(2050),
                                  use24hFormat: false,
                                  onDateTimeChanged: (newDateTime) =>
                                      safeSetState(() {
                                    _model.datePicked = newDateTime;
                                  }),
                                ),
                              ),
                            );
                          });
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: _theme.secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: _theme.alternate,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 12.0, 12.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "d/M/y",
                                  _model.datePicked,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                'Seleccionar fecha',
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
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: _theme.primaryText,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Usuario',
                      style: _theme.bodyMedium.override(
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
                    ),
                  ),
                  StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _theme.primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<UsersRecord> usuarioUsersRecordList = snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.usuarioValueController ??=
                            FormFieldController<String>(
                          _model.usuarioValue ??= '',
                        ),
                        options: List<String>.from(usuarioUsersRecordList
                            .map((e) => e.reference.id)
                            .toList()),
                        optionLabels: usuarioUsersRecordList
                            .map((e) => e.displayName)
                            .toList(),
                        onChanged: (val) =>
                            safeSetState(() => _model.usuarioValue = val),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 50.0,
                        textStyle:
                            _theme.bodyMedium.override(
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
                        hintText: 'Seleccionar',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: _theme.secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            _theme.secondaryBackground,
                        elevation: 2.0,
                        borderColor: _theme.alternate,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        hidesUnderline: true,
                        isOverButton: false,
                        isSearchable: false,
                        isMultiSelect: false,
                      );
                    },
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Tipo de documento',
                      style: _theme.bodyMedium.override(
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
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.tipodocumentoValueController ??=
                        FormFieldController<String>(null),
                    options: ['Option 1', 'Option 2', 'Option 3'],
                    onChanged: (val) =>
                        safeSetState(() => _model.tipodocumentoValue = val),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    textStyle: _theme.bodyMedium.override(
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
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                    hintText: 'Seleccionar',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: _theme.secondaryText,
                      size: 24.0,
                    ),
                    fillColor: _theme.secondaryBackground,
                    elevation: 2.0,
                    borderColor: _theme.alternate,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Monto por Cobrar',
                      style: _theme.bodyMedium.override(
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
                    ),
                  ),
                  TextFormField(
                    controller: _model.montoTextController,
                    focusNode: _model.montoFocusNode,
                    autofocus: false,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintStyle:
                          _theme.bodyMedium.override(
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.alternate,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          _theme.secondaryBackground,
                    ),
                    style: _theme.bodyMedium.override(
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
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                    minLines: 1,
                    keyboardType: TextInputType.number,
                    validator: _model.montoTextControllerValidator
                        .asValidator(context),
                    inputFormatters: [
                      if (!isAndroid && !isiOS)
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          return TextEditingValue(
                            selection: newValue.selection,
                            text: newValue.text
                                .toCapitalization(TextCapitalization.none),
                          );
                        }),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                    child: Text(
                      'Estado',
                      style: _theme.bodyMedium.override(
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
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.estadoValueController ??=
                        FormFieldController<String>(null),
                    options: ['Option 1'],
                    onChanged: (val) =>
                        safeSetState(() => _model.estadoValue = val),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 50.0,
                    textStyle: _theme.bodyMedium.override(
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
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                    hintText: 'Seleccionar',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: _theme.secondaryText,
                      size: 24.0,
                    ),
                    fillColor: _theme.secondaryBackground,
                    elevation: 2.0,
                    borderColor: _theme.alternate,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
              FFButtonWidget(
                onPressed: () async {
                  _model.user = await queryUsersRecordOnce(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'uid',
                      isEqualTo: _model.usuarioValue,
                    ),
                    singleRecord: true,
                  ).then((s) => s.firstOrNull);

                  await CuentasPorCobrarRecord.collection.doc().set({
                    ...createCuentasPorCobrarRecordData(
                      montoTotal:
                          double.tryParse(_model.montoTextController.text),
                      estado: _model.estadoValue,
                      fecha: _model.datePicked,
                      tipoDocumento: _model.tipodocumentoValue,
                      clienteid: _model.user?.reference,
                      clientenombre: _model.user?.displayName,
                      saldoPendiente:
                          double.tryParse(_model.montoTextController.text),
                    ),
                    ...mapToFirestore(
                      {
                        'fecha_creacion': FieldValue.serverTimestamp(),
                      },
                    ),
                  });
                  Navigator.pop(context);

                  safeSetState(() {});
                },
                text: 'Crear Cuenta',
                icon: Icon(
                  Icons.add_rounded,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconColor: _theme.info,
                  color: _theme.primary,
                  textStyle: _theme.titleSmall.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              _theme.titleSmall.fontStyle,
                        ),
                        color: _theme.info,
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.titleSmall.fontWeight,
                        fontStyle:
                            _theme.titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
