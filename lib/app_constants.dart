
abstract class FFAppConstants {
  static const String Recepcion = 'Recepción';
  static const String Diagnostico = 'Diagnóstico';
  static const String Cotizacion = 'Cotización';
  static const String Finalizado = 'Finalizado';
  static const String Enreparacion = 'Reparación';

  // Estado intermedio entre «Reparación» y «Finalizado».
  //
  // Antes no existia: `Finalizado` solo lo escribia el CLIENTE al contestar la encuesta de
  // satisfaccion, asi que una orden acabada cuyo cliente no responde se quedaba en
  // «Reparacion» para siempre. En produccion hay ordenes con el control de calidad hecho que
  // el panel sigue mostrando como si el coche estuviera en el elevador, y al cliente se le
  // dice «Estado: Reparación» en la misma pagina donde se le pide que confirme la entrega.
  //
  // Con este estado el taller cierra su parte sin depender de que el cliente conteste, y se
  // distingue lo unico que importa operativamente: el coche esta listo y falta entregarlo
  // o cobrarlo. El cierre definitivo (`Finalizado`) llega por la conformidad del cliente o
  // por facturar la orden.
  static const String ListoParaEntrega = 'Listo para entrega';
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
