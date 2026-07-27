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
exports.approveReport = void 0;
const functions = __importStar(require("firebase-functions/v1"));
const admin = __importStar(require("firebase-admin"));
exports.approveReport = functions.https.onCall(async (data) => {
    const { key, survey } = data;
    if (!key || !survey) {
        throw new functions.https.HttpsError('invalid-argument', 'Se requieren key y survey');
    }
    const { rating1, rating2, rating3, comment } = survey;
    if (!rating1 || !rating2 || !rating3) {
        throw new functions.https.HttpsError('invalid-argument', 'Los ratings 1, 2 y 3 son obligatorios');
    }
    const db = admin.firestore();
    const snapshot = await db
        .collection('recepciones')
        .where('report_access_key', '==', key)
        .limit(1)
        .get();
    if (snapshot.empty) {
        throw new functions.https.HttpsError('not-found', 'No se encontró informe con esta clave');
    }
    const doc = snapshot.docs[0];
    await doc.ref.update({
        'Clientecontrolcalidad1': rating1.toString(),
        'Clientecontrolcalidad2': rating2.toString(),
        'Clientecontrolcalidad3': rating3.toString(),
        'Clientecontrolcalidad4': comment || '',
        status: 'Finalizado',
        report_access_key: admin.firestore.FieldValue.delete(),
    });
    return { success: true };
});
