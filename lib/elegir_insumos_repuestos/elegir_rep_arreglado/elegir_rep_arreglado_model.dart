import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'elegir_rep_arreglado_widget.dart' show ElegirRepArregladoWidget;
import 'package:flutter/material.dart';

class ElegirRepArregladoModel
    extends FlutterFlowModel<ElegirRepArregladoWidget> {
  ///  Local state fields for this component.

  List<RepuestosStruct> dtyperep = [];
  void addToDtyperep(RepuestosStruct item) => dtyperep.add(item);
  void removeFromDtyperep(RepuestosStruct item) => dtyperep.remove(item);
  void removeAtIndexFromDtyperep(int index) => dtyperep.removeAt(index);
  void insertAtIndexInDtyperep(int index, RepuestosStruct item) =>
      dtyperep.insert(index, item);
  void updateDtyperepAtIndex(int index, Function(RepuestosStruct) updateFn) =>
      dtyperep[index] = updateFn(dtyperep[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  Completer<List<ArticlesRecord>>? algoliaRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
