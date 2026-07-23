import '/components/fallacomponent_update_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crear_cotizacion_funcionando_copy_widget.dart'
    show CrearCotizacionFuncionandoCopyWidget;
import 'package:flutter/material.dart';

class CrearCotizacionFuncionandoCopyModel
    extends FlutterFlowModel<CrearCotizacionFuncionandoCopyWidget> {
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

  List<int> addNew = [];
  void addToAddNew(int item) => addNew.add(item);
  void removeFromAddNew(int item) => addNew.remove(item);
  void removeAtIndexFromAddNew(int index) => addNew.removeAt(index);
  void insertAtIndexInAddNew(int index, int item) => addNew.insert(index, item);
  void updateAddNewAtIndex(int index, Function(int) updateFn) =>
      addNew[index] = updateFn(addNew[index]);

  ///  State fields for stateful widgets in this page.

  // Models for fallacomponentUpdate dynamic component.
  late FlutterFlowDynamicModels<FallacomponentUpdateModel>
      fallacomponentUpdateModels;

  @override
  void initState(BuildContext context) {
    fallacomponentUpdateModels =
        FlutterFlowDynamicModels(() => FallacomponentUpdateModel());
  }

  @override
  void dispose() {
    fallacomponentUpdateModels.dispose();
  }
}
