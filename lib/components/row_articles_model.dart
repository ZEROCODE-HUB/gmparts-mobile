import '/flutter_flow/flutter_flow_util.dart';
import 'row_articles_widget.dart' show RowArticlesWidget;
import 'package:flutter/material.dart';

class RowArticlesModel extends FlutterFlowModel<RowArticlesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for cantidadInput widget.
  FocusNode? cantidadInputFocusNode;
  TextEditingController? cantidadInputTextController;
  String? Function(BuildContext, String?)? cantidadInputTextControllerValidator;
  // State field(s) for precioCompraInput widget.
  FocusNode? precioCompraInputFocusNode;
  TextEditingController? precioCompraInputTextController;
  String? Function(BuildContext, String?)?
      precioCompraInputTextControllerValidator;
  // State field(s) for utilidadInput widget.
  FocusNode? utilidadInputFocusNode;
  TextEditingController? utilidadInputTextController;
  String? Function(BuildContext, String?)? utilidadInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    cantidadInputFocusNode?.dispose();
    cantidadInputTextController?.dispose();

    precioCompraInputFocusNode?.dispose();
    precioCompraInputTextController?.dispose();

    utilidadInputFocusNode?.dispose();
    utilidadInputTextController?.dispose();
  }
}
