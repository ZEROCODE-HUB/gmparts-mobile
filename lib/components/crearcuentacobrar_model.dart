import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crearcuentacobrar_widget.dart' show CrearcuentacobrarWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrearcuentacobrarModel extends FlutterFlowModel<CrearcuentacobrarWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked;
  // State field(s) for usuario widget.
  String? usuarioValue;
  FormFieldController<String>? usuarioValueController;
  // State field(s) for tipodocumento widget.
  String? tipodocumentoValue;
  FormFieldController<String>? tipodocumentoValueController;
  // State field(s) for Monto widget.
  FocusNode? montoFocusNode;
  TextEditingController? montoTextController;
  String? Function(BuildContext, String?)? montoTextControllerValidator;
  // State field(s) for estado widget.
  String? estadoValue;
  FormFieldController<String>? estadoValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Boton widget.
  UsersRecord? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    montoFocusNode?.dispose();
    montoTextController?.dispose();
  }
}
