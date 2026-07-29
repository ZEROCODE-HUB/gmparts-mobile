import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'row_articles_model.dart';
export 'row_articles_model.dart';

class RowArticlesWidget extends StatefulWidget {
  const RowArticlesWidget({
    super.key,
    this.codigo,
    this.descripcion,
    this.cantidad,
    this.precioventa,
    this.preciocompra,
    required this.item,
    required this.index,
    required this.tipoOperacion,
    required this.isEdit,
  });

  final String? codigo;
  final String? descripcion;
  final int? cantidad;
  final double? precioventa;
  final double? preciocompra;
  final FacturasArticulosStruct? item;
  final int? index;
  final String? tipoOperacion;
  final bool? isEdit;

  @override
  State<RowArticlesWidget> createState() => _RowArticlesWidgetState();
}

class _RowArticlesWidgetState extends State<RowArticlesWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late RowArticlesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RowArticlesModel());

    _model.cantidadInputTextController ??=
        TextEditingController(text: widget.cantidad?.toString());
    _model.cantidadInputFocusNode ??= FocusNode();
    _model.cantidadInputFocusNode!.addListener(
      () async {
        if (_model.cantidadInputTextController.text != '') {
          FFAppState().updateCrearFacturasAtIndex(
            widget.index!,
            (e) => e
              ..total = int.parse(_model.cantidadInputTextController.text) *
                  (widget.precioventa!)
              ..cantidad =
                  int.tryParse(_model.cantidadInputTextController.text),
          );
          FFAppState().update(() {});
        }
      },
    );
    _model.precioCompraInputTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      formatNumber(
        widget.preciocompra,
        formatType: FormatType.decimal,
        decimalType: DecimalType.periodDecimal,
      ),
      '0',
    ));
    _model.precioCompraInputFocusNode ??= FocusNode();
    _model.precioCompraInputFocusNode!.addListener(
      () async {
        if (_model.precioCompraInputTextController.text != '') {
          FFAppState().updateCrearFacturasAtIndex(
            widget.index!,
            (e) => e
              ..precioCompra =
                  double.tryParse(_model.precioCompraInputTextController.text)
              ..total = (widget.cantidad!) * (widget.precioventa!),
          );
          FFAppState().update(() {});
        }
      },
    );
    _model.utilidadInputTextController ??= TextEditingController(
        text: formatNumber(
      widget.item?.utilidad,
      formatType: FormatType.decimal,
      decimalType: DecimalType.periodDecimal,
    ));
    _model.utilidadInputFocusNode ??= FocusNode();
    _model.utilidadInputFocusNode!.addListener(
      () async {
        if (_model.utilidadInputTextController.text != '') {
          FFAppState().updateCrearFacturasAtIndex(
            widget.index!,
            (e) => e
              ..utilidad =
                  double.tryParse(_model.utilidadInputTextController.text)
              ..precioVenta = ((widget.preciocompra!) /
                  (1 -
                      (double.parse(_model.utilidadInputTextController.text) *
                          0.01))),
          );
          FFAppState().update(() {});
        }
      },
    );
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            widget.codigo!,
            style: _theme.bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight:
                        _theme.bodyMedium.fontWeight,
                    fontStyle:
                        _theme.bodyMedium.fontStyle,
                  ),
                  color: _theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      _theme.bodyMedium.fontWeight,
                  fontStyle: _theme.bodyMedium.fontStyle,
                ),
          ),
        ),
        Expanded(
          child: Text(
            widget.descripcion!,
            style: _theme.bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight:
                        _theme.bodyMedium.fontWeight,
                    fontStyle:
                        _theme.bodyMedium.fontStyle,
                  ),
                  color: _theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      _theme.bodyMedium.fontWeight,
                  fontStyle: _theme.bodyMedium.fontStyle,
                ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: 200.0,
                  child: TextFormField(
                    controller: _model.cantidadInputTextController,
                    focusNode: _model.cantidadInputFocusNode,
                    onChanged: (_) => EasyDebounce.debounce(
                      '_model.cantidadInputTextController',
                      Duration(milliseconds: 2000),
                      () async {
                        if (_model.cantidadInputTextController.text != '') {
                          FFAppState().updateCrearFacturasAtIndex(
                            widget.index!,
                            (e) => e
                              ..total = int.parse(
                                      _model.cantidadInputTextController.text) *
                                  (widget.precioventa!)
                              ..cantidad = int.tryParse(
                                  _model.cantidadInputTextController.text),
                          );
                          FFAppState().update(() {});
                        }
                      },
                    ),
                    autofocus: false,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      labelStyle:
                          _theme.labelMedium.override(
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
                      hintText: 'Ingrese cantidad',
                      hintStyle:
                          _theme.labelMedium.override(
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
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
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
                          color: _theme.error,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _theme.error,
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
                    cursorColor: _theme.primaryText,
                    validator: _model.cantidadInputTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              if ((widget.tipoOperacion == 'Venta') &&
                  (widget.isEdit == false))
                Text(
                  widget.cantidad! > widget.item!.stock
                      ? 'No tienes stock disponible'
                      : '',
                  style: _theme.bodyMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              _theme.bodyMedium.fontStyle,
                        ),
                        color: Color(0xFFF61414),
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.bodyMedium.fontWeight,
                        fontStyle:
                            _theme.bodyMedium.fontStyle,
                      ),
                ),
            ],
          ),
        ),
        Container(
          width: 180.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: _theme.secondaryBackground,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
              child: Text(
                valueOrDefault<String>(
                  formatNumber(
                    widget.precioventa,
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.periodDecimal,
                  ),
                  '0',
                ),
                style: _theme.bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            _theme.bodyMedium.fontWeight,
                        fontStyle:
                            _theme.bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          _theme.bodyMedium.fontWeight,
                      fontStyle:
                          _theme.bodyMedium.fontStyle,
                    ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _model.precioCompraInputTextController,
                focusNode: _model.precioCompraInputFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.precioCompraInputTextController',
                  Duration(milliseconds: 2000),
                  () async {
                    if (_model.precioCompraInputTextController.text != '') {
                      FFAppState().updateCrearFacturasAtIndex(
                        widget.index!,
                        (e) => e
                          ..precioCompra = double.tryParse(
                              _model.precioCompraInputTextController.text)
                          ..total =
                              (widget.cantidad!) * (widget.precioventa!),
                      );
                      FFAppState().update(() {});
                    }
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle: _theme.labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .labelMedium
                              .fontWeight,
                          fontStyle: _theme
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                  hintText: 'Ingrese cantidad',
                  hintStyle: _theme.labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .labelMedium
                              .fontWeight,
                          fontStyle: _theme
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
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
                      color: _theme.error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _theme.error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: _theme.secondaryBackground,
                ),
                style: _theme.bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            _theme.bodyMedium.fontWeight,
                        fontStyle:
                            _theme.bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          _theme.bodyMedium.fontWeight,
                      fontStyle:
                          _theme.bodyMedium.fontStyle,
                    ),
                cursorColor: _theme.primaryText,
                validator: _model.precioCompraInputTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Container(
              width: 200.0,
              child: TextFormField(
                controller: _model.utilidadInputTextController,
                focusNode: _model.utilidadInputFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.utilidadInputTextController',
                  Duration(milliseconds: 2000),
                  () async {
                    if (_model.utilidadInputTextController.text != '') {
                      FFAppState().updateCrearFacturasAtIndex(
                        widget.index!,
                        (e) => e
                          ..utilidad = double.tryParse(
                              _model.utilidadInputTextController.text)
                          ..precioVenta = ((widget.preciocompra!) /
                              (1 -
                                  (double.parse(_model
                                          .utilidadInputTextController.text) *
                                      0.01))),
                      );
                      FFAppState().update(() {});
                    }
                  },
                ),
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  labelStyle: _theme.labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .labelMedium
                              .fontWeight,
                          fontStyle: _theme
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                  hintText: 'Ingrese cantidad',
                  hintStyle: _theme.labelMedium.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .labelMedium
                              .fontWeight,
                          fontStyle: _theme
                              .labelMedium
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            _theme.labelMedium.fontWeight,
                        fontStyle:
                            _theme.labelMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
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
                      color: _theme.error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: _theme.error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: _theme.secondaryBackground,
                ),
                style: _theme.bodyMedium.override(
                      font: GoogleFonts.montserrat(
                        fontWeight:
                            _theme.bodyMedium.fontWeight,
                        fontStyle:
                            _theme.bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          _theme.bodyMedium.fontWeight,
                      fontStyle:
                          _theme.bodyMedium.fontStyle,
                    ),
                cursorColor: _theme.primaryText,
                validator: _model.utilidadInputTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            valueOrDefault<String>(
              formatNumber(
                widget.item?.total,
                formatType: FormatType.decimal,
                decimalType: DecimalType.periodDecimal,
              ),
              '0',
            ),
            style: _theme.bodyMedium.override(
                  font: GoogleFonts.montserrat(
                    fontWeight:
                        _theme.bodyMedium.fontWeight,
                    fontStyle:
                        _theme.bodyMedium.fontStyle,
                  ),
                  color: _theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      _theme.bodyMedium.fontWeight,
                  fontStyle: _theme.bodyMedium.fontStyle,
                ),
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
                FFAppState().removeFromCrearFacturas(widget.item!);
                FFAppState().update(() {});
              },
              child: Icon(
                Icons.delete,
                color: _theme.error,
                size: 20.0,
              ),
            ),
          ].divide(SizedBox(width: 8.0)),
        ),
      ].divide(SizedBox(width: 12.0)),
    );
  }
}
