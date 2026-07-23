import '/components/textfallas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_measurment_unit_widget.dart' show AddMeasurmentUnitWidget;
import 'package:flutter/material.dart';

class AddMeasurmentUnitModel extends FlutterFlowModel<AddMeasurmentUnitWidget> {
  ///  Local state fields for this component.

  bool expandir = false;

  List<String> imagenes = [];
  void addToImagenes(String item) => imagenes.add(item);
  void removeFromImagenes(String item) => imagenes.remove(item);
  void removeAtIndexFromImagenes(int index) => imagenes.removeAt(index);
  void insertAtIndexInImagenes(int index, String item) =>
      imagenes.insert(index, item);
  void updateImagenesAtIndex(int index, Function(String) updateFn) =>
      imagenes[index] = updateFn(imagenes[index]);

  ///  State fields for stateful widgets in this component.

  // Model for nombre.
  late TextfallasModel nombreModel;

  @override
  void initState(BuildContext context) {
    nombreModel = createModel(context, () => TextfallasModel());
  }

  @override
  void dispose() {
    nombreModel.dispose();
  }
}
