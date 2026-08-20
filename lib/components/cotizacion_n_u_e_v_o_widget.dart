import '/backend/backend.dart';
import '/components/crearfalla_n_u_e_v_oeditar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cotizacion_n_u_e_v_o_model.dart';
export 'cotizacion_n_u_e_v_o_model.dart';

class CotizacionNUEVOWidget extends StatefulWidget {
  const CotizacionNUEVOWidget({
    super.key,
    required this.fallaref,
    required this.indexx,
  });

  final DocumentReference? fallaref;
  final int? indexx;

  @override
  State<CotizacionNUEVOWidget> createState() => _CotizacionNUEVOWidgetState();
}

class _CotizacionNUEVOWidgetState extends State<CotizacionNUEVOWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late CotizacionNUEVOModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CotizacionNUEVOModel());

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: StreamBuilder<DiagnosticosRecord>(
        stream: DiagnosticosRecord.getDocument(widget.fallaref!),
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
            decoration: BoxDecoration(
              color: _theme.secondaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Falla ${((widget.indexx!) + 1).toString()}',
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
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CrearfallaNUEVOeditarWidget(
                                        diagnostico:
                                            containerDiagnosticosRecord,
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.edit,
                                color: _theme.primaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nombre de falla',
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
                                      color: _theme
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  containerDiagnosticosRecord.nombreFalla,
                                  style: _theme
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              _theme
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Solución',
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
                                      color: _theme
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: _theme
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: _theme
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  containerDiagnosticosRecord.solucion,
                                  style: _theme
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              _theme
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final imagenesfallas =
                                                containerDiagnosticosRecord
                                                    .fotos
                                                    .map((e) => e)
                                                    .toList();

                                            return Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  imagenesfallas.length,
                                                  (imagenesfallasIndex) {
                                                final imagenesfallasItem =
                                                    imagenesfallas[
                                                        imagenesfallasIndex];
                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            imagenesfallasItem,
                                                            'https://static.vecteezy.com/system/resources/previews/005/723/771/non_2x/photo-album-icon-image-symbol-or-no-image-flat-design-on-a-white-background-vector.jpg',
                                                          ),
                                                          width: 100.0,
                                                          height: 100.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }).divide(SizedBox(width: 15.0)),
                                            );
                                          },
                                        ),
                                      ),
                                    ]
                                        .divide(SizedBox(width: 12.0))
                                        .addToEnd(SizedBox(width: 12.0)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final rep =
                            containerDiagnosticosRecord.repuestos.toList();

                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: rep.length,
                          separatorBuilder: (_, __) => SizedBox(height: 12.0),
                          itemBuilder: (context, repIndex) {
                            final repItem = rep[repIndex];
                            return Container(
                              decoration: BoxDecoration(
                                color: _theme
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    repItem.nombre,
                                                    'repuesto',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
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
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Precio: ${valueOrDefault<String>(
                                                    formatNumber(
                                                      repItem.precio,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: 'S/',
                                                    ),
                                                    'S/0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
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
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Total: ${valueOrDefault<String>(
                                                    formatNumber(
                                                      repItem.total,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType:
                                                          DecimalType.automatic,
                                                      currency: 'S/',
                                                    ),
                                                    'S/0',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .montserrat(
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _theme.accent2,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Mano de obra',
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      containerDiagnosticosRecord.manoDeObra,
                                      formatType: FormatType.custom,
                                      currency: 'S/',
                                      format: '',
                                      locale: '',
                                    ),
                                    'S/0',
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
                                    shadows: [
                                      Shadow(
                                        color: _theme
                                            .secondaryText,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 2.0,
                                      )
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
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
                            Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  valueOrDefault<double>(
                                        functions.sumalist(
                                            containerDiagnosticosRecord
                                                .repuestos
                                                .map((e) => e.total)
                                                .toList()),
                                        0.0,
                                      ) +
                                      containerDiagnosticosRecord.manoDeObra,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'S/',
                                ),
                                'S/0',
                              ),
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
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'IGV',
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
                            Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  (valueOrDefault<double>(
                                        valueOrDefault<double>(
                                              functions.sumalist(
                                                  containerDiagnosticosRecord
                                                      .repuestos
                                                      .map((e) =>
                                                          valueOrDefault<
                                                              double>(
                                                            e.total,
                                                            0.0,
                                                          ))
                                                      .toList()),
                                              0.0,
                                            ) +
                                            containerDiagnosticosRecord
                                                .manoDeObra,
                                        0.0,
                                      )) *
                                      0.18,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'S/',
                                ),
                                'S/0',
                              ),
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
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
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
                            Text(
                              valueOrDefault<String>(
                                formatNumber(
                                  (valueOrDefault<double>(
                                        valueOrDefault<double>(
                                              functions.sumalist(
                                                  containerDiagnosticosRecord
                                                      .repuestos
                                                      .map((e) => e.total)
                                                      .toList()),
                                              0.0,
                                            ) +
                                            containerDiagnosticosRecord
                                                .manoDeObra,
                                        0.0,
                                      )) *
                                      1.18,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                  currency: 'S/',
                                ),
                                'S/0',
                              ),
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: _theme.accent2,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
