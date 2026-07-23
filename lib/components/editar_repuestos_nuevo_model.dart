import '/flutter_flow/flutter_flow_util.dart';
import 'editar_repuestos_nuevo_widget.dart' show EditarRepuestosNuevoWidget;
import 'package:flutter/material.dart';

class EditarRepuestosNuevoModel
    extends FlutterFlowModel<EditarRepuestosNuevoWidget> {
  ///  Local state fields for this component.

  double? precio;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
