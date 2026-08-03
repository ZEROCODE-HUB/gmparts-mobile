import '/components/finalizarfalla_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
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

  // Fotos de finalización a nivel de recepción.
  List<String> fotosFinalizacion = [];
  void addToFotosFinalizacion(String item) => fotosFinalizacion.add(item);
  void removeFromFotosFinalizacion(String item) =>
      fotosFinalizacion.remove(item);
  void removeAtIndexFromFotosFinalizacion(int index) =>
      fotosFinalizacion.removeAt(index);
  void insertAtIndexInFotosFinalizacion(int index, String item) =>
      fotosFinalizacion.insert(index, item);
  void updateFotosFinalizacionAtIndex(
          int index, Function(String) updateFn) =>
      fotosFinalizacion[index] = updateFn(fotosFinalizacion[index]);

  FFUploadedFile uploadedLocalFileFotosFin = FFUploadedFile();
  String uploadedFileUrlFotosFin = '';
  bool isDataUploadingFotosFin = false;

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
