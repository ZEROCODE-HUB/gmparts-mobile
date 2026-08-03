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
exports.generateLink = void 0;
const functions = __importStar(require("firebase-functions/v1"));
const admin = __importStar(require("firebase-admin"));
const crypto_1 = require("crypto");
const WEB_CLIENT_URL = process.env.WEB_CLIENT_URL || 'https://gmparts-aprobaciones.vercel.app';
exports.generateLink = functions.https.onCall(async (data) => {
    const { receptionId, purpose } = data;
    if (!receptionId || !purpose) {
        throw new functions.https.HttpsError('invalid-argument', 'Se requieren receptionId y purpose');
    }
    if (purpose !== 'quote' && purpose !== 'report' && purpose !== 'reception') {
        throw new functions.https.HttpsError('invalid-argument', 'purpose debe ser "quote", "report" o "reception"');
    }
    const db = admin.firestore();
    const recepcionesRef = db.collection('recepciones');
    let doc;
    for (let attempt = 0; attempt < 5; attempt++) {
        const snapshot = await recepcionesRef
            .where('numeroorden', '==', Number(receptionId))
            .limit(1)
            .get();
        if (!snapshot.empty) {
            doc = snapshot.docs[0];
            break;
        }
        await new Promise((resolve) => setTimeout(resolve, 300));
    }
    if (!doc) {
        throw new functions.https.HttpsError('not-found', `No se encontró recepción con numeroorden ${receptionId}`);
    }
    const key = (0, crypto_1.randomUUID)();
    const fieldName = `${purpose}_access_key`;
    await doc.ref.update({
        [fieldName]: key,
    });
    let path;
    switch (purpose) {
        case 'quote':
            path = 'cotizacion';
            break;
        case 'report':
            path = 'conformidad';
            break;
        case 'reception':
            path = 'recepcion';
            break;
        default:
            path = 'recepcion';
    }
    const url = `${WEB_CLIENT_URL}/${path}?key=${key}`;
    return { url };
});
