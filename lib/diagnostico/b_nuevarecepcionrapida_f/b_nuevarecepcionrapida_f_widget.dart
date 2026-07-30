import '/auth/firebase_auth/auth_util.dart';
import '/components/user_avatar_widget.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/diagnostico/agregar_cliente/agregar_cliente_widget.dart';
import '/diagnostico/agregar_vehiculo/agregar_vehiculo_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'b_nuevarecepcionrapida_f_model.dart';
export 'b_nuevarecepcionrapida_f_model.dart';

class BNuevarecepcionrapidaFWidget extends StatefulWidget {
  const BNuevarecepcionrapidaFWidget({
    super.key,
    this.recepcionid,
  });

  final DocumentReference? recepcionid;

  static String routeName = 'b-nuevarecepcionrapidaF';
  static String routePath = '/bNuevarecepcionrapidaF';

  @override
  State<BNuevarecepcionrapidaFWidget> createState() =>
      _BNuevarecepcionrapidaFWidgetState();
}

class _BNuevarecepcionrapidaFWidgetState
    extends State<BNuevarecepcionrapidaFWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late BNuevarecepcionrapidaFModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BNuevarecepcionrapidaFModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.recepcionid != null) {
        _model.recepcionDATOS =
            await RecepcionesRecord.getDocumentOnce(widget.recepcionid!);
        if (_model.recepcionDATOS!.hasFotos()) {
          _model.imagenesauto = List.from(_model.recepcionDATOS!.fotos);
        }
        safeSetState(() {
          _model.motivoTextController?.text =
              _model.recepcionDATOS!.motivoIngreso;
        });
        safeSetState(() {
          _model.dropDownTipoServicioValueController?.value =
              _model.recepcionDATOS!.tipoServicio;
          _model.dropDownTipoServicioValue =
              _model.recepcionDATOS!.tipoServicio;
        });
        safeSetState(() {
          _model.dropDownTecnicoValueController?.value =
              _model.recepcionDATOS!.tecnicoServicio;
          _model.dropDownTecnicoValue = _model.recepcionDATOS!.tecnicoServicio;
        });
        safeSetState(() {
          _model.nombrePersonaValueController?.value =
              _model.recepcionDATOS!.nombreCliente;
          _model.nombrePersonaValue = _model.recepcionDATOS!.nombreCliente;
        });
        safeSetState(() {
          _model.numeroPlacaValueController?.value =
              _model.recepcionDATOS!.placa;
          _model.numeroPlacaValue = _model.recepcionDATOS!.placa;
        });
        safeSetState(() {
          _model.kmIngresoTextController?.text =
              _model.recepcionDATOS!.kmIngreso;
        });
        safeSetState(() {
          _model.tipopersonaValueController?.value =
              _model.recepcionDATOS!.tipoPersona;
          _model.tipopersonaValue = _model.recepcionDATOS!.tipoPersona;
        });
        safeSetState(() {
          _model.textFieldRucTextController?.text =
              _model.recepcionDATOS!.rUCempresa;
        });
        safeSetState(() {
          _model.telefonoJuridicoTextController?.text =
              _model.recepcionDATOS!.telefono;
        });
        safeSetState(() {
          _model.correoJuriidcoTextController?.text =
              _model.recepcionDATOS!.correoElectronico;
        });
        safeSetState(() {
          _model.modeloTextController?.text = _model.recepcionDATOS!.modelo;
        });
        safeSetState(() {
          _model.marcaTextController?.text = _model.recepcionDATOS!.marca;
        });
      }
    });

    _model.dniNaturalTextController ??= TextEditingController();
    _model.dniNaturalFocusNode ??= FocusNode();

    _model.telefonoNaturalTextController ??= TextEditingController();
    _model.telefonoNaturalFocusNode ??= FocusNode();

    _model.correonaturalTextController ??= TextEditingController();
    _model.correonaturalFocusNode ??= FocusNode();

    _model.textFieldRucTextController ??= TextEditingController();
    _model.textFieldRucFocusNode ??= FocusNode();

    _model.telefonoJuridicoTextController ??= TextEditingController();
    _model.telefonoJuridicoFocusNode ??= FocusNode();

    _model.correoJuriidcoTextController ??= TextEditingController();
    _model.correoJuriidcoFocusNode ??= FocusNode();

    _model.marcaTextController ??= TextEditingController(
        text: widget.recepcionid != null ? _model.recepcionDATOS?.marca : '');
    _model.marcaFocusNode ??= FocusNode();

    _model.modeloTextController ??= TextEditingController(
        text: widget.recepcionid != null ? _model.recepcionDATOS?.modelo : '');
    _model.modeloFocusNode ??= FocusNode();

    _model.kmIngresoTextController ??= TextEditingController();
    _model.kmIngresoFocusNode ??= FocusNode();

    _model.motivoTextController ??= TextEditingController();
    _model.motivoFocusNode ??= FocusNode();

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 38.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: _theme.primary,
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
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'Recepción Rápida',
                          style: _theme
                              .headlineSmall
                              .override(
                                font: GoogleFonts.montserrat(
                                  fontWeight: _theme
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: _theme
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: _theme
                                    .headlineSmall
                                    .fontWeight,
                                fontStyle: _theme
                                    .headlineSmall
                                    .fontStyle,
                              ),
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
                                        fontWeight: _theme
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: _theme
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
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Form(
                    key: _model.formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 25.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Datos personales',
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
                                        fontWeight: _theme
                                            .titleLarge
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  'Tipo de persona',
                                  style: _theme
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              _theme
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: _theme
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.tipopersonaValueController ??=
                                  FormFieldController<String>(
                                _model.tipopersonaValue ??=
                                    FFAppConstants.TipoPersonaNatural,
                              ),
                              options: [
                                FFAppConstants.TipoPersonaNatural,
                                FFAppConstants.TipoPersonaJuridica
                              ],
                              onChanged: (val) => safeSetState(
                                  () => _model.tipopersonaValue = val),
                              width: double.infinity,
                              height: 50.0,
                              textStyle: _theme
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
                                    color: _theme.accent1,
                                    letterSpacing: 0.0,
                                    fontWeight: _theme
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: _theme
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              hintText: 'Seleccione',
                              icon: Icon(
                                Icons.expand_circle_down_outlined,
                                color: _theme.primary,
                                size: 25.0,
                              ),
                              fillColor: _theme.accent2,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
                              borderWidth: 2.0,
                              borderRadius: 8.0,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                                         hidesUnderline: true,
                                         isOverButton: false,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  _model.tipopersonaValue == 'Juridica'
                                      ? 'Razon social'
                                      : 'Nombre del cliente',
                                  style: _theme
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              _theme
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: _theme
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: StreamBuilder<List<UsersRecord>>(
                                    stream: queryUsersRecord(
                                      queryBuilder: (usersRecord) =>
                                          usersRecord.where(
                                        'tipo_de_persona',
                                        isEqualTo: _model.tipopersonaValue,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                _theme
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<UsersRecord>
                                          nombrePersonaUsersRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .nombrePersonaValueController ??=
                                            FormFieldController<String>(
                                          _model.nombrePersonaValue ??= '',
                                        ),
                                        options: List<String>.from(
                                            nombrePersonaUsersRecordList
                                                .map((e) => e.reference.id)
                                                .toList()),
                                        optionLabels:
                                            nombrePersonaUsersRecordList
                                                .map((e) => e.displayName)
                                                .toList(),
                                        onChanged: (val) async {
                                          safeSetState(() =>
                                              _model.nombrePersonaValue = val);
                                          _model.readUser =
                                              await UsersRecord.getDocumentOnce(
                                                  nombrePersonaUsersRecordList
                                                      .where((e) =>
                                                          e.reference.id ==
                                                          _model
                                                              .nombrePersonaValue)
                                                      .toList()
                                                      .firstOrNull!
                                                      .reference);
                                          if (_model.tipopersonaValue ==
                                              FFAppConstants
                                                  .TipoPersonaJuridica) {
                                            safeSetState(() {
                                              _model.correoJuriidcoTextController
                                                      ?.text =
                                                  _model.readUser!.email;
                                            });
                                            safeSetState(() {
                                              _model.textFieldRucTextController
                                                  ?.text = _model.readUser!.ruc;
                                            });
                                            safeSetState(() {
                                              _model.telefonoJuridicoTextController
                                                      ?.text =
                                                  _model.readUser!.phoneNumber;
                                            });
                                            safeSetState(() {
                                              _model.codigoPais2ValueController
                                                      ?.value =
                                                  _model.readUser!.codigo;
                                              _model.codigoPais2Value =
                                                  _model.readUser!.codigo;
                                            });
                                          } else {
                                            safeSetState(() {
                                              _model.dniNaturalTextController
                                                  ?.text = _model.readUser!.identityDocument.isNotEmpty ? _model.readUser!.identityDocument : _model.readUser!.dni;
                                            });
                                            safeSetState(() {
                                              _model.telefonoNaturalTextController
                                                      ?.text =
                                                  _model.readUser!.phoneNumber;
                                            });
                                            safeSetState(() {
                                              _model.codigoPaisValueController
                                                      ?.value =
                                                  _model.readUser!.codigo;
                                              _model.codigoPaisValue =
                                                  _model.readUser!.codigo;
                                            });
                                            safeSetState(() {
                                              _model.correonaturalTextController
                                                      ?.text =
                                                  _model.readUser!.email;
                                            });
                                          }

                                          safeSetState(() {});
                                        },
                                        height: 50.0,
                                        searchHintTextStyle: FlutterFlowTheme
                                                .of(context)
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
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        textStyle: _theme
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  _theme
                                                      .accent1,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        hintText: 'Seleccione',
                                        searchHintText: 'Search for an item...',
                                        icon: Icon(
                                          Icons.expand_circle_down_outlined,
                                          color: _theme
                                              .primary,
                                          size: 25.0,
                                        ),
                                        fillColor: _theme
                                            .accent2,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                        isOverButton: false,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: GestureDetector(
                                            onTap: () {
                                              FocusScope.of(dialogContext)
                                                  .unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: AgregarClienteWidget(
                                              tipoPersona:
                                                  _model.tipopersonaValue!,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: _theme
                                            .primary,
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color:
                                          _theme.primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                          if (_model.tipopersonaValue ==
                              FFAppConstants.TipoPersonaNatural)
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: Text(
                                          'Número de DNI',
                                          style: _theme
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.dniNaturalTextController,
                                      focusNode: _model.dniNaturalFocusNode,
                                      autofocus: false,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Ingrese DNI',
                                        labelStyle: _theme
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  _theme
                                                      .accent1,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                        hintStyle: _theme
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
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: _theme
                                            .accent2,
                                      ),
                                      style: _theme
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  _theme
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                _theme
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model
                                          .dniNaturalTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if ((_model.userSelected == null) &&
                                      (_model.tipopersonaValue ==
                                          FFAppConstants.TipoPersonaNatural))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 25.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Teléfono',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (_model.userCodigo == null ||
                                                    _model.userCodigo == '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .codigoPaisValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.codigoPaisValue ??=
                                                            '+51',
                                                      ),
                                                      options: ['+51', '+52'],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.codigoPaisValue =
                                                                  val),
                                                      width: 136.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      hintText: '+51',
                                                      icon: Icon(
                                                        Icons
                                                            .expand_circle_down_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                if (_model.userCodigo != null &&
                                                    _model.userCodigo != '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .dropDownCodigoValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.dropDownCodigoValue ??=
                                                            _model.userCodigo,
                                                      ),
                                                      options: ['+51', '+52'],
                                                      onChanged: (val) =>
                                                          safeSetState(() =>
                                                              _model.dropDownCodigoValue =
                                                                  val),
                                                      width: 136.0,
                                                      height: 50.0,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      icon: Icon(
                                                        Icons
                                                            .expand_circle_down_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      elevation: 2.0,
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderWidth: 2.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
                                                                  4.0),
                                                      hidesUnderline: true,
                                                      isOverButton: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 10.0,
                                                                0.0, 0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .telefonoNaturalTextController,
                                                      focusNode: _model
                                                          .telefonoNaturalFocusNode,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.telefonoNaturalTextController',
                                                        Duration(
                                                            milliseconds: 100),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      readOnly: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelText: 'Teléfono',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent1,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .montserrat(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        errorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            UnderlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      validator: _model
                                                          .telefonoNaturalTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 0.0),
                                            child: Text(
                                              'Correo electronico',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .correonaturalTextController,
                                          focusNode:
                                              _model.correonaturalFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.correonaturalTextController',
                                            Duration(milliseconds: 100),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Ingrese correo',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                _theme
                                                    .accent2,
                                          ),
                                          style: _theme
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          validator: _model
                                              .correonaturalTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (_model.tipopersonaValue ==
                              FFAppConstants.TipoPersonaJuridica)
                            Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: Text(
                                          'Ruc de la empresa',
                                          style: _theme
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: TextFormField(
                                      controller:
                                          _model.textFieldRucTextController,
                                      focusNode: _model.textFieldRucFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Ingrese RUC',
                                        labelStyle: _theme
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  _theme
                                                      .accent1,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                        hintStyle: _theme
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
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder:
                                            UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _theme
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: _theme
                                            .accent2,
                                      ),
                                      style: _theme
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  _theme
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                _theme
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      validator: _model
                                          .textFieldRucTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 25.0, 0.0, 0.0),
                                        child: Text(
                                          'Telefono',
                                          style: _theme
                                              .titleMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .codigoPais2ValueController ??=
                                              FormFieldController<String>(
                                            _model.codigoPais2Value ??= '+51',
                                          ),
                                          options: ['+51', '+52'],
                                          onChanged: (val) => safeSetState(() =>
                                              _model.codigoPais2Value = val),
                                          width: 136.0,
                                          height: 50.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                          hintText: '+51',
                                          icon: Icon(
                                            Icons.expand_circle_down_outlined,
                                            color: _theme
                                                .primary,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              _theme
                                                  .accent2,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4.0, 10.0, 0.0, 0.0),
                                          child: TextFormField(
                                            controller: _model
                                                .telefonoJuridicoTextController,
                                            focusNode: _model
                                                .telefonoJuridicoFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.telefonoJuridicoTextController',
                                              Duration(milliseconds: 100),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Teléfono',
                                              labelStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .labelMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  _theme
                                                      .accent2,
                                            ),
                                            style: _theme
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            validator: _model
                                                .telefonoJuridicoTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 0.0),
                                            child: Text(
                                              'Correo electronico',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .correoJuriidcoTextController,
                                          focusNode:
                                              _model.correoJuriidcoFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.correoJuriidcoTextController',
                                            Duration(milliseconds: 100),
                                            () => safeSetState(() {}),
                                          ),
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Ingrese correo',
                                            labelStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .accent1,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .fontStyle,
                                                ),
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.montserrat(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    _theme
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                _theme
                                                    .accent2,
                                          ),
                                          style: _theme
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.montserrat(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    _theme
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          validator: _model
                                              .correoJuriidcoTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                  if ((_model.correoJuriidcoTextController
                                                  .text !=
                                              '') &&
                                      (_model.userSelected == null) &&
                                      (_model.tipopersonaValue == 'Jurídica'))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 6.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          if (_model.readUser?.reference != null)
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Número de placa',
                                        style: _theme
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                          child: FutureBuilder<
                                              List<VehiculosRecord>>(
                                          key: ValueKey(_model.readUser?.reference.id),
                                          future: () async {
                                            final refQuery =
                                                queryVehiculosRecordOnce(
                                              queryBuilder: (q) => q.where(
                                                  'Propietario',
                                                  isEqualTo: _model
                                                      .readUser?.reference),
                                            );
                                            final nameQuery =
                                                queryVehiculosRecordOnce(
                                              queryBuilder: (q) => q.where(
                                                  'Propietario_name',
                                                  isEqualTo: _model
                                                      .readUser?.displayName),
                                            );
                                            final results =
                                                await Future.wait(
                                                    [refQuery, nameQuery]);
                                            final seen = <String>{};
                                            return [
                                              ...results[0],
                                              ...results[1]
                                            ]
                                                .where((v) =>
                                                    seen.add(
                                                        v.reference.path))
                                                .toList();
                                          }(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<VehiculosRecord>
                                                numeroPlacaVehiculosRecordList =
                                                snapshot.data!;

                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .numeroPlacaValueController ??=
                                                  FormFieldController<String>(
                                                _model.numeroPlacaValue ??=
                                                    widget.recepcionid != null
                                                        ? _model.recepcionDATOS
                                                            ?.placa
                                                        : '',
                                              ),
                                              options: List<String>.from(
                                                  numeroPlacaVehiculosRecordList
                                                      .map(
                                                          (e) => e.reference.id)
                                                      .toList()),
                                              optionLabels:
                                                  numeroPlacaVehiculosRecordList
                                                      .map((e) => e.placa)
                                                      .toList(),
                                              onChanged: (val) async {
                                                safeSetState(() => _model
                                                    .numeroPlacaValue = val);
                                                _model.readVehicle =
                                                    await VehiculosRecord
                                                        .getDocumentOnce(
                                                            numeroPlacaVehiculosRecordList
                                                                .where((e) =>
                                                                    e.reference
                                                                        .id ==
                                                                    _model
                                                                        .numeroPlacaValue)
                                                                .toList()
                                                                .firstOrNull!
                                                                .reference);
                                                safeSetState(() {
                                                  _model.marcaTextController
                                                          ?.text =
                                                      _model.readVehicle!.marca;
                                                  _model.vehiculoMarca =
                                                      _model.readVehicle!.marca;
                                                  _model.marcaValueController
                                                      ?.value =
                                                      _model.readVehicle!.marca;
                                                });
                                                safeSetState(() {
                                                  _model.modeloTextController
                                                          ?.text =
                                                      _model
                                                          .readVehicle!.modelo;
                                                  _model.vehiculoModelo =
                                                      _model
                                                          .readVehicle!.modelo;
                                                  _model.modeloValueController
                                                      ?.value =
                                                      _model
                                                          .readVehicle!.modelo;
                                                });
                                                safeSetState(() {
                                                  _model.kmIngresoTextController
                                                          ?.text =
                                                      _model.readVehicle!
                                                          .aniodemodelo;
                                                });

                                                safeSetState(() {});
                                              },
                                              height: 50.0,
                                              searchHintTextStyle:
                                                  _theme
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              searchTextStyle: FlutterFlowTheme
                                                      .of(context)
                                                  .bodyMedium
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Seleccione',
                                              searchHintText:
                                                  'Search for an item...',
                                              icon: Icon(
                                                Icons
                                                    .expand_circle_down_outlined,
                                                color:
                                                    _theme
                                                        .primary,
                                                size: 25.0,
                                              ),
                                              fillColor:
                                                  _theme
                                                      .accent2,
                                              elevation: 2.0,
                                              borderColor: Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: true,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: AgregarVehiculoWidget(
                                                    idUser: _model
                                                        .readUser!.reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color:
                                                  _theme
                                                      .primary,
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            color: _theme
                                                .primary,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 5.0)),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Marca',
                                        style: _theme
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<
                                            List<VehicleMarcaBrandRecord>>(
                                          stream:
                                              queryVehicleMarcaBrandRecord(),
                                          builder: (context, snapshot) {
                                            final marcas = snapshot.data ?? [];
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .marcaValueController ??=
                                                  FormFieldController<String>(
                                                      _model.vehiculoMarca ?? ''),
                                              options: marcas
                                                  .map((m) => m.name)
                                                  .toList(),
                                              onChanged: (val) =>
                                                  safeSetState(() {
                                                _model.vehiculoMarca = val;
                                                _model.marcaTextController
                                                    ?.text = val ?? '';
                                              }),
                                              width: double.infinity,
                                              height: 50.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Seleccionar marca',
                                              fillColor:
                                                  _theme
                                                      .accent2,
                                              elevation: 2.0,
                                              borderColor:
                                                  Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color:
                                                _theme
                                                    .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            final controller =
                                                TextEditingController();
                                            await showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: const Text(
                                                    'Nueva marca'),
                                                content: TextField(
                                                  controller: controller,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'Nombre de la marca',
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: const Text(
                                                        'Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      if (controller
                                                          .text
                                                          .isNotEmpty) {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'vehicle_marca_brand')
                                                            .add({
                                                          'name':
                                                              controller.text,
                                                        });
                                                        Navigator.pop(ctx);
                                                      }
                                                    },
                                                    child: const Text(
                                                        'Guardar'),
                                                  ),
                                                ],
                                              ),
                                            );
                                            controller.dispose();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Modelo',
                                        style: _theme
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: StreamBuilder<
                                            List<VehicleModelModeloRecord>>(
                                          stream:
                                              queryVehicleModelModeloRecord(),
                                          builder: (context, snapshot) {
                                            final modelos =
                                                snapshot.data ?? [];
                                            final filtered = _model
                                                    .vehiculoMarca
                                                    ?.isNotEmpty ==
                                                    true
                                                ? modelos
                                                    .where((m) =>
                                                        m.marca
                                                            .trim()
                                                            .toLowerCase() ==
                                                        _model
                                                            .vehiculoMarca!
                                                            .trim()
                                                            .toLowerCase())
                                                    .toList()
                                                : modelos;
                                            return FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .modeloValueController ??=
                                                  FormFieldController<String>(
                                                      _model.vehiculoModelo ?? ''),
                                              options: filtered
                                                  .map((m) => m.name)
                                                  .toList(),
                                              onChanged: (val) =>
                                                  safeSetState(() {
                                                _model.vehiculoModelo = val;
                                                _model.modeloTextController
                                                    ?.text = val ?? '';
                                              }),
                                              width: double.infinity,
                                              height: 50.0,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    font: GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .accent1,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                              hintText: 'Seleccionar modelo',
                                              fillColor:
                                                  _theme
                                                      .accent2,
                                              elevation: 2.0,
                                              borderColor:
                                                  Colors.transparent,
                                              borderWidth: 2.0,
                                              borderRadius: 8.0,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 4.0, 16.0, 4.0),
                                              hidesUnderline: true,
                                              isOverButton: true,
                                              isSearchable: false,
                                              isMultiSelect: false,
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color:
                                                _theme
                                                    .primary,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            if (_model.vehiculoMarca ==
                                                    null ||
                                                _model.vehiculoMarca!.isEmpty) {
                                              return;
                                            }
                                            final controller =
                                                TextEditingController();
                                            await showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                title: const Text(
                                                    'Nuevo modelo'),
                                                content: TextField(
                                                  controller: controller,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'Nombre del modelo',
                                                  ),
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(ctx),
                                                    child: const Text(
                                                        'Cancelar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      if (controller
                                                          .text
                                                          .isNotEmpty) {
                                                        await FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'vehicle_model_modelo')
                                                         .add({
                                                           'name':
                                                               controller.text,
                                                           'brandname':
                                                               _model
                                                                   .vehiculoMarca,
                                                           'marca':
                                                               _model
                                                                   .vehiculoMarca,
                                                         });
                                                        Navigator.pop(ctx);
                                                      }
                                                    },
                                                    child: const Text(
                                                        'Guardar'),
                                                  ),
                                                ],
                                              ),
                                            );
                                            controller.dispose();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  'Kilometraje de ingreso',
                                  style: _theme
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight:
                                              _theme
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: _theme
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: TextFormField(
                              controller: _model.kmIngresoTextController,
                              focusNode: _model.kmIngresoFocusNode,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Km de ingreso',
                                labelStyle: _theme
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: _theme
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color:
                                          _theme.accent1,
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .titleMedium
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
                              validator: _model.kmIngresoTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Problema técnico',
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
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 0.0),
                                      child: Text(
                                        'Técnico de servicio',
                                        style: _theme
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                    child: FutureBuilder<List<UsersRecord>>(
                                      future: queryUsersRecordOnce(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<Color>(
                                                  _theme
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                       if (snapshot.hasError) {
                                         return Text(
                                           'Error al cargar técnicos',
                                           style: _theme
                                               .bodyMedium,
                                         );
                                       }
                                       List<UsersRecord>
                                           dropDownTecnicoUsersRecordList =
                                           snapshot.data ?? [];
                                       dropDownTecnicoUsersRecordList =
                                           dropDownTecnicoUsersRecordList
                                               .where((u) =>
                                                   u.userRole != 'Cliente')
                                               .toList();
                                       if (dropDownTecnicoUsersRecordList
                                           .isEmpty) {
                                         return Text(
                                           'No hay técnicos disponibles',
                                           style: _theme
                                               .bodyMedium,
                                         );
                                       }

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .dropDownTecnicoValueController ??=
                                            FormFieldController<String>(null),
                                        options: dropDownTecnicoUsersRecordList
                                            .map((e) => valueOrDefault<String>(
                                                  e.displayName,
                                                  'nom',
                                                ))
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.dropDownTecnicoValue = val),
                                        width: double.infinity,
                                        height: 50.0,
                                        textStyle: _theme
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  _theme
                                                      .accent1,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        hintText: 'Seleccionar técnico',
                                        icon: Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: _theme
                                              .primary,
                                          size: 24.0,
                                        ),
                                        fillColor: _theme
                                            .accent2,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 2.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 4.0, 16.0, 4.0),
                                        hidesUnderline: true,
                                         isOverButton: true,
                                         isSearchable: false,
                                         isMultiSelect: false,
                                       );
                                     },
                                   ),
                                 ),
                                 Row(
                                   mainAxisSize: MainAxisSize.max,
                                   children: [
                                     Padding(
                                       padding: EdgeInsetsDirectional.fromSTEB(
                                           0.0, 25.0, 0.0, 0.0),
                                       child: Text(
                                         'Tipo de servicio',
                                        style: _theme
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDownTipoServicioValueController ??=
                                        FormFieldController<String>(null),
                                    options: [
                                      'Preventivo',
                                      'Correctivo',
                                      'Predictivo'
                                    ],
                                    onChanged: (val) => safeSetState(() =>
                                        _model.dropDownTipoServicioValue = val),
                                    width: double.infinity,
                                    height: 50.0,
                                    textStyle: _theme
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight:
                                                _theme
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: _theme
                                              .accent1,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              _theme
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              _theme
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    hintText: 'Seleccionar',
                                    icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined,
                                      color:
                                          _theme.primary,
                                      size: 24.0,
                                    ),
                                    fillColor:
                                        _theme.accent2,
                                    elevation: 2.0,
                                    borderColor: Colors.transparent,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 10.0),
                                      child: Text(
                                        'Motivo de ingreso',
                                        style: _theme
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: _theme.accent2,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    child: TextFormField(
                                      controller: _model.motivoTextController,
                                      focusNode: _model.motivoFocusNode,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Describa el motivo',
                                        labelStyle: _theme
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
                                              color:
                                                  _theme
                                                      .accent1,
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
                                        alignLabelWithHint: true,
                                        hintStyle: _theme
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.montserrat(
                                                fontWeight:
                                                    _theme
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  _theme
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 0.0, 0.0),
                                      ),
                                      style: _theme
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.montserrat(
                                              fontWeight:
                                                  _theme
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  _theme
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                _theme
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                _theme
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      maxLines: 6,
                                      validator: _model
                                          .motivoTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                 Container(
                                   decoration: BoxDecoration(),
                                   child: Column(
                                     mainAxisSize: MainAxisSize.max,
                                     children: [
                                       if (_model.isDataUploading_imgauto24 ||
                                           _model.isDataUploading_imgauto)
                                         Padding(
                                           padding: EdgeInsetsDirectional.fromSTEB(
                                               0.0, 8.0, 0.0, 0.0),
                                           child: Row(
                                             mainAxisSize: MainAxisSize.min,
                                             children: [
                                               SizedBox(
                                                 width: 16.0,
                                                 height: 16.0,
                                                 child: CircularProgressIndicator(
                                                   strokeWidth: 2.0,
                                                 ),
                                               ),
                                               SizedBox(width: 8.0),
                                               Text(
                                                 'Subiendo foto...',
                                                 style: FlutterFlowTheme.of(
                                                         context)
                                                     .labelSmall,
                                               ),
                                             ],
                                           ),
                                         ),
                                       if (_model.imagenesauto.length > 0)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Fotos',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .montserrat(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final imgauto =
                                                                  _model
                                                                      .imagenesauto
                                                                      .map(
                                                                          (e) =>
                                                                              e)
                                                                      .toList();

                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    imgauto
                                                                        .length,
                                                                    (imgautoIndex) {
                                                                  final imgautoItem =
                                                                      imgauto[
                                                                          imgautoIndex];
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                      children: [
                                                                        ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              imgautoItem,
                                                                              'https://firebasestorage.googleapis.com/v0/b/g-m-parts-lac7fg.appspot.com/o/josh-berquist-_4sWbzH5fp8-unsplash%20(1).jpg?alt=media&token=ec12925f-66f8-442a-9f86-be4705481629',
                                                                            ),
                                                                            width:
                                                                                100.0,
                                                                            height:
                                                                                100.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                5.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.removeAtIndexFromImagenesauto(imgautoIndex);
                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: _theme.primaryBackground,
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.clear,
                                                                                    color: _theme.primary,
                                                                                    size: 12.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }).divide(SizedBox(
                                                                    width:
                                                                        15.0)),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                final selectedMedia =
                                                                    await selectMedia(
                                                                  maxWidth:
                                                                      1080.00,
                                                                  maxHeight:
                                                                      1080.00,
                                                                  multiImage:
                                                                      false,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  safeSetState(() =>
                                                                      _model.isDataUploading_imgauto24 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                              originalFilename: m.originalFilename,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading_imgauto24 =
                                                                        false;
                                                                  }
                                                                   if (selectedUploadedFiles
                                                                               .length ==
                                                                           selectedMedia
                                                                               .length &&
                                                                       downloadUrls
                                                                               .length ==
                                                                           selectedMedia
                                                                               .length) {
                                                                     safeSetState(
                                                                         () {
                                                                       _model.uploadedLocalFile_imgauto24 =
                                                                           selectedUploadedFiles
                                                                               .first;
                                                                       _model.uploadedFileUrl_imgauto24 =
                                                                           downloadUrls
                                                                               .first;
                                                                     });
                                                                     _model.addToImagenesauto(
                                                                         _model
                                                                             .uploadedFileUrl_imgauto24);
                                                                   } else {
                                                                     safeSetState(
                                                                         () {});
                                                                     ScaffoldMessenger.of(
                                                                             context)
                                                                         .showSnackBar(
                                                                       SnackBar(
                                                                         content: Text(
                                                                           'Error al subir la foto. Intenta de nuevo.',
                                                                         ),
                                                                       ),
                                                                     );
                                                                      return;
                                                                    }
                                                                  }
                                                                 safeSetState(
                                                                     () {});
                                                               },
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 3.0,
                                                                  ),
                                                                ),
                                                                child: Icon(
                                                                  Icons
                                                                      .camera_alt_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 28.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ]
                                                          .divide(SizedBox(
                                                              width: 12.0))
                                                          .addToEnd(SizedBox(
                                                              width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              maxWidth: 1080.00,
                                              maxHeight: 1080.00,
                                              allowPhoto: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              safeSetState(() => _model
                                                      .isDataUploading_imgauto =
                                                  true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                              blurHash:
                                                                  m.blurHash,
                                                              originalFilename:
                                                                  m.originalFilename,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading_imgauto =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_imgauto =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl_imgauto =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Error al subir la foto. Intenta de nuevo.',
                                                    ),
                                                  ),
                                                );
                                                return;
                                              }
                                            }

                                            if ((_model.uploadedFileUrl_imgauto !=
                                                        '') &&
                                                (_model.imagenesauto.contains(_model
                                                        .uploadedFileUrl_imgauto) ==
                                                    false)) {
                                              _model.addToImagenesauto(_model
                                                  .uploadedFileUrl_imgauto);
                                              safeSetState(() {});
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    _theme
                                                        .primary,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Spacer(),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Tomar foto del auto',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmall
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.camera_alt,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 35.0, 0.0, 50.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.tipopersonaValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Seleccione el tipo de persona',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                _theme
                                                    .primary,
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.codigoPaisValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Seleccione el codigo de pais',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                _theme
                                                    .primary,
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.dropDownTecnicoValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Seleccione un tecnico ',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                _theme
                                                    .primary,
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.dropDownTipoServicioValue ==
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Seleccione el tipo de servicio',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .labelLarge
                                                  .override(
                                                    font:
                                                        GoogleFonts.montserrat(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 4000),
                                            backgroundColor:
                                                _theme
                                                    .primary,
                                          ),
                                        );
                                        return;
                                      }
                                      if (widget.recepcionid != null) {
                                        await widget.recepcionid!.update({
                                          ...createRecepcionesRecordData(
                                            tipoPersona:
                                                _model.tipopersonaValue,
                                            nombreCliente:
                                                _model.readUser?.displayName,
                                            telefono:
                                                '${_model.codigoPaisValue}${_model.tipopersonaValue == FFAppConstants.TipoPersonaNatural ? _model.telefonoNaturalTextController.text : _model.telefonoJuridicoTextController.text}',
                                            placa: _model.readVehicle?.placa,
                                            marca:
                                                _model.marcaTextController.text,
                                            modelo: _model
                                                .modeloTextController.text,
                                            kmIngreso: _model
                                                .kmIngresoTextController.text,
                                            tecnicoServicio:
                                                _model.dropDownTecnicoValue,
                                            tipoServicio: _model
                                                .dropDownTipoServicioValue,
                                            motivoIngreso: _model
                                                .motivoTextController.text,
                                            dni: _model
                                                .dniNaturalTextController.text,
                                            rUCempresa: _model
                                                .textFieldRucTextController
                                                .text,
                                            razonSocial: _model
                                                .correoJuriidcoTextController
                                                .text,
                                            numeroVIN:
                                                _model.readVehicle?.vINSerie,
                                            anoFabricacion: _model
                                                .readVehicle?.anioDeFabricion,
                                            correoElectronico:
                                                _model
                                                            .tipopersonaValue ==
                                                        'Natural'
                                                    ? _model
                                                        .correonaturalTextController
                                                        .text
                                                    : _model
                                                        .correoJuriidcoTextController
                                                        .text,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'fotos': _model.imagenesauto,
                                            },
                                          ),
                                        });

                                        context.pushNamed(
                                          FRecepcionGuardadaWidget.routeName,
                                          queryParameters: {
                                            'id': serializeParam(
                                              _model
                                                  .recepcionDATOS?.numeroorden,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        _model.randomid = random_data
                                            .randomInteger(10000, 99999);
                                        safeSetState(() {});
                                        _model.lastcode =
                                            await queryLastCodeRecordOnce(
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);

                                        var recepcionesRecordReference =
                                            RecepcionesRecord.collection.doc();
                                        await recepcionesRecordReference.set({
                                          ...createRecepcionesRecordData(
                                            numeroorden: _model.randomid,
                                            tipoPersona:
                                                _model.tipopersonaValue,
                                            nombreCliente:
                                                _model.readUser?.displayName,
                                            telefono:
                                                '${_model.codigoPaisValue}${_model.tipopersonaValue == FFAppConstants.TipoPersonaNatural ? _model.telefonoNaturalTextController.text : _model.telefonoJuridicoTextController.text}',
                                            modelo: _model
                                                .modeloTextController.text,
                                            kmIngreso: _model
                                                .kmIngresoTextController.text,
                                            tecnicoServicio:
                                                _model.dropDownTecnicoValue,
                                            tipoServicio: _model
                                                .dropDownTipoServicioValue,
                                            motivoIngreso: _model
                                                .motivoTextController.text,
                                            rUCempresa: _model
                                                .textFieldRucTextController
                                                .text,
                                            razonSocial: _model
                                                .correoJuriidcoTextController
                                                .text,
                                            status: FFAppConstants.Recepcion,
                                            clienteRef: _model.userSelected,
                                            correoElectronico:
                                                _model
                                                            .tipopersonaValue ==
                                                        'Natural'
                                                    ? _model
                                                        .correonaturalTextController
                                                        .text
                                                    : _model
                                                        .correoJuriidcoTextController
                                                        .text,
                                            codeCT: valueOrDefault<String>(
                                              functions.codigomoreone(
                                                  _model.lastcode!.lastCode),
                                              'CT001-0000000',
                                            ),
                                            placa: _model.readVehicle?.placa,
                                            marca: _model.readVehicle?.marca,
                                            dni: _model
                                                .dniNaturalTextController.text,
                                            numeroVIN:
                                                _model.readVehicle?.vINSerie,
                                            anoFabricacion: _model
                                                .readVehicle?.anioDeFabricion,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'fotos': _model.imagenesauto,
                                              'fecha_creacion':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        _model.id2 = RecepcionesRecord
                                            .getDocumentFromData({
                                          ...createRecepcionesRecordData(
                                            numeroorden: _model.randomid,
                                            tipoPersona:
                                                _model.tipopersonaValue,
                                            nombreCliente:
                                                _model.readUser?.displayName,
                                            telefono:
                                                '${_model.codigoPaisValue}${_model.tipopersonaValue == FFAppConstants.TipoPersonaNatural ? _model.telefonoNaturalTextController.text : _model.telefonoJuridicoTextController.text}',
                                            modelo: _model
                                                .modeloTextController.text,
                                            kmIngreso: _model
                                                .kmIngresoTextController.text,
                                            tecnicoServicio:
                                                _model.dropDownTecnicoValue,
                                            tipoServicio: _model
                                                .dropDownTipoServicioValue,
                                            motivoIngreso: _model
                                                .motivoTextController.text,
                                            rUCempresa: _model
                                                .textFieldRucTextController
                                                .text,
                                            razonSocial: _model
                                                .correoJuriidcoTextController
                                                .text,
                                            status: FFAppConstants.Recepcion,
                                            clienteRef: _model.userSelected,
                                            correoElectronico:
                                                _model
                                                            .tipopersonaValue ==
                                                        'Natural'
                                                    ? _model
                                                        .correonaturalTextController
                                                        .text
                                                    : _model
                                                        .correoJuriidcoTextController
                                                        .text,
                                            codeCT: valueOrDefault<String>(
                                              functions.codigomoreone(
                                                  _model.lastcode!.lastCode),
                                              'CT001-0000000',
                                            ),
                                            placa: _model.readVehicle?.placa,
                                            marca: _model.readVehicle?.marca,
                                            dni: _model
                                                .dniNaturalTextController.text,
                                            numeroVIN:
                                                _model.readVehicle?.vINSerie,
                                            anoFabricacion: _model
                                                .readVehicle?.anioDeFabricion,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'fotos': _model.imagenesauto,
                                              'fecha_creacion': DateTime.now(),
                                            },
                                          ),
                                        }, recepcionesRecordReference);

                                        await _model.lastcode!.reference
                                            .update(createLastCodeRecordData(
                                          lastCode: valueOrDefault<String>(
                                            functions.codigomoreone(
                                                _model.lastcode!.lastCode),
                                            'CT001-0000000',
                                          ),
                                        ));

                                        context.pushNamed(
                                          FRecepcionGuardadaWidget.routeName,
                                          queryParameters: {
                                            'id': serializeParam(
                                              _model.randomid,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Continuar',
                                    options: FFButtonOptions(
                                      width: 3340.0,
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          _theme.primary,
                                      textStyle: _theme
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
                        ],
                      ),
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
