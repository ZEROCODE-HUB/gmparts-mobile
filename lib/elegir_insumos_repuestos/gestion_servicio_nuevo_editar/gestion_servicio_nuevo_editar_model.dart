import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'gestion_servicio_nuevo_editar_widget.dart'
    show GestionServicioNuevoEditarWidget;
import 'package:flutter/material.dart';

class GestionServicioNuevoEditarModel
    extends FlutterFlowModel<GestionServicioNuevoEditarWidget> {
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

  // State field(s) for Codigoserv widget.
  FocusNode? codigoservFocusNode;
  TextEditingController? codigoservTextController;
  String? Function(BuildContext, String?)? codigoservTextControllerValidator;
  // State field(s) for Precioserv widget.
  FocusNode? precioservFocusNode;
  TextEditingController? precioservTextController;
  String? Function(BuildContext, String?)? precioservTextControllerValidator;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionTextController;
  String? Function(BuildContext, String?)? descripcionTextControllerValidator;
  // State field(s) for alertadias widget.
  String? alertadiasValue;
  FormFieldController<String>? alertadiasValueController;
  // State field(s) for moneda widget.
  String? monedaValue;
  FormFieldController<String>? monedaValueController;
  // State field(s) for dd-sistema widget.
  String? ddSistemaValue;
  FormFieldController<String>? ddSistemaValueController;
  // State field(s) for dd-TipodeServicio widget.
  String? ddTipodeServicioValue;
  FormFieldController<String>? ddTipodeServicioValueController;
  // State field(s) for dd-CategoraMTC widget.
  String? ddCategoraMTCValue;
  FormFieldController<String>? ddCategoraMTCValueController;
  // State field(s) for dd-Tipodevehculo widget.
  String? ddTipodevehculoValue;
  FormFieldController<String>? ddTipodevehculoValueController;
  // State field(s) for dd-Carrocera widget.
  String? ddCarroceraValue;
  FormFieldController<String>? ddCarroceraValueController;
  // State field(s) for Notasserv widget.
  FocusNode? notasservFocusNode;
  TextEditingController? notasservTextController;
  String? Function(BuildContext, String?)? notasservTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codigoservFocusNode?.dispose();
    codigoservTextController?.dispose();

    precioservFocusNode?.dispose();
    precioservTextController?.dispose();

    descripcionFocusNode?.dispose();
    descripcionTextController?.dispose();

    notasservFocusNode?.dispose();
    notasservTextController?.dispose();
  }
}
