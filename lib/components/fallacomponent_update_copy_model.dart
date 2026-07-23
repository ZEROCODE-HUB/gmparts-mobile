import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fallacomponent_update_copy_widget.dart'
    show FallacomponentUpdateCopyWidget;
import 'package:flutter/material.dart';

class FallacomponentUpdateCopyModel
    extends FlutterFlowModel<FallacomponentUpdateCopyWidget> {
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

  List<RepuestosStruct> repuestoss = [];
  void addToRepuestoss(RepuestosStruct item) => repuestoss.add(item);
  void removeFromRepuestoss(RepuestosStruct item) => repuestoss.remove(item);
  void removeAtIndexFromRepuestoss(int index) => repuestoss.removeAt(index);
  void insertAtIndexInRepuestoss(int index, RepuestosStruct item) =>
      repuestoss.insert(index, item);
  void updateRepuestossAtIndex(int index, Function(RepuestosStruct) updateFn) =>
      repuestoss[index] = updateFn(repuestoss[index]);

  List<InsumosStruct> insumos = [];
  void addToInsumos(InsumosStruct item) => insumos.add(item);
  void removeFromInsumos(InsumosStruct item) => insumos.remove(item);
  void removeAtIndexFromInsumos(int index) => insumos.removeAt(index);
  void insertAtIndexInInsumos(int index, InsumosStruct item) =>
      insumos.insert(index, item);
  void updateInsumosAtIndex(int index, Function(InsumosStruct) updateFn) =>
      insumos[index] = updateFn(insumos[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for nombreFalla widget.
  FocusNode? nombreFallaFocusNode;
  TextEditingController? nombreFallaTextController;
  String? Function(BuildContext, String?)? nombreFallaTextControllerValidator;
  // State field(s) for servicioSolucion widget.
  FocusNode? servicioSolucionFocusNode;
  TextEditingController? servicioSolucionTextController;
  String? Function(BuildContext, String?)?
      servicioSolucionTextControllerValidator;
  // State field(s) for tiempoEstimado widget.
  FocusNode? tiempoEstimadoFocusNode;
  TextEditingController? tiempoEstimadoTextController;
  String? Function(BuildContext, String?)?
      tiempoEstimadoTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Container widget.
  List<RepuestosStruct>? datatyperepuestoss;
  bool isDataUploading_imgautom5 = false;
  FFUploadedFile uploadedLocalFile_imgautom5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautom5 = '';

  bool isDataUploading_imgautom56 = false;
  FFUploadedFile uploadedLocalFile_imgautom56 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautom56 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nombreFallaFocusNode?.dispose();
    nombreFallaTextController?.dispose();

    servicioSolucionFocusNode?.dispose();
    servicioSolucionTextController?.dispose();

    tiempoEstimadoFocusNode?.dispose();
    tiempoEstimadoTextController?.dispose();
  }
}
