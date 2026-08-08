import * as functions from 'firebase-functions/v1';
/**
 * Trigger: cualquier escritura sobre recepciones/{recepcionId}.
 * Detecta los eventos definidos y envía push notifications FCM a los roles
 * correspondientes:
 *   1. recepcion_creada             → Admin · Gerente General · Jefe de Taller
 *   2. cliente_aprueba_recepcion    → Admin · Gerente General · Jefe de Taller
 *   3. cliente_aprueba_cotizacion   → Admin · Gerente General · Jefe de Taller
 *   4. vehiculo_finalizado          -> Admin · Gerente General · Jefe de Taller
 *   5. factura_emitida              -> Admin · Gerente General · Jefe de Taller
 *   6. cliente_aprueba_reporte      -> Admin · Gerente General · Encargado
 */
export declare const onRecepcionPush: functions.CloudFunction<functions.Change<functions.firestore.DocumentSnapshot>>;
