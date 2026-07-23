import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'agregar_cliente_widget.dart' show AgregarClienteWidget;
import 'package:flutter/material.dart';

class AgregarClienteModel extends FlutterFlowModel<AgregarClienteWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es obligatorio';
    }

    return null;
  }

  // State field(s) for dni widget.
  FocusNode? dniFocusNode;
  TextEditingController? dniTextController;
  String? Function(BuildContext, String?)? dniTextControllerValidator;
  String? _dniTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El DNI es obligatorio';
    }

    return null;
  }

  // State field(s) for codigoPais widget.
  String? codigoPaisValue1;
  FormFieldController<String>? codigoPaisValueController1;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode1;
  TextEditingController? telefonoTextController1;
  String? Function(BuildContext, String?)? telefonoTextController1Validator;
  String? _telefonoTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El telefono es obligatorio';
    }

    return null;
  }

  // State field(s) for TextFieldEmailNatural widget.
  FocusNode? textFieldEmailNaturalFocusNode;
  TextEditingController? textFieldEmailNaturalTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailNaturalTextControllerValidator;
  String? _textFieldEmailNaturalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electronico es obligatorio';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Ingrese un correo valido';
    }
    return null;
  }

  // State field(s) for ruc widget.
  FocusNode? rucFocusNode;
  TextEditingController? rucTextController;
  String? Function(BuildContext, String?)? rucTextControllerValidator;
  String? _rucTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'RUC es obligatorio';
    }

    return null;
  }

  // State field(s) for razonSocial widget.
  FocusNode? razonSocialFocusNode;
  TextEditingController? razonSocialTextController;
  String? Function(BuildContext, String?)? razonSocialTextControllerValidator;
  String? _razonSocialTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Razon social es obligatorio';
    }

    return null;
  }

  // State field(s) for encargado widget.
  FocusNode? encargadoFocusNode;
  TextEditingController? encargadoTextController;
  String? Function(BuildContext, String?)? encargadoTextControllerValidator;
  String? _encargadoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del encargado es obligatorio';
    }

    return null;
  }

  // State field(s) for codigoPais widget.
  String? codigoPaisValue2;
  FormFieldController<String>? codigoPaisValueController2;
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode2;
  TextEditingController? telefonoTextController2;
  String? Function(BuildContext, String?)? telefonoTextController2Validator;
  String? _telefonoTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El telefono es obligatorio';
    }

    return null;
  }

  // State field(s) for TextFieldEmailJuridico widget.
  FocusNode? textFieldEmailJuridicoFocusNode;
  TextEditingController? textFieldEmailJuridicoTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailJuridicoTextControllerValidator;
  String? _textFieldEmailJuridicoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo electronico es obligatorio';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'El correo es invalido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    nombreTextControllerValidator = _nombreTextControllerValidator;
    dniTextControllerValidator = _dniTextControllerValidator;
    telefonoTextController1Validator = _telefonoTextController1Validator;
    textFieldEmailNaturalTextControllerValidator =
        _textFieldEmailNaturalTextControllerValidator;
    rucTextControllerValidator = _rucTextControllerValidator;
    razonSocialTextControllerValidator = _razonSocialTextControllerValidator;
    encargadoTextControllerValidator = _encargadoTextControllerValidator;
    telefonoTextController2Validator = _telefonoTextController2Validator;
    textFieldEmailJuridicoTextControllerValidator =
        _textFieldEmailJuridicoTextControllerValidator;
  }

  @override
  void dispose() {
    columnController?.dispose();
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    dniFocusNode?.dispose();
    dniTextController?.dispose();

    telefonoFocusNode1?.dispose();
    telefonoTextController1?.dispose();

    textFieldEmailNaturalFocusNode?.dispose();
    textFieldEmailNaturalTextController?.dispose();

    rucFocusNode?.dispose();
    rucTextController?.dispose();

    razonSocialFocusNode?.dispose();
    razonSocialTextController?.dispose();

    encargadoFocusNode?.dispose();
    encargadoTextController?.dispose();

    telefonoFocusNode2?.dispose();
    telefonoTextController2?.dispose();

    textFieldEmailJuridicoFocusNode?.dispose();
    textFieldEmailJuridicoTextController?.dispose();
  }
}
