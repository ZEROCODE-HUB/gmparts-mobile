import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'c_nueva_recepcion_completa_f_widget.dart'
    show CNuevaRecepcionCompletaFWidget;
import 'package:flutter/material.dart';

class CNuevaRecepcionCompletaFModel
    extends FlutterFlowModel<CNuevaRecepcionCompletaFWidget> {
  ///  Local state fields for this page.

  int pagina = 1;

  List<String> imgautos = [];
  void addToImgautos(String item) => imgautos.add(item);
  void removeFromImgautos(String item) => imgautos.remove(item);
  void removeAtIndexFromImgautos(int index) => imgautos.removeAt(index);
  void insertAtIndexInImgautos(int index, String item) =>
      imgautos.insert(index, item);
  void updateImgautosAtIndex(int index, Function(String) updateFn) =>
      imgautos[index] = updateFn(imgautos[index]);

  int? randomid;

  DocumentReference? userSelected;

  DocumentReference? vehiculoSelected;

  String? vehiculoMarca;

  String? vehiculoModelo;

  String? vehiculoAgeFabricacion;

  bool isNuevoVehiculo = false;

  DocumentReference? vehiculoRef;

  String? userCodigo;

  String? userTelefono;

  bool? isNuevoUser;

  String? userEmail;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for sc1 widget.
  ScrollController? sc1ScrollController;
  // State field(s) for tipoPersona widget.
  String? tipoPersonaValue;
  FormFieldController<String>? tipoPersonaValueController;
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
  // State field(s) for telefono widget.
  FocusNode? telefonoFocusNode;
  TextEditingController? telefonoTextController;
  String? Function(BuildContext, String?)? telefonoTextControllerValidator;
  // State field(s) for RUCempresa widget.
  FocusNode? rUCempresaFocusNode;
  TextEditingController? rUCempresaTextController;
  String? Function(BuildContext, String?)? rUCempresaTextControllerValidator;
  // State field(s) for codigoPais2 widget.
  String? codigoPais2Value;
  FormFieldController<String>? codigoPais2ValueController;
  // State field(s) for telefonoJuridico widget.
  FocusNode? telefonoJuridicoFocusNode;
  TextEditingController? telefonoJuridicoTextController;
  String? Function(BuildContext, String?)?
      telefonoJuridicoTextControllerValidator;
  // State field(s) for emailEmpresa widget.
  FocusNode? emailEmpresaFocusNode;
  TextEditingController? emailEmpresaTextController;
  String? Function(BuildContext, String?)? emailEmpresaTextControllerValidator;
  // State field(s) for sc2 widget.
  ScrollController? sc2ScrollController;
  // State field(s) for numeroPlaca widget.
  String? numeroPlacaValue;
  FormFieldController<String>? numeroPlacaValueController;
  // Stores action output result for [Backend Call - Read Document] action in numeroPlaca widget.
  VehiculosRecord? readVehicle;
  // State field(s) for TextFieldVIN widget.
  FocusNode? textFieldVINFocusNode;
  TextEditingController? textFieldVINTextController;
  String? Function(BuildContext, String?)? textFieldVINTextControllerValidator;
  String? _textFieldVINTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El número de VIN es obligatorio';
    }

    return null;
  }

  // State field(s) for TextFieldMarca widget.
  FocusNode? textFieldMarcaFocusNode;
  TextEditingController? textFieldMarcaTextController;
  String? Function(BuildContext, String?)?
      textFieldMarcaTextControllerValidator;
  String? _textFieldMarcaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre de la marca es obligatorio';
    }

    return null;
  }

  // State field(s) for TextFieldModelo widget.
  FocusNode? textFieldModeloFocusNode;
  TextEditingController? textFieldModeloTextController;
  String? Function(BuildContext, String?)?
      textFieldModeloTextControllerValidator;
  String? _textFieldModeloTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre del modelo es obligatorio';
    }

    return null;
  }

  // State field(s) for TextFieldAnioFabricacion widget.
  FocusNode? textFieldAnioFabricacionFocusNode;
  TextEditingController? textFieldAnioFabricacionTextController;
  String? Function(BuildContext, String?)?
      textFieldAnioFabricacionTextControllerValidator;
  String? _textFieldAnioFabricacionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El año de fabricación es obligatorio';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  String? _textController10Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El kilometraje es obligatorio';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController11;
  String? Function(BuildContext, String?)? textController11Validator;
  String? _textController11Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nivel de combustible es obligatorio';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController12;
  String? Function(BuildContext, String?)? textController12Validator;
  // State field(s) for sc3 widget.
  ScrollController? sc3ScrollController;
  // State field(s) for DropDownTecnico widget.
  String? dropDownTecnicoValue;
  FormFieldController<String>? dropDownTecnicoValueController;
  // State field(s) for DropDownTipoTecnico widget.
  String? dropDownTipoTecnicoValue;
  FormFieldController<String>? dropDownTipoTecnicoValueController;
  // State field(s) for TextFieldMotivo widget.
  FocusNode? textFieldMotivoFocusNode;
  TextEditingController? textFieldMotivoTextController;
  String? Function(BuildContext, String?)?
      textFieldMotivoTextControllerValidator;
  String? _textFieldMotivoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El motivo de ingreso es obligatorio';
    }

    return null;
  }

  // State field(s) for Row widget.
  ScrollController? rowController;
  bool isDataUploading_imgautom2 = false;
  FFUploadedFile uploadedLocalFile_imgautom2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautom2 = '';

  bool isDataUploading_imgautomovil1 = false;
  FFUploadedFile uploadedLocalFile_imgautomovil1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_imgautomovil1 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  LastCodeRecord? lasttCode;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RecepcionesRecord? id;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    sc1ScrollController = ScrollController();
    sc2ScrollController = ScrollController();
    textFieldVINTextControllerValidator = _textFieldVINTextControllerValidator;
    textFieldMarcaTextControllerValidator =
        _textFieldMarcaTextControllerValidator;
    textFieldModeloTextControllerValidator =
        _textFieldModeloTextControllerValidator;
    textFieldAnioFabricacionTextControllerValidator =
        _textFieldAnioFabricacionTextControllerValidator;
    textController10Validator = _textController10Validator;
    textController11Validator = _textController11Validator;
    sc3ScrollController = ScrollController();
    textFieldMotivoTextControllerValidator =
        _textFieldMotivoTextControllerValidator;
    rowController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    sc1ScrollController?.dispose();
    dniNaturalFocusNode?.dispose();
    dniNaturalTextController?.dispose();

    telefonoFocusNode?.dispose();
    telefonoTextController?.dispose();

    rUCempresaFocusNode?.dispose();
    rUCempresaTextController?.dispose();

    telefonoJuridicoFocusNode?.dispose();
    telefonoJuridicoTextController?.dispose();

    emailEmpresaFocusNode?.dispose();
    emailEmpresaTextController?.dispose();

    sc2ScrollController?.dispose();
    textFieldVINFocusNode?.dispose();
    textFieldVINTextController?.dispose();

    textFieldMarcaFocusNode?.dispose();
    textFieldMarcaTextController?.dispose();

    textFieldModeloFocusNode?.dispose();
    textFieldModeloTextController?.dispose();

    textFieldAnioFabricacionFocusNode?.dispose();
    textFieldAnioFabricacionTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController10?.dispose();

    textFieldFocusNode2?.dispose();
    textController11?.dispose();

    textFieldFocusNode3?.dispose();
    textController12?.dispose();

    sc3ScrollController?.dispose();
    textFieldMotivoFocusNode?.dispose();
    textFieldMotivoTextController?.dispose();

    rowController?.dispose();
  }
}
