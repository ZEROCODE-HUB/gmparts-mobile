import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'b_nuevarecepcionrapida_f_widget.dart' show BNuevarecepcionrapidaFWidget;
import 'package:flutter/material.dart';

class BNuevarecepcionrapidaFModel
    extends FlutterFlowModel<BNuevarecepcionrapidaFWidget> {
  ///  Local state fields for this page.

  List<String> imagenesauto = [];
  void addToImagenesauto(String item) => imagenesauto.add(item);
  void removeFromImagenesauto(String item) => imagenesauto.remove(item);
  void removeAtIndexFromImagenesauto(int index) => imagenesauto.removeAt(index);
  void insertAtIndexInImagenesauto(int index, String item) =>
      imagenesauto.insert(index, item);
  void updateImagenesautoAtIndex(int index, Function(String) updateFn) =>
      imagenesauto[index] = updateFn(imagenesauto[index]);

  int? randomid;

  DocumentReference? userSelected;

  String? userTelefono;

  DocumentReference? vechiculoSelected;

  String? vehiculoMarca;

  String? vehiculoModelo;

  String? userCodigo = '';

  String? codigoSelected;

  String? userEmail;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in b-nuevarecepcionrapidaF widget.
  RecepcionesRecord? recepcionDATOS;
  // State field(s) for tipopersona widget.
  String? tipopersonaValue;
  FormFieldController<String>? tipopersonaValueController;
  // State field(s) for nombrePersona widget.
  String? nombrePersonaValue;
  FormFieldController<String>? nombrePersonaValueController;
  // Stores action output result for [Backend Call - Read Document] action in nombrePersona widget.
  UsersRecord? readUser;
  // State field(s) for dniNatural widget.
  FocusNode? dniNaturalFocusNode;
  TextEditingController? dniNaturalTextController;
  String? Function(BuildContext, String?)? dniNaturalTextControllerValidator;
  // State field(s) for codigoPais widget.
  String? codigoPaisValue;
  FormFieldController<String>? codigoPaisValueController;
  // State field(s) for DropDownCodigo widget.
  String? dropDownCodigoValue;
  FormFieldController<String>? dropDownCodigoValueController;
  // State field(s) for telefonoNatural widget.
  FocusNode? telefonoNaturalFocusNode;
  TextEditingController? telefonoNaturalTextController;
  String? Function(BuildContext, String?)?
      telefonoNaturalTextControllerValidator;
  String? _telefonoNaturalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El telefono es obligatorio';
    }

    return null;
  }

  // State field(s) for correonatural widget.
  FocusNode? correonaturalFocusNode;
  TextEditingController? correonaturalTextController;
  String? Function(BuildContext, String?)? correonaturalTextControllerValidator;
  // State field(s) for TextFieldRuc widget.
  FocusNode? textFieldRucFocusNode;
  TextEditingController? textFieldRucTextController;
  String? Function(BuildContext, String?)? textFieldRucTextControllerValidator;
  // State field(s) for codigoPais2 widget.
  String? codigoPais2Value;
  FormFieldController<String>? codigoPais2ValueController;
  // State field(s) for telefonoJuridico widget.
  FocusNode? telefonoJuridicoFocusNode;
  TextEditingController? telefonoJuridicoTextController;
  String? Function(BuildContext, String?)?
      telefonoJuridicoTextControllerValidator;
  // State field(s) for correoJuriidco widget.
  FocusNode? correoJuriidcoFocusNode;
  TextEditingController? correoJuriidcoTextController;
  String? Function(BuildContext, String?)?
      correoJuriidcoTextControllerValidator;
  // State field(s) for numeroPlaca widget.
  String? numeroPlacaValue;
  FormFieldController<String>? numeroPlacaValueController;
  // Stores action output result for [Backend Call - Read Document] action in numeroPlaca widget.
  VehiculosRecord? readVehicle;
  // State field(s) for marca widget.
  FocusNode? marcaFocusNode;
  TextEditingController? marcaTextController;
  String? Function(BuildContext, String?)? marcaTextControllerValidator;
  // State field(s) for modelo widget.
  FocusNode? modeloFocusNode;
  TextEditingController? modeloTextController;
  String? Function(BuildContext, String?)? modeloTextControllerValidator;
  String? _modeloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Modelo es obligatorio';
    }

    return null;
  }

  // State field(s) for kmIngreso widget.
  FocusNode? kmIngresoFocusNode;
  TextEditingController? kmIngresoTextController;
  String? Function(BuildContext, String?)? kmIngresoTextControllerValidator;
  String? _kmIngresoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Kilometraje de ingreso es obligatorio';
    }

    return null;
  }

  // State field(s) for Marca dropdown.
  FormFieldController<String>? marcaValueController;
  // State field(s) for Modelo dropdown.
  FormFieldController<String>? modeloValueController;
  // State field(s) for DropDownTecnico widget.
  String? dropDownTecnicoValue;
  FormFieldController<String>? dropDownTecnicoValueController;
  // State field(s) for DropDownTipoServicio widget.
  String? dropDownTipoServicioValue;
  FormFieldController<String>? dropDownTipoServicioValueController;
  // State field(s) for motivo widget.
  FocusNode? motivoFocusNode;
  TextEditingController? motivoTextController;
  String? Function(BuildContext, String?)? motivoTextControllerValidator;
  String? _motivoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Motivo es obligatorio';
    }

    return null;
  }

  bool isDataUploading_imgauto24 = false;
  FFUploadedFile uploadedLocalFile_imgauto24 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgauto24 = '';

  bool isDataUploading_imgauto = false;
  FFUploadedFile uploadedLocalFile_imgauto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgauto = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  LastCodeRecord? lastcode;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RecepcionesRecord? id2;

  @override
  void initState(BuildContext context) {
    telefonoNaturalTextControllerValidator =
        _telefonoNaturalTextControllerValidator;
    modeloTextControllerValidator = _modeloTextControllerValidator;
    kmIngresoTextControllerValidator = _kmIngresoTextControllerValidator;
    motivoTextControllerValidator = _motivoTextControllerValidator;
  }

  @override
  void dispose() {
    dniNaturalFocusNode?.dispose();
    dniNaturalTextController?.dispose();

    telefonoNaturalFocusNode?.dispose();
    telefonoNaturalTextController?.dispose();

    correonaturalFocusNode?.dispose();
    correonaturalTextController?.dispose();

    textFieldRucFocusNode?.dispose();
    textFieldRucTextController?.dispose();

    telefonoJuridicoFocusNode?.dispose();
    telefonoJuridicoTextController?.dispose();

    correoJuriidcoFocusNode?.dispose();
    correoJuriidcoTextController?.dispose();

    marcaFocusNode?.dispose();
    marcaTextController?.dispose();

    modeloFocusNode?.dispose();
    modeloTextController?.dispose();

    kmIngresoFocusNode?.dispose();
    kmIngresoTextController?.dispose();

    motivoFocusNode?.dispose();
    motivoTextController?.dispose();
  }
}
