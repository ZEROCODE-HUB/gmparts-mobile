import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'finalizarfalla_model.dart';
export 'finalizarfalla_model.dart';

class FinalizarfallaWidget extends StatefulWidget {
  const FinalizarfallaWidget({
    super.key,
    required this.indexx,
    required this.fallaref,
    this.status,
  });

  final int? indexx;
  final DocumentReference? fallaref;
  final String? status;
  final int? indexx;

  @override
  State<FinalizarfallaWidget> createState() => _FinalizarfallaWidgetState();
}

class _FinalizarfallaWidgetState extends State<FinalizarfallaWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late FinalizarfallaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FinalizarfallaModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
    return StreamBuilder<DiagnosticosRecord>(
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
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 25.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nueva Falla ${((widget.indexx!) + 1).toString()}',
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
                                valueOrDefault<String>(
                                  containerDiagnosticosRecord.nombreFalla,
                                  'Falla de carburador',
                                ),
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
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
                                valueOrDefault<String>(
                                  containerDiagnosticosRecord.solucion,
                                  'Reemplazo de pieza',
                                ),
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
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
                            if (containerDiagnosticosRecord.fotos.isNotEmpty)
                              ...[
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Fotos de la falla',
                                    style: _theme.bodyMedium.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: _theme.bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: containerDiagnosticosRecord.fotos
                                        .map(
                                          (foto) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.network(
                                                foto,
                                                width: 90.0,
                                                height: 90.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            if (containerDiagnosticosRecord
                                .repuestos.isNotEmpty)
                              ...[
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Repuestos',
                                    style: _theme.bodyMedium.override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: _theme.bodyMedium.fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ...containerDiagnosticosRecord.repuestos
                                    .map(
                                      (rep) => Padding(
                                        padding: EdgeInsetsDirectional
                                            .fromSTEB(0.0, 6.0, 0.0, 0.0),
                                        child: Text(
                                          widget.status == 'Finalizado'
                                              ? '${rep.nombre}  ·  Cant: ${rep.cantidad}  ·  S/ ${rep.precio.toStringAsFixed(2)}'
                                              : '${rep.nombre}  ·  Cant: ${rep.cantidad}',
                                          style: _theme.bodyMedium,
                                        ),
                                      ),
                                    ),
                              ],
                            if (containerDiagnosticosRecord.manoDeObra > 0)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  widget.status == 'Finalizado'
                                      ? '${containerDiagnosticosRecord.nombreFalla}  ·  S/ ${containerDiagnosticosRecord.manoDeObra.toStringAsFixed(2)}'
                                      : containerDiagnosticosRecord.nombreFalla,
                                  style: _theme.bodyMedium.override(
                                    font: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: _theme.bodyMedium.fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Tiempo',
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _theme.accent2,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController1,
                                    focusNode: _model.textFieldFocusNode1,
                                    autofocus: true,
                                    textCapitalization: TextCapitalization.none,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Tiempo',
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
                                            color: _theme
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
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
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
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    validator: _model.textController1Validator
                                        .asValidator(context),
                                    inputFormatters: [
                                      if (!isAndroid && !isiOS)
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          return TextEditingValue(
                                            selection: newValue.selection,
                                            text: newValue.text
                                                .toCapitalization(
                                                    TextCapitalization.none),
                                          );
                                        }),
                                    ],
                                  ),
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Comentarios u observaciones',
                                style: _theme
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.normal,
                                        fontStyle: _theme
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
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _theme.accent2,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode2,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Escribe aquí',
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
                                            color: _theme
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
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
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
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
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
                                          final imagenesfallasf = _model
                                              .imagenes
                                              .map((e) => e)
                                              .toList();

                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: List.generate(
                                                imagenesfallasf.length,
                                                (imagenesfallasfIndex) {
                                              final imagenesfallasfItem =
                                                  imagenesfallasf[
                                                      imagenesfallasfIndex];
                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          imagenesfallasfItem,
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
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
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
                                                      .isDataUploading_imgautom565 =
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
                                                _model.isDataUploading_imgautom565 =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_imgautom565 =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl_imgautom565 =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            _model.addToImagenes(_model
                                                .uploadedFileUrl_imgautom565);
                                            safeSetState(() {});
                                          },
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    _theme
                                                        .primary,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.camera_alt_rounded,
                                              color:
                                                  _theme
                                                      .primary,
                                              size: 28.0,
                                            ),
                                          ),
                                        ),
                                      ],
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
                if (containerDiagnosticosRecord.finalizado != true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await containerDiagnosticosRecord.reference.update({
                          ...createDiagnosticosRecordData(
                            finalizado: true,
                            tiempoFinalizado:
                                double.tryParse(_model.textController1.text),
                            comentariosFinalizado: _model.textController2.text,
                          ),
                          ...mapToFirestore(
                            {
                              'imagenes_finalizado': _model.imagenes,
                            },
                          ),
                        });
                      },
                      text:
                          'Finalizar Falla ${((widget.indexx!) + 1).toString()}',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: _theme.primary,
                        textStyle:
                            _theme.titleSmall.override(
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
                                  fontStyle: _theme
                                      .titleSmall
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
                if (containerDiagnosticosRecord.finalizado == true)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'Finalizado',
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: _theme.accent2,
                        textStyle:
                            _theme.titleSmall.override(
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
                                  fontStyle: _theme
                                      .titleSmall
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
        );
      },
    );
  }
}
