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
exports.rolDelLlamante = rolDelLlamante;
exports.exigirPersonal = exigirPersonal;
const functions = __importStar(require("firebase-functions/v1"));
const admin = __importStar(require("firebase-admin"));
/**
 * Resolución del rol de quien llama, en el mismo orden que usan las reglas de Firestore
 * y las funciones del panel admin:
 *   1. custom claim `role` del token de Auth,
 *   2. documento users/{uid},
 *   3. búsqueda por correo.
 *
 * El tercer paso no es paranoia: de los 15 usuarios de esta base, 2 tienen el documento
 * con ID autogenerado en vez de su uid de Auth, así que buscar solo por uid los deja fuera.
 */
async function rolDelLlamante(context) {
    const claim = context.auth?.token?.role;
    if (typeof claim === 'string' && claim)
        return claim;
    const uid = context.auth?.uid;
    const db = admin.firestore();
    if (uid) {
        const snap = await db.collection('users').doc(uid).get();
        const rol = snap.exists ? snap.get('user_role') : undefined;
        if (typeof rol === 'string' && rol)
            return rol;
    }
    const email = context.auth?.token?.email;
    if (typeof email === 'string' && email) {
        const porCorreo = await db
            .collection('users')
            .where('email', '==', email)
            .limit(1)
            .get();
        if (!porCorreo.empty) {
            const rol = porCorreo.docs[0].get('user_role');
            if (typeof rol === 'string' && rol)
                return rol;
        }
    }
    return '';
}
/**
 * Personal del taller. Se incluyen 'Admin' y 'Encargado' por compatibilidad con los
 * valores heredados que aún viven en Firestore, igual que hace EVENT_ROLES en pushEvent.
 */
const ROLES_PERSONAL = [
    'Administrador',
    'Admin',
    'Gerente General',
    'Jefe de Taller',
    'Encargado',
    'Asesor Servicio',
    'Asesor Repuesto',
    'Tecnico Mecanico',
];
/**
 * Exige que quien llama sea personal del taller con sesión iniciada.
 *
 * Se excluye el acceso anónimo a propósito: el proveedor anónimo existe como andamiaje de
 * FlutterFlow, y sin esta comprobación bastaría una sesión anónima creada desde el
 * navegador para pasar por autenticado.
 */
async function exigirPersonal(context) {
    if (!context.auth || context.auth.token?.firebase?.sign_in_provider === 'anonymous') {
        throw new functions.https.HttpsError('unauthenticated', 'Debe iniciar sesión.');
    }
    const rol = await rolDelLlamante(context);
    if (!ROLES_PERSONAL.includes(rol)) {
        throw new functions.https.HttpsError('permission-denied', 'Solo el personal del taller puede realizar esta operación.');
    }
    return rol;
}
