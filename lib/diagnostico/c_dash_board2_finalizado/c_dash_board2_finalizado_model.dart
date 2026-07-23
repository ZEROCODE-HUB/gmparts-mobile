import '/components/finalizadofalla_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'c_dash_board2_finalizado_widget.dart' show CDashBoard2FinalizadoWidget;
import 'package:flutter/material.dart';

class CDashBoard2FinalizadoModel
    extends FlutterFlowModel<CDashBoard2FinalizadoWidget> {
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

  // Models for Finalizadofalla dynamic component.
  late FlutterFlowDynamicModels<FinalizadofallaModel> finalizadofallaModels;

  @override
  void initState(BuildContext context) {
    finalizadofallaModels =
        FlutterFlowDynamicModels(() => FinalizadofallaModel());
  }

  @override
  void dispose() {
    finalizadofallaModels.dispose();
  }
}
