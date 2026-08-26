
abstract class FFAppConstants {
  // Una cita es una recepcion que todavia no ha ocurrido: mismo documento y mismo
  // expediente, un estado antes. Cuando el vehiculo llega, el asesor abre esa misma orden y
  // completa la recepcion de siempre. La «agenda» es la lista de ordenes en este estado
  // ordenada por `fechaCita`. Sin calendario ni control de cupo: eso era lo que convertia la
  // etapa 01 del Excel en un proyecto aparte.
  static const String CitaProgramada = 'Cita programada';

  static const String Recepcion = 'Recepción';
  static const String Diagnostico = 'Diagnóstico';
  static const String Cotizacion = 'Cotización';

  // Etapa 05 del Excel. Antes se saltaba de «Cotización» a «Reparación» de golpe: no habia
  // forma de saber si la cotizacion se habia ENVIADO y se estaba esperando respuesta, que es
  // justo donde una orden se queda parada mas dias. Lo escribe la app al generar el enlace.
  static const String EsperandoAprobacion = 'Esperando aprobación';

  // Etapa 07. El cliente ya aprobo, pero el trabajo aun no tiene tecnico, bahia ni fecha.
  // Lo escribe `approveQuote` al aprobar el cliente, y sale de aqui cuando el jefe de taller
  // asigna. Antes la aprobacion saltaba directamente a «Reparación», con lo que una orden
  // aprobada y otra ya en el elevador eran indistinguibles.
  static const String Programado = 'Programado';
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
