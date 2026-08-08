"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || (function () {
    var ownKeys = function(o) {
        ownKeys = Object.getOwnPropertyNames || function (o) {
            var ar = [];
            for (var k in o) if (Object.prototype.hasOwnProperty.call(o, k)) ar[ar.length] = k;
            return ar;
        };
        return ownKeys(o);
    };
    return function (mod) {
        if (mod && mod.__esModule) return mod;
        var result = {};
        if (mod != null) for (var k = ownKeys(mod), i = 0; i < k.length; i++) if (k[i] !== "default") __createBinding(result, mod, k[i]);
        __setModuleDefault(result, mod);
        return result;
    };
})();
Object.defineProperty(exports, "__esModule", { value: true });
exports.onRecepcionPush = void 0;
const functions = __importStar(require("firebase-functions/v1"));
const admin = __importStar(require("firebase-admin"));
const pushEvent_1 = require("./pushEvent");
const MESSAGING_CHUNK_SIZE = 400;
/**
 * Recolecta los tokens de registro FCM de los usuarios que tengan alguno de
 * los roles objetivo de una lista de eventos. Los tokens se consultan desde
 * users/{uid}.fcm_tokens (array de strings).
 */
async function collectTokens(events) {
    const roles = new Set();
    for (const event of events) {
        for (const role of pushEvent_1.EVENT_ROLES[event]) {
            roles.add(role);
        }
    }
    if (roles.size === 0) {
        return [];
    }
    const db = admin.firestore();
    const snapshot = await db
        .collection('users')
        .where('user_role', 'in', (0, pushEvent_1.buildRoleVariants)(Array.from(roles)))
        .select('fcm_tokens')
        .get();
    const tokens = new Set();
    for (const doc of snapshot.docs) {
        const docTokens = doc.get('fcm_tokens');
        if (Array.isArray(docTokens)) {
            for (const token of docTokens) {
                if (typeof token === 'string' && token.length > 0) {
                    tokens.add(token);
                }
            }
        }
    }
    return Array.from(tokens);
}
async function sendMulticast(tokens, payload) {
    const failures = [];
    for (let i = 0; i < tokens.length; i += MESSAGING_CHUNK_SIZE) {
        const chunk = tokens.slice(i, i + MESSAGING_CHUNK_SIZE);
        try {
            const response = await admin
                .messaging()
                .sendEachForMulticast({
                tokens: chunk,
                notification: {
                    title: payload.title,
                    body: payload.body,
                },
                data: payload.data,
            });
            response.responses.forEach((res, index) => {
                if (res.success === false) {
                    failures.push(chunk[index]);
                }
            });
        }
        catch (error) {
            failures.push(...chunk);
        }
    }
    return { success: tokens.length - failures.length, failure: failures.length };
}
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
exports.onRecepcionPush = functions.firestore
    .document('recepciones/{recepcionId}')
    .onWrite(async (change, context) => {
    const before = change.before?.data() ?? null;
    const after = change.after?.data() ?? null;
    const events = (0, pushEvent_1.detectRecepcionEvents)(before, after);
    if (events.length === 0) {
        return;
    }
    const recepcionId = context.params.recepcionId;
    const record = after ?? before;
    const tokens = await collectTokens(events);
    if (tokens.length === 0) {
        functions.logger.log('onRecepcionPush: sin tokens FCM registrados para los eventos', { events, recepcionId });
        return;
    }
    for (const event of events) {
        const payload = (0, pushEvent_1.buildEventPayload)(event, record, recepcionId);
        const result = await sendMulticast(tokens, payload);
        functions.logger.info(`Push ${event} enviado (${result.success}/${result.success + result.failure}).`, {
            recepcionId,
            total: tokens.length,
        });
    }
});
