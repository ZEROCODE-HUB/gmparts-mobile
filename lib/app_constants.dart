
abstract class FFAppConstants {
  static const String Recepcion = 'Recepción';
  static const String Diagnostico = 'Diagnóstico';
  static const String Cotizacion = 'Cotización';
  static const String Finalizado = 'Finalizado';
  static const String Enreparacion = 'Reparación';
  static const String TipoPersonaNatural = 'Natural';
  static const String TipoPersonaJuridica = 'Jurídica';
  static const String UserRoleAdmin = 'Admin';
  static const String UserRoleCustomer = 'Cliente';
  static const String UserRoleEncargado = 'Encargado';
  static const String INGRESODEINVENTARIO = 'INGRESO DE INVENTARIO';
  static const String SALIDADEINVENTARIO = 'SALIDA DE INVENTARIO';
  static const String tipoRepuesto = 'repuesto';
  static const String tipoInsumo = 'insumo';

  // Roles que pueden figurar como «tecnico de servicio» de una orden. El desplegable
  // ofrecia a todo el que no fuera Cliente, asi que se podia asignar el trabajo al gerente
  // general o a la cuenta de administracion. Los nombres son los mismos que usa el panel
  // (src/lib/auth.js) y los que sincroniza `onUserRoleWrite` en los custom claims.
  static const List<String> rolesDeTaller = ['Tecnico Mecanico', 'Jefe de Taller'];
}
