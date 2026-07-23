import '/flutter_flow/flutter_flow_util.dart';
import 'model_choose_widget.dart' show ModelChooseWidget;
import 'package:flutter/material.dart';

class ModelChooseModel extends FlutterFlowModel<ModelChooseWidget> {
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
