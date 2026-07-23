import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'editar_articulo_modal_copy_widget.dart'
    show EditarArticuloModalCopyWidget;
import 'package:flutter/material.dart';

class EditarArticuloModalCopyModel
    extends FlutterFlowModel<EditarArticuloModalCopyWidget> {
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

  double? peciodeventa;

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
  // State field(s) for dd-Marca widget.
  String? ddMarcaValue;
  FormFieldController<String>? ddMarcaValueController;
  // State field(s) for DD-Unidaddemedida widget.
  String? dDUnidaddemedidaValue;
  FormFieldController<String>? dDUnidaddemedidaValueController;
  // State field(s) for DD-Grupo widget.
  String? dDGrupoValue;
  FormFieldController<String>? dDGrupoValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  GroupRecord? group12345;
  // State field(s) for DD-subgru widget.
  String? dDSubgruValue;
  FormFieldController<String>? dDSubgruValueController;
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
  bool isDataUploading_uploadDataJ4wa = false;
  FFUploadedFile uploadedLocalFile_uploadDataJ4wa =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataJ4wa = '';

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
