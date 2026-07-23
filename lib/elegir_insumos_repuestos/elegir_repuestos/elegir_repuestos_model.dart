import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'elegir_repuestos_widget.dart' show ElegirRepuestosWidget;
import 'package:flutter/material.dart';

class ElegirRepuestosModel extends FlutterFlowModel<ElegirRepuestosWidget> {
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
  List<ArticlesRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
