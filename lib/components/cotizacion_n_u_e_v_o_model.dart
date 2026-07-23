import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cotizacion_n_u_e_v_o_widget.dart' show CotizacionNUEVOWidget;
import 'package:flutter/material.dart';

class CotizacionNUEVOModel extends FlutterFlowModel<CotizacionNUEVOWidget> {
  ///  Local state fields for this component.

  List<RepuestosStruct> repuestos = [];
  void addToRepuestos(RepuestosStruct item) => repuestos.add(item);
  void removeFromRepuestos(RepuestosStruct item) => repuestos.remove(item);
  void removeAtIndexFromRepuestos(int index) => repuestos.removeAt(index);
  void insertAtIndexInRepuestos(int index, RepuestosStruct item) =>
      repuestos.insert(index, item);
  void updateRepuestosAtIndex(int index, Function(RepuestosStruct) updateFn) =>
      repuestos[index] = updateFn(repuestos[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
