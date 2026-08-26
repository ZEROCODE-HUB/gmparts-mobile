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

    // El campo dice «en horas» pero aceptaba cualquier texto, y el importe se calcula con
    // `double.tryParse(...) ?? 0.0`. Escribir «2 dias» daba CERO horas, y con ello
    // `Mano_de_obra = 0`: la cotizacion perdia entera la mano de obra y el cliente aprobaba
    // solo los repuestos. Comprobado en la base: de 5 diagnosticos con tarifa de servicio,
    // 3 tienen la mano de obra a 0.00 y los 3 llevan el tiempo escrito con palabras
    // («10 dias », «5diaa», «2 dias »).
    //
    // Se acepta la coma decimal porque en Peru es lo natural al teclear «1,5».
    final horas = double.tryParse(val.trim().replaceAll(',', '.'));
    if (horas == null) {
      return 'Escribe solo el numero de horas, sin texto (por ejemplo 2 o 1.5)';
    }
    if (horas <= 0) {
      return 'El tiempo estimado tiene que ser mayor que cero';
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
