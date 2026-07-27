import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_vehiculo_widget.dart' show AgregarVehiculoWidget;
import 'package:flutter/material.dart';

class AgregarVehiculoModel extends FlutterFlowModel<AgregarVehiculoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in agregar-vehiculo widget.
  UsersRecord? username;
  // State field(s) for TextFieldPlaca widget.
  FocusNode? textFieldPlacaFocusNode;
  TextEditingController? textFieldPlacaTextController;
  String? Function(BuildContext, String?)?
      textFieldPlacaTextControllerValidator;
  // State field(s) for marca dropdown.
  String? vehiculoMarca;
  FormFieldController<String>? marcaValueController;
  // State field(s) for modelo dropdown.
  String? vehiculoModelo;
  FormFieldController<String>? modeloValueController;

  // State field(s) for vin widget.
  FocusNode? vinFocusNode;
  TextEditingController? vinTextController;
  String? Function(BuildContext, String?)? vinTextControllerValidator;
  String? _vinTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número del VIN es obligatorio';
    }

    return null;
  }

  // State field(s) for anioFabricacion widget.
  FocusNode? anioFabricacionFocusNode;
  TextEditingController? anioFabricacionTextController;
  String? Function(BuildContext, String?)?
      anioFabricacionTextControllerValidator;
  String? _anioFabricacionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El año de fabricación es obligatorio';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  VehiculosRecord? vvref;

  @override
  void initState(BuildContext context) {
    vinTextControllerValidator = _vinTextControllerValidator;
    anioFabricacionTextControllerValidator =
        _anioFabricacionTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldPlacaFocusNode?.dispose();
    textFieldPlacaTextController?.dispose();



    vinFocusNode?.dispose();
    vinTextController?.dispose();

    anioFabricacionFocusNode?.dispose();
    anioFabricacionTextController?.dispose();
  }
}
