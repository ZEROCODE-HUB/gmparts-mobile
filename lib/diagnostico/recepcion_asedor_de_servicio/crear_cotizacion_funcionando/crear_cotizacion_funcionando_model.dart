import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'crear_cotizacion_funcionando_widget.dart'
    show CrearCotizacionFuncionandoWidget;
import 'package:flutter/material.dart';

class CrearCotizacionFuncionandoModel
    extends FlutterFlowModel<CrearCotizacionFuncionandoWidget> {
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

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countdiagnosticos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
