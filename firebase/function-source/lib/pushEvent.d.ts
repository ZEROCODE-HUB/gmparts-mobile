export type RecepcionEvent = 'recepcion_creada' | 'cliente_aprueba_recepcion' | 'cliente_aprueba_cotizacion' | 'vehiculo_finalizado' | 'factura_emitida' | 'cliente_aprueba_reporte';
export type SnapshotData = Record<string, unknown> | null | undefined;
/**
 * Genera las variantes de escritura (case) de cada rol para consultar Firestore
 * sin depender de en qué formato (mayúsculas/minúsculas) esté guardado el rol
 * en `user_role`. El operador `in` de Firestore es exacto, así que se listan
 * todas las variantes razonables de cada rol objetivo.
 */
export declare function buildRoleVariants(roles: string[]): string[];
/**
 * Devuelve los eventos de push que se disparan en una operación de escritura
 * sobre `recepciones/{id}`. `before` es null en un create.
 */
export declare function detectRecepcionEvents(before: SnapshotData, after: SnapshotData): RecepcionEvent[];
/**
 * Roles que reciben la notificación en cada evento.
 * Se incluyen 'Admin' y 'Administrador' por compatibilidad con el dato
 * existente en Firestore (campo userRole).
 */
export declare const EVENT_ROLES: Record<RecepcionEvent, string[]>;
export interface NotificationPayload {
    title: string;
    body: string;
    data: Record<string, string>;
}
/**
 * Construye el contenido (title + body + data) de la notificación de un evento.
 * Los nombres de campos aplanados de recepciones: nombre_cliente, placa, numeroorden.
 */
export declare function buildEventPayload(event: RecepcionEvent, record: SnapshotData, recepcionId: string): NotificationPayload;
