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
exports.validateKey = void 0;
const functions = __importStar(require("firebase-functions/v1"));
const admin = __importStar(require("firebase-admin"));
exports.validateKey = functions.https.onCall(async (data) => {
    const { key, purpose } = data;
    if (!key || !purpose) {
        throw new functions.https.HttpsError('invalid-argument', 'Se requieren key y purpose');
    }
    if (purpose !== 'quote' && purpose !== 'report' && purpose !== 'reception') {
        throw new functions.https.HttpsError('invalid-argument', 'purpose debe ser "quote", "report" o "reception"');
    }
    const db = admin.firestore();
    const fieldName = `${purpose}_access_key`;
    const snapshot = await db
        .collection('recepciones')
        .where(fieldName, '==', key)
        .limit(1)
        .get();
    if (snapshot.empty) {
        return { valid: false };
    }
    const doc = snapshot.docs[0];
    const docData = doc.data();
    const diagnosticosSnapshot = await doc.ref.collection('diagnosticos').get();
    const diagnosticos = diagnosticosSnapshot.docs.map((d) => {
        const diagData = d.data();
        return {
            nombreFalla: diagData.nombreFalla || '',
            solucion: diagData.solucion || '',
            fotos: diagData.fotos || [],
            repuestos: (diagData.repuestos || []).map((r) => ({
                nombre: r.nombre || '',
                cantidad: r.cantidad || 0,
                precio: r.precio || 0,
                total: r.total || 0,
            })),
            manoDeObra: diagData.manoDeObra || 0,
            aprobacionCliente: diagData.aprobacionCliente || false,
        };
    });
    const recepcionData = {
        id: doc.id,
        numeroorden: docData.numeroorden,
        nombreCliente: docData.nombreCliente || '',
        telefono: docData.telefono || '',
        correoElectronico: docData.correoElectronico || '',
        placa: docData.placa || '',
        marca: docData.marca || '',
        modelo: docData.modelo || '',
        anio: docData.anio || undefined,
        nivelCombustible: docData.nivelCombustible || undefined,
        inventario: docData.inventario || undefined,
        observaciones: docData.observaciones || undefined,
        status: docData.status || '',
        aprobacionCotizacion: docData.aprobacionCotizacion || false,
        subtotal: docData.subtotal || 0,
        igv: docData.igv || 0,
        total: docData.total || 0,
        fechaIngreso: docData.fechaIngreso || undefined,
        fechaSalida: docData.fechaSalida || undefined,
        tecnicoServicio: docData.tecnicoServicio || undefined,
        tipoServicio: docData.tipoServicio || undefined,
        motivoIngreso: docData.motivoIngreso || undefined,
        fotos: docData.fotos || undefined,
        diagnosticos,
    };
    return { valid: true, data: recepcionData };
});
