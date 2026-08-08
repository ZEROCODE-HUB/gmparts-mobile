"use strict";
/*
 * Lógica pura de detección de eventos de push (sin dependencias de Firebase),
 * para poder ser testeada de forma unitaria con Node.
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.EVENT_ROLES = void 0;
exports.detectRecepcionEvents = detectRecepcionEvents;
exports.buildEventPayload = buildEventPayload;
const FINALIZADO = 'finalizado';
function truthyTrue(value) {
    return value === true;
}
function isNonEmptyString(value) {
    return typeof value === 'string' && value.trim().length > 0;
}
function normalizeStatus(value) {
    return typeof value === 'string' ? value.trim().toLowerCase() : '';
}
/**
 * Devuelve los eventos de push que se disparan en una operación de escritura
 * sobre `recepciones/{id}`. `before` es null en un create.
 */
function detectRecepcionEvents(before, after) {
    const events = [];
    if (!after) {
        return events;
    }
    // Creación de una recepción.
    if (!before) {
        events.push('recepcion_creada');
        return events;
    }
    const becameTrue = (field) => !truthyTrue(before[field]) && truthyTrue(after[field]);
    if (becameTrue('aprobacion_cliente')) {
        events.push('cliente_aprueba_recepcion');
    }
    if (becameTrue('aprobacion_cotizacion')) {
        events.push('cliente_aprueba_cotizacion');
    }
    if (becameTrue('facturado')) {
        events.push('factura_emitida');
    }
    if (normalizeStatus(before['status']) !== FINALIZADO &&
        normalizeStatus(after['status']) === FINALIZADO) {
        events.push('vehiculo_finalizado');
    }
    // Cliente aprueba reporte de finalización: approveReport escribe
    // Clientecontrolcalidad1..4 y marca status 'Finalizado'.
    if (!isNonEmptyString(before['Clientecontrolcalidad1']) &&
        isNonEmptyString(after['Clientecontrolcalidad1'])) {
        events.push('cliente_aprueba_reporte');
    }
    return events;
}
/**
 * Roles que reciben la notificación en cada evento.
 * Se incluyen 'Admin' y 'Administrador' por compatibilidad con el dato
 * existente en Firestore (campo userRole).
 */
exports.EVENT_ROLES = {
    recepcion_creada: ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller'],
    cliente_aprueba_recepcion: ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller'],
    cliente_aprueba_cotizacion: ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller'],
    vehiculo_finalizado: ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller'],
    factura_emitida: ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller'],
    cliente_aprueba_reporte: ['Admin', 'Administrador', 'Gerente General', 'Encargado'],
};
function textOf(record, field) {
    const value = record?.[field];
    if (typeof value === 'string') {
        return value.trim();
    }
    if (typeof value === 'number') {
        return String(value).trim();
    }
    return '';
}
/**
 * Construye el contenido (title + body + data) de la notificación de un evento.
 * Los nombres de campos aplanados de recepciones: nombre_cliente, placa, numeroorden.
 */
function buildEventPayload(event, record, recepcionId) {
    const cliente = textOf(record, 'nombre_cliente') || textOf(record, 'Nombre_encargado');
    const placa = textOf(record, 'placa');
    const numero = textOf(record, 'numeroorden');
    const numeroLabel = numero ? ` #${numero}` : '';
    const clienteLabel = cliente ? ` de ${cliente}` : '';
    const placaLabel = placa ? ` · ${placa}` : '';
    const data = { event, recepcionId };
    switch (event) {
        case 'recepcion_creada':
            return {
                title: 'Nueva recepción 🚗',
                body: `Se registró una recepción${clienteLabel}${placaLabel}. Revisa el detalle.`,
                data,
            };
        case 'cliente_aprueba_recepcion':
            return {
                title: 'Cliente aprobó la recepción ✅',
                body: `${clienteLabel.trim().replace(/^de /, '') || 'El cliente'} confirmó la recepción${numeroLabel}. Avanza al diagnóstico.`,
                data,
            };
        case 'cliente_aprueba_cotizacion':
            return {
                title: 'Cliente aprobó la cotización 💰',
                body: `${clienteLabel.trim().replace(/^de /, '') || 'El cliente'} aprobó la cotización${numeroLabel}. Inicia la reparación.`,
                data,
            };
        case 'vehiculo_finalizado':
            return {
                title: 'Vehículo finalizado 🏁',
                body: `La recepción${numeroLabel}${clienteLabel} quedó finalizada y lista para entrega.`,
                data,
            };
        case 'factura_emitida':
            return {
                title: 'Factura emitida 🧾',
                body: `Se emitió la factura de la recepción${numeroLabel}${clienteLabel}.`,
                data,
            };
        case 'cliente_aprueba_reporte':
            return {
                title: 'Cliente aprobó el reporte final 📝',
                body: `${clienteLabel.trim().replace(/^de /, '') || 'El cliente'} aprobó el reporte de finalización${numeroLabel}.`,
                data,
            };
    }
}
