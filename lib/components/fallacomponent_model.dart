import '/backend/schema/structs/index.dart';
import '/components/textfallas_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'fallacomponent_widget.dart' show FallacomponentWidget;
import 'package:flutter/material.dart';

class FallacomponentModel extends FlutterFlowModel<FallacomponentWidget> {
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

  // Model for nombreFalla.
  late TextfallasModel nombreFallaModel;
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
  bool isDataUploading_imgautom53 = false;
  FFUploadedFile uploadedLocalFile_imgautom53 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautom53 = '';

  bool isDataUploading_imgautom561 = false;
  FFUploadedFile uploadedLocalFile_imgautom561 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautom561 = '';

  @override
  void initState(BuildContext context) {
    nombreFallaModel = createModel(context, () => TextfallasModel());
  }

  @override
  void dispose() {
    nombreFallaModel.dispose();
    nombreFallaFocusNode?.dispose();
    nombreFallaTextController?.dispose();

    servicioSolucionFocusNode?.dispose();
    servicioSolucionTextController?.dispose();

    tiempoEstimadoFocusNode?.dispose();
    tiempoEstimadoTextController?.dispose();
  }
}
