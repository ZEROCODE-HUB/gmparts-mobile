import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'addarticles_widget.dart' show AddarticlesWidget;
import 'package:flutter/material.dart';

class AddarticlesModel extends FlutterFlowModel<AddarticlesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Codigo widget.
  FocusNode? codigoFocusNode;
  TextEditingController? codigoTextController;
  String? Function(BuildContext, String?)? codigoTextControllerValidator;
  // State field(s) for dd-productot widget.
  String? ddProductotValue;
  FormFieldController<String>? ddProductotValueController;
  // State field(s) for Oem widget.
  FocusNode? oemFocusNode;
  TextEditingController? oemTextController;
  String? Function(BuildContext, String?)? oemTextControllerValidator;
  // State field(s) for Codigoproveedor widget.
  FocusNode? codigoproveedorFocusNode;
  TextEditingController? codigoproveedorTextController;
  String? Function(BuildContext, String?)?
      codigoproveedorTextControllerValidator;
  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for Marca widget.
  String? marcaValue;
  FormFieldController<String>? marcaValueController;
  // State field(s) for dd-Grupo widget.
  String? ddGrupoValue1;
  FormFieldController<String>? ddGrupoValueController1;
  // State field(s) for dd-Unidaddemedida widget.
  String? ddUnidaddemedidaValue;
  FormFieldController<String>? ddUnidaddemedidaValueController;
  // State field(s) for dd-Grupo widget.
  String? ddGrupoValue2;
  FormFieldController<String>? ddGrupoValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  GroupRecord? group123;
  // State field(s) for dd-subgru widget.
  String? ddSubgruValue;
  FormFieldController<String>? ddSubgruValueController;
  // State field(s) for garanta widget.
  String? garantaValue;
  FormFieldController<String>? garantaValueController;
  // State field(s) for noserie widget.
  String? noserieValue;
  FormFieldController<String>? noserieValueController;
  // State field(s) for stockeminimo widget.
  FocusNode? stockeminimoFocusNode;
  TextEditingController? stockeminimoTextController;
  String? Function(BuildContext, String?)? stockeminimoTextControllerValidator;
  // State field(s) for moneda widget.
  String? monedaValue;
  FormFieldController<String>? monedaValueController;
  // State field(s) for preciocompra widget.
  FocusNode? preciocompraFocusNode;
  TextEditingController? preciocompraTextController;
  String? Function(BuildContext, String?)? preciocompraTextControllerValidator;
  // State field(s) for utilidad widget.
  FocusNode? utilidadFocusNode;
  TextEditingController? utilidadTextController;
  String? Function(BuildContext, String?)? utilidadTextControllerValidator;
  // State field(s) for codigodebarras widget.
  FocusNode? codigodebarrasFocusNode;
  TextEditingController? codigodebarrasTextController;
  String? Function(BuildContext, String?)?
      codigodebarrasTextControllerValidator;
  bool isDataUploading_uploadDataJ4w11 = false;
  FFUploadedFile uploadedLocalFile_uploadDataJ4w11 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJ4w11 = '';

  // State field(s) for ubicacion widget.
  FocusNode? ubicacionFocusNode;
  TextEditingController? ubicacionTextController;
  String? Function(BuildContext, String?)? ubicacionTextControllerValidator;
  // State field(s) for comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioTextController;
  String? Function(BuildContext, String?)? comentarioTextControllerValidator;
  // State field(s) for P1 widget.
  FocusNode? p1FocusNode;
  TextEditingController? p1TextController;
  String? Function(BuildContext, String?)? p1TextControllerValidator;
  // State field(s) for P2 widget.
  FocusNode? p2FocusNode;
  TextEditingController? p2TextController;
  String? Function(BuildContext, String?)? p2TextControllerValidator;
  // State field(s) for P3 widget.
  FocusNode? p3FocusNode;
  TextEditingController? p3TextController;
  String? Function(BuildContext, String?)? p3TextControllerValidator;
  // State field(s) for PVTAMAYOR widget.
  FocusNode? pvtamayorFocusNode;
  TextEditingController? pvtamayorTextController;
  String? Function(BuildContext, String?)? pvtamayorTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codigoFocusNode?.dispose();
    codigoTextController?.dispose();

    oemFocusNode?.dispose();
    oemTextController?.dispose();

    codigoproveedorFocusNode?.dispose();
    codigoproveedorTextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    stockeminimoFocusNode?.dispose();
    stockeminimoTextController?.dispose();

    preciocompraFocusNode?.dispose();
    preciocompraTextController?.dispose();

    utilidadFocusNode?.dispose();
    utilidadTextController?.dispose();

    codigodebarrasFocusNode?.dispose();
    codigodebarrasTextController?.dispose();

    ubicacionFocusNode?.dispose();
    ubicacionTextController?.dispose();

    comentarioFocusNode?.dispose();
    comentarioTextController?.dispose();

    p1FocusNode?.dispose();
    p1TextController?.dispose();

    p2FocusNode?.dispose();
    p2TextController?.dispose();

    p3FocusNode?.dispose();
    p3TextController?.dispose();

    pvtamayorFocusNode?.dispose();
    pvtamayorTextController?.dispose();
  }
}
