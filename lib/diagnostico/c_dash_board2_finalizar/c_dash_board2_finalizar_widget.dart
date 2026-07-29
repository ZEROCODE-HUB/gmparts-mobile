import '/auth/firebase_auth/auth_util.dart';
import '/components/user_avatar_widget.dart';
import '/backend/backend.dart';
import '/components/finalizarfalla_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'c_dash_board2_finalizar_model.dart';
export 'c_dash_board2_finalizar_model.dart';

class CDashBoard2FinalizarWidget extends StatefulWidget {
  const CDashBoard2FinalizarWidget({
    super.key,
    required this.recepcion,
  });

  final RecepcionesRecord? recepcion;

  static String routeName = 'c-DashBoard2Finalizar';
  static String routePath = '/cDashBoard2Finalizar';

  @override
  State<CDashBoard2FinalizarWidget> createState() =>
      _CDashBoard2FinalizarWidgetState();
}

class _CDashBoard2FinalizarWidgetState
    extends State<CDashBoard2FinalizarWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late CDashBoard2FinalizarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CDashBoard2FinalizarModel());

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
    return StreamBuilder<List<DiagnosticosRecord>>(
      stream: queryDiagnosticosRecord(
        parent: widget.recepcion?.reference,
        queryBuilder: (diagnosticosRecord) => diagnosticosRecord
            .where(
              'Aprobacion_cliente',
              isEqualTo: true,
            )
            .orderBy('fecha'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: _theme.primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _theme.primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DiagnosticosRecord> cDashBoard2FinalizarDiagnosticosRecordList =
            snapshot.data!;

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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
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
                                      0.0, 10.0, 38.0, 0.0),
                                  child: FlutterFlowIconButton(
                                    borderColor:
                                        _theme.primary,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 32.0,
                                    icon: Icon(
                                      Icons.chevron_left_rounded,
                                      color:
                                          _theme.primary,
                                      size: 16.0,
                                    ),
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    'Detalle',
                                    style: _theme
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                _theme
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: _theme
                                              .primaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              _theme
                                                  .titleLarge
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
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmall
                                                              .fontStyle,
                                                    ),
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                0.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              'Ver perfil',
                                              style: _theme
                                                  .labelSmall
                                                  .override(
                                                    font: GoogleFonts.montserrat(
                                                      fontSize: 10.0,
                                                    ),
                                                    fontSize: 10.0,
                                                    color: _theme.primary,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          BDetalleestaticoWidget.routeName,
                                          queryParameters: {
                                            'datos': serializeParam(
                                              widget.recepcion,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'datos': widget.recepcion,
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: _theme
                                              .accent2,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 20.0, 20.0, 20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Detalles de recepción',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .montserrat(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLarge
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .arrow_circle_right_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                ],
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Builder(
                                  builder: (context) {
                                    final fallas =
                                        cDashBoard2FinalizarDiagnosticosRecordList
                                            .map((e) => e)
                                            .toList();

                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(fallas.length,
                                          (fallasIndex) {
                                        final fallasItem = fallas[fallasIndex];
                                        return wrapWithModel(
                                          model: _model.finalizarfallaModels
                                              .getModel(
                                            fallasIndex.toString(),
                                            fallasIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: FinalizarfallaWidget(
                                            key: Key(
                                              'Keydys_${fallasIndex.toString()}',
                                            ),
                                            indexx: fallasIndex,
                                            fallaref: fallasItem.reference,
                                          ),
                                        );
                                      }).divide(SizedBox(height: 20.0)),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (cDashBoard2FinalizarDiagnosticosRecordList
                                  .lastOrNull?.finalizado ??
                              true)
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 20.0, 20.0, 50.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.recepcion!.reference
                                        .update(createRecepcionesRecordData(
                                      subtotal: valueOrDefault<double>(
                                        functions.sumalist(
                                            cDashBoard2FinalizarDiagnosticosRecordList
                                                .map((e) => e.subtotal)
                                                .toList()),
                                        0.0,
                                      ),
                                      igv: valueOrDefault<double>(
                                        functions.sumalist(
                                            cDashBoard2FinalizarDiagnosticosRecordList
                                                .map((e) => e.igv)
                                                .toList()),
                                        0.0,
                                      ),
                                      total: valueOrDefault<double>(
                                        functions.sumalist(
                                            cDashBoard2FinalizarDiagnosticosRecordList
                                                .map((e) => e.total)
                                                .toList()),
                                        0.0,
                                      ),
                                    ));

                                    context.pushNamed(
                                      DControldecalidadenviarclientePreWidget
                                          .routeName,
                                      queryParameters: {
                                        'id': serializeParam(
                                          valueOrDefault<int>(
                                            widget.recepcion?.numeroorden,
                                            0,
                                          ),
                                          ParamType.int,
                                        ),
                                        'idrecep': serializeParam(
                                          widget.recepcion?.reference,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: 'Finalizar todo',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
