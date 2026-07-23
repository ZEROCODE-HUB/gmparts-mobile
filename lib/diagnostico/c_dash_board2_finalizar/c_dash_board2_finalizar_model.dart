import '/components/finalizarfalla_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'c_dash_board2_finalizar_widget.dart' show CDashBoard2FinalizarWidget;
import 'package:flutter/material.dart';

class CDashBoard2FinalizarModel
    extends FlutterFlowModel<CDashBoard2FinalizarWidget> {
  ///  Local state fields for this page.

  bool expandir = false;

  List<String> imagenes = [];
  void addToImagenes(String item) => imagenes.add(item);
  void removeFromImagenes(String item) => imagenes.remove(item);
  void removeAtIndexFromImagenes(int index) => imagenes.removeAt(index);
  void insertAtIndexInImagenes(int index, String item) =>
      imagenes.insert(index, item);
  void updateImagenesAtIndex(int index, Function(String) updateFn) =>
      imagenes[index] = updateFn(imagenes[index]);

  ///  State fields for stateful widgets in this page.

  // Models for Finalizarfalla dynamic component.
  late FlutterFlowDynamicModels<FinalizarfallaModel> finalizarfallaModels;

  @override
  void initState(BuildContext context) {
    finalizarfallaModels =
        FlutterFlowDynamicModels(() => FinalizarfallaModel());
  }

  @override
  void dispose() {
    finalizarfallaModels.dispose();
  }
}
