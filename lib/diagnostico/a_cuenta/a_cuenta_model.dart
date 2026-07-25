import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_cuenta_widget.dart' show ACuentaWidget;
import 'package:flutter/material.dart';

class ACuentaModel extends FlutterFlowModel<ACuentaWidget> {
  late TextEditingController nameController;
  late FocusNode nameFocusNode;

  @override
  void initState(BuildContext context) {
    nameController = TextEditingController(text: currentUserDisplayName);
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
  }
}
