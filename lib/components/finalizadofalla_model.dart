import '/flutter_flow/flutter_flow_util.dart';
import 'finalizadofalla_widget.dart' show FinalizadofallaWidget;
import 'package:flutter/material.dart';

class FinalizadofallaModel extends FlutterFlowModel<FinalizadofallaWidget> {
  ///  Local state fields for this component.

  List<String> imagenes = [];
  void addToImagenes(String item) => imagenes.add(item);
  void removeFromImagenes(String item) => imagenes.remove(item);
  void removeAtIndexFromImagenes(int index) => imagenes.removeAt(index);
  void insertAtIndexInImagenes(int index, String item) =>
      imagenes.insert(index, item);
  void updateImagenesAtIndex(int index, Function(String) updateFn) =>
      imagenes[index] = updateFn(imagenes[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
