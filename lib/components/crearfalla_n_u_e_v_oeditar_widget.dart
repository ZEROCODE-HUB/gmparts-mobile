import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/editar_repuestos_nuevo_widget.dart';
import '/elegir_insumos_repuestos/elegir_insumos_copy/elegir_insumos_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'crearfalla_n_u_e_v_oeditar_model.dart';
export 'crearfalla_n_u_e_v_oeditar_model.dart';

class CrearfallaNUEVOeditarWidget extends StatefulWidget {
  const CrearfallaNUEVOeditarWidget({
    super.key,
    required this.diagnostico,
  });

  final DiagnosticosRecord? diagnostico;

  @override
  State<CrearfallaNUEVOeditarWidget> createState() =>
      _CrearfallaNUEVOeditarWidgetState();
}

class _CrearfallaNUEVOeditarWidgetState
    extends State<CrearfallaNUEVOeditarWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late CrearfallaNUEVOeditarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrearfallaNUEVOeditarModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.repuestos =
          widget.diagnostico!.repuestos.toList().cast<RepuestosStruct>();
      safeSetState(() {});
    });

    _model.nombreFallaFocusNode ??= FocusNode();

    _model.tiempoEstimadoFocusNode ??= FocusNode();

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
        child: StreamBuilder<DiagnosticosRecord>(
          stream:
              DiagnosticosRecord.getDocument(widget.diagnostico!.reference),
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

            final containerDiagnosticosRecord = snapshot.data!;

            return Container(
              constraints: BoxConstraints(
                maxWidth: 540.0,
              ),
              decoration: BoxDecoration(
                color: _theme.accent2,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 25.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Editar Falla ',
                            style: _theme
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
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: _theme.primaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Nombre de falla',
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
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: TextFormField(
                                    controller:
                                        _model.nombreFallaTextController ??=
                                            TextEditingController(
                                      text: containerDiagnosticosRecord
                                          .nombreFalla,
                                    ),
                                    focusNode: _model.nombreFallaFocusNode,
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
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
                                      hintText: 'Escribe aquí',
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
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _theme
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _theme
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: _theme
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: _theme
                                          .primaryBackground,
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
                                    validator: _model
                                        .nombreFallaTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Servicio o solución',
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
                                  ),
                                  StreamBuilder<List<ServiceRecord>>(
                                    stream: queryServiceRecord(),
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
                                      List<ServiceRecord>
                                          ddTipodeServicioServiceRecordList =
                                          snapshot.data!;

                                      return FlutterFlowDropDown<String>(
                                        controller: _model
                                                .ddTipodeServicioValueController ??=
                                            FormFieldController<String>(
                                          _model.ddTipodeServicioValue ??=
                                              containerDiagnosticosRecord
                                                  .solucion,
                                        ),
                                        options:
                                            ddTipodeServicioServiceRecordList
                                                .map((e) => e.descripcion)
                                                .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.ddTipodeServicioValue = val),
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
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
                                              color:
                                                  _theme
                                                      .primaryText,
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
                                        hintText: 'Selecciona',
                                        searchHintText: 'Buscar departamento',
                                        icon: Icon(
                                          Icons.arrow_circle_down,
                                          color: _theme
                                              .primary,
                                          size: 24.0,
                                        ),
                                        fillColor: _theme
                                            .primaryBackground,
                                        elevation: 0.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 8.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        hidesUnderline: true,
                                        isOverButton: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tiempo estimado (días)',
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
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: TextFormField(
                                        controller: _model
                                                .tiempoEstimadoTextController ??=
                                            TextEditingController(
                                          text: containerDiagnosticosRecord
                                              .tiempoEstimado,
                                        ),
                                        focusNode:
                                            _model.tiempoEstimadoFocusNode,
                                        autofocus: false,
                                        obscureText: false,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
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
                                                    _theme
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          hintText: 'Escribe aquí',
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
                                                    _theme
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  _theme
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  _theme
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  _theme
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              _theme
                                                  .primaryBackground,
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
                                        validator: _model
                                            .tiempoEstimadoTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _theme
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Repuestos',
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
                                  ),
                                  Builder(
                                    builder: (context) => Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: InkWell(
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
                                                child: ElegirInsumosCopyWidget(
                                                  tipo: FFAppConstants
                                                      .tipoRepuesto,
                                                  actionguardarins:
                                                      (repuesto) async {
                                                    _model.addToRepuestos(
                                                        repuesto);
                                                    safeSetState(() {});
                                                    Navigator.pop(context);

                                                    FFAppState().update(() {});
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: _theme
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Añadir repuestos',
                                                  style: FlutterFlowTheme.of(
                                                          context)
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
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Icon(
                                                  Icons.add,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final rep = _model.repuestos
                                            .where((e) =>
                                                e.tipo ==
                                                FFAppConstants.tipoRepuesto)
                                            .toList();

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: rep.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 12.0),
                                          itemBuilder: (context, repIndex) {
                                            final repItem = rep[repIndex];
                                            return Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    _theme
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Flexible(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    repItem
                                                                        .nombre,
                                                                    'repuesto',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: _theme
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: _theme
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: _theme
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: _theme
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'Cant: ${repItem.cantidad.toString()}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: _theme
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: _theme
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: _theme
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: _theme
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'Precio: ${valueOrDefault<String>(
                                                                    formatNumber(
                                                                      repItem
                                                                          .precio,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                      currency:
                                                                          'S/',
                                                                    ),
                                                                    'S/0',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: _theme
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: _theme
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: _theme
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: _theme
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  'Total: ${valueOrDefault<String>(
                                                                    formatNumber(
                                                                      repItem
                                                                          .total,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                      currency:
                                                                          'S/',
                                                                    ),
                                                                    'S/0',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .montserrat(
                                                                          fontWeight: _theme
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: _theme
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: _theme
                                                                            .bodyMedium
                                                                            .fontWeight,
                                                                        fontStyle: _theme
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) =>
                                                        Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (dialogContext) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment: AlignmentDirectional(
                                                                        0.0,
                                                                        0.0)
                                                                    .resolve(
                                                                        Directionality.of(
                                                                            context)),
                                                                child:
                                                                    EditarRepuestosNuevoWidget(
                                                                  repuesto:
                                                                      repItem,
                                                                  actionguardar:
                                                                      (cantidad,
                                                                          precio) async {
                                                                    _model
                                                                        .updateRepuestosAtIndex(
                                                                      repIndex,
                                                                      (e) => e
                                                                        ..precio =
                                                                            precio
                                                                        ..cantidad =
                                                                            cantidad
                                                                        ..total =
                                                                            valueOrDefault<double>(
                                                                          precio *
                                                                              cantidad,
                                                                          0.0,
                                                                        ),
                                                                    );
                                                                    safeSetState(
                                                                        () {});
                                                                    Navigator.pop(
                                                                        context);

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                  },
                                                                  actioneliminar:
                                                                      () async {
                                                                    _model.removeAtIndexFromRepuestos(
                                                                        repIndex);
                                                                    safeSetState(
                                                                        () {});
                                                                    Navigator.pop(
                                                                        context);

                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                  },
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Icon(
                                                          Icons.edit,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 16.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
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
                                              m.storagePath, context))) {
                                    safeSetState(() =>
                                        _model.isDataUploading_firebaseupdate9 =
                                            true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];

                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                                blurHash: m.blurHash,
                                                originalFilename:
                                                    m.originalFilename,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isDataUploading_firebaseupdate9 =
                                          false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      safeSetState(() {
                                        _model.uploadedLocalFile_firebaseupdate9 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl_firebaseupdate9 =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      safeSetState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload data');
                                      return;
                                    }
                                  }

                                  if ((_model.uploadedFileUrl_firebaseupdate9 !=
                                              '') &&
                                      (containerDiagnosticosRecord.fotos
                                              .contains(_model
                                                  .uploadedFileUrl_firebaseupdate9) ==
                                          false)) {
                                    await containerDiagnosticosRecord.reference
                                        .update({
                                      ...mapToFirestore(
                                        {
                                          'Fotos': FieldValue.arrayUnion([
                                            _model
                                                .uploadedFileUrl_firebaseupdate9
                                          ]),
                                        },
                                      ),
                                    });
                                  }
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color:
                                          _theme.primary,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Tomar foto de la falla',
                                          style: _theme
                                              .headlineSmall
                                              .override(
                                                font: GoogleFonts.montserrat(
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
                                                    _theme
                                                        .headlineSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    _theme
                                                        .headlineSmall
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 10.0, 0.0),
                                            child: Icon(
                                              Icons.camera_alt,
                                              color:
                                                  _theme
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
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 25.0, 0.0, 0.0),
                                          child: Text(
                                            'Fotos',
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
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final fotoss =
                                              containerDiagnosticosRecord.fotos
                                                  .toList();

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List
                                                      .generate(fotoss.length,
                                                          (fotossIndex) {
                                                final fotossItem =
                                                    fotoss[fotossIndex];
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  1.0, -1.0),
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                fotossItem,
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await containerDiagnosticosRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'Fotos':
                                                                              FieldValue.arrayRemove([
                                                                            fotossItem
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: _theme
                                                                            .primary,
                                                                        size:
                                                                            12.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 15.0)),
                                                  ),
                                                );
                                              })
                                                  .divide(SizedBox(width: 12.0))
                                                  .addToEnd(
                                                      SizedBox(width: 12.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  if (_model.repuestos.length > 0) {
                                    _model.servicioSlecetr =
                                        await queryServiceRecordOnce(
                                      queryBuilder: (serviceRecord) =>
                                          serviceRecord.where(
                                        'Descripcion',
                                        isEqualTo: _model.ddTipodeServicioValue,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);

                                    await widget.diagnostico!.reference
                                        .update({
                                      ...createDiagnosticosRecordData(
                                        nombreFalla: _model
                                            .nombreFallaTextController.text,
                                        solucion: _model.ddTipodeServicioValue,
                                        tiempoEstimado: _model
                                            .tiempoEstimadoTextController.text,
                                        subtotal: valueOrDefault<double>(
                                          valueOrDefault<double>(
                                                functions.sumalist(_model
                                                    .repuestos
                                                    .map((e) => e.total)
                                                    .toList()),
                                                0.0,
                                              ) +
                                              valueOrDefault<double>(
                                                double.parse(_model
                                                        .tiempoEstimadoTextController
                                                        .text) *
                                                    valueOrDefault<double>(
                                                      _model.servicioSlecetr
                                                          ?.precio,
                                                      0.0,
                                                    ),
                                                0.0,
                                              ),
                                          0.0,
                                        ),
                                        igv: valueOrDefault<double>(
                                          (valueOrDefault<double>(
                                                valueOrDefault<double>(
                                                      functions.sumalist(_model
                                                          .repuestos
                                                          .map((e) => e.total)
                                                          .toList()),
                                                      0.0,
                                                    ) +
                                                    valueOrDefault<double>(
                                                      double.parse(_model
                                                              .tiempoEstimadoTextController
                                                              .text) *
                                                          valueOrDefault<
                                                              double>(
                                                            _model
                                                                .servicioSlecetr
                                                                ?.precio,
                                                            0.0,
                                                          ),
                                                      0.0,
                                                    ),
                                                0.0,
                                              )) *
                                              0.18,
                                          0.0,
                                        ),
                                        total: valueOrDefault<double>(
                                          (valueOrDefault<double>(
                                                valueOrDefault<double>(
                                                      functions.sumalist(_model
                                                          .repuestos
                                                          .map((e) => e.total)
                                                          .toList()),
                                                      0.0,
                                                    ) +
                                                    valueOrDefault<double>(
                                                      double.parse(_model
                                                              .tiempoEstimadoTextController
                                                              .text) *
                                                          valueOrDefault<
                                                              double>(
                                                            _model
                                                                .servicioSlecetr
                                                                ?.precio,
                                                            0.0,
                                                          ),
                                                      0.0,
                                                    ),
                                                0.0,
                                              )) *
                                              1.18,
                                          0.0,
                                        ),
                                        manoDeObra: valueOrDefault<double>(
                                          double.parse(_model
                                                  .tiempoEstimadoTextController
                                                  .text) *
                                              valueOrDefault<double>(
                                                _model.servicioSlecetr?.precio,
                                                0.0,
                                              ),
                                          0.0,
                                        ),
                                        precioservicio:
                                            _model.servicioSlecetr?.precio,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'Repuestos':
                                              getRepuestosListFirestoreData(
                                            _model.repuestos,
                                          ),
                                        },
                                      ),
                                    });
                                    Navigator.pop(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '',
                                          style: TextStyle(
                                            color: _theme
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            _theme
                                                .primary,
                                      ),
                                    );
                                  }

                                  safeSetState(() {});
                                },
                                text: 'Guarda falla',
                                icon: Icon(
                                  Icons.save,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _theme.primary,
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
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: _theme
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 16.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await containerDiagnosticosRecord.reference
                                      .delete();
                                  Navigator.pop(context);
                                },
                                text: 'Eliminar falla',
                                icon: Icon(
                                  Icons.delete,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconAlignment: IconAlignment.end,
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: _theme.primary,
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
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: _theme
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: _theme
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                  elevation: 0.0,
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
            );
          },
        ),
      ),
    );
  }
}
