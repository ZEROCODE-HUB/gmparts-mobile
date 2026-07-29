import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'restaurar_contrasena1_widget.dart' show RestaurarContrasena1Widget;
import 'package:flutter/material.dart';

class RestaurarContrasena1Model
    extends FlutterFlowModel<RestaurarContrasena1Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
