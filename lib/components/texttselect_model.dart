import '/components/textcomponent_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'texttselect_widget.dart' show TexttselectWidget;
import 'package:flutter/material.dart';

class TexttselectModel extends FlutterFlowModel<TexttselectWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Textcomponent component.
  late TextcomponentModel textcomponentModel;

  @override
  void initState(BuildContext context) {
    textcomponentModel = createModel(context, () => TextcomponentModel());
  }

  @override
  void dispose() {
    textcomponentModel.dispose();
  }
}
