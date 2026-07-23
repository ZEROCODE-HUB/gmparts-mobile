import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'crearfalla_n_u_e_v_oeditar_widget.dart'
    show CrearfallaNUEVOeditarWidget;
import 'package:flutter/material.dart';

class CrearfallaNUEVOeditarModel
    extends FlutterFlowModel<CrearfallaNUEVOeditarWidget> {
  ///  Local state fields for this component.

  List<String> fotos = [];
  void addToFotos(String item) => fotos.add(item);
  void removeFromFotos(String item) => fotos.remove(item);
  void removeAtIndexFromFotos(int index) => fotos.removeAt(index);
  void insertAtIndexInFotos(int index, String item) =>
      fotos.insert(index, item);
  void updateFotosAtIndex(int index, Function(String) updateFn) =>
      fotos[index] = updateFn(fotos[index]);

  List<RepuestosStruct> repuestos = [];
  void addToRepuestos(RepuestosStruct item) => repuestos.add(item);
  void removeFromRepuestos(RepuestosStruct item) => repuestos.remove(item);
  void removeAtIndexFromRepuestos(int index) => repuestos.removeAt(index);
  void insertAtIndexInRepuestos(int index, RepuestosStruct item) =>
      repuestos.insert(index, item);
  void updateRepuestosAtIndex(int index, Function(RepuestosStruct) updateFn) =>
      repuestos[index] = updateFn(repuestos[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nombreFalla widget.
  FocusNode? nombreFallaFocusNode;
  TextEditingController? nombreFallaTextController;
  String? Function(BuildContext, String?)? nombreFallaTextControllerValidator;
  String? _nombreFallaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el nombre de la falla';
    }

    return null;
  }

  // State field(s) for dd-TipodeServicio widget.
  String? ddTipodeServicioValue;
  FormFieldController<String>? ddTipodeServicioValueController;
  // State field(s) for tiempoEstimado widget.
  FocusNode? tiempoEstimadoFocusNode;
  TextEditingController? tiempoEstimadoTextController;
  String? Function(BuildContext, String?)?
      tiempoEstimadoTextControllerValidator;
  String? _tiempoEstimadoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Ingresa el tiempo estimado en horas';
    }

    return null;
  }

  bool isDataUploading_firebaseupdate9 = false;
  FFUploadedFile uploadedLocalFile_firebaseupdate9 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_firebaseupdate9 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ServiceRecord? servicioSlecetr;

  @override
  void initState(BuildContext context) {
    nombreFallaTextControllerValidator = _nombreFallaTextControllerValidator;
    tiempoEstimadoTextControllerValidator =
        _tiempoEstimadoTextControllerValidator;
  }

  @override
  void dispose() {
    nombreFallaFocusNode?.dispose();
    nombreFallaTextController?.dispose();

    tiempoEstimadoFocusNode?.dispose();
    tiempoEstimadoTextController?.dispose();
  }
}
