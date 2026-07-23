import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'elegir_insumos_copy_widget.dart' show ElegirInsumosCopyWidget;
import 'package:flutter/material.dart';

class ElegirInsumosCopyModel extends FlutterFlowModel<ElegirInsumosCopyWidget> {
  ///  Local state fields for this component.

  List<InsumosStruct> dtypeinsumos = [];
  void addToDtypeinsumos(InsumosStruct item) => dtypeinsumos.add(item);
  void removeFromDtypeinsumos(InsumosStruct item) => dtypeinsumos.remove(item);
  void removeAtIndexFromDtypeinsumos(int index) => dtypeinsumos.removeAt(index);
  void insertAtIndexInDtypeinsumos(int index, InsumosStruct item) =>
      dtypeinsumos.insert(index, item);
  void updateDtypeinsumosAtIndex(int index, Function(InsumosStruct) updateFn) =>
      dtypeinsumos[index] = updateFn(dtypeinsumos[index]);

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
