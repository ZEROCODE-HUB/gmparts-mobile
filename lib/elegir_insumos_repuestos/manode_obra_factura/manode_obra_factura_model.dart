import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'manode_obra_factura_widget.dart' show ManodeObraFacturaWidget;
import 'package:flutter/material.dart';

class ManodeObraFacturaModel extends FlutterFlowModel<ManodeObraFacturaWidget> {
  ///  Local state fields for this component.

  List<RepuestosStruct> dtyperepuestos = [];
  void addToDtyperepuestos(RepuestosStruct item) => dtyperepuestos.add(item);
  void removeFromDtyperepuestos(RepuestosStruct item) =>
      dtyperepuestos.remove(item);
  void removeAtIndexFromDtyperepuestos(int index) =>
      dtyperepuestos.removeAt(index);
  void insertAtIndexInDtyperepuestos(int index, RepuestosStruct item) =>
      dtyperepuestos.insert(index, item);
  void updateDtyperepuestosAtIndex(
          int index, Function(RepuestosStruct) updateFn) =>
      dtyperepuestos[index] = updateFn(dtyperepuestos[index]);

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
