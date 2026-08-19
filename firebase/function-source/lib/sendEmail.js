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
exports.sendEmail = void 0;
const functions = __importStar(require("firebase-functions/v1"));
const rolLlamante_1 = require("./rolLlamante");
const resend_1 = require("resend");
const RESEND_API_KEY = process.env.RESEND_API_KEY;
const FROM_EMAIL = process.env.FROM_EMAIL || 'notificaciones@gmparts.pe';
function buildEmailHtml({ subject, body, url }) {
    return `
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      margin: 0;
      padding: 0;
      background-color: #1A1A2E;
      font-family: 'Inter', Arial, sans-serif;
    }
    .container {
      max-width: 600px;
      margin: 0 auto;
      padding: 32px 24px;
    }
    .header {
      text-align: center;
      margin-bottom: 32px;
    }
    .logo {
      width: 64px;
      height: 64px;
      background-color: #E94560;
      border-radius: 16px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      font-size: 28px;
      font-weight: bold;
      color: #FFFFFF;
    }
    .title {
      color: #FFFFFF;
      font-size: 22px;
      font-weight: bold;
      margin: 16px 0 8px;
    }
    .body-text {
      color: #A0A0B0;
      font-size: 15px;
      line-height: 1.6;
      margin-bottom: 24px;
    }
    .button {
      display: inline-block;
      background-color: #E94560;
      color: #FFFFFF;
      text-decoration: none;
      padding: 14px 32px;
      border-radius: 12px;
      font-size: 15px;
      font-weight: 600;
    }
    .footer {
      margin-top: 32px;
      padding-top: 24px;
      border-top: 1px solid #2A2A4A;
      text-align: center;
      color: #A0A0B0;
      font-size: 12px;
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <div class="logo">G</div>
      <h1 class="title">${subject}</h1>
    </div>
    <p class="body-text">${body}</p>
    <div style="text-align: center; margin-bottom: 32px;">
      <a href="${url}" class="button">Ir a GM Parts</a>
    </div>
    <div class="footer">
      <p>GM Parts - Taller Mecánico</p>
      <p>Si tienes problemas con el botón, copia y pega este enlace en tu navegador:</p>
      <p style="word-break: break-all; color: #E94560; font-size: 12px;">${url}</p>
    </div>
  </div>
</body>
</html>`;
}
exports.sendEmail = functions.https.onCall(async (data, context) => {
    // Sin esta comprobación la función era un relé de correo abierto: cualquiera que
    // conociera el ID del proyecto podía enviar correos con asunto, cuerpo y enlace
    // arbitrarios desde notificaciones@gmparts.pe. Es decir, phishing firmado con el dominio
    // y la reputación de GM Parts. Verificado llamándola sin credenciales: respondía
    // «Se requieren to, subject y url», o sea que entraba al cuerpo de la función.
    //
    // No rompe nada: el único llamador previsto es la app móvil, que va autenticada. El
    // micrositio de aprobaciones no usa esta función (sus enlaces son UUID sin login).
    //
    // Se exige además que sea personal del taller: con solo `context.auth` bastaba una de
    // las 11 cuentas de cliente —o una sesión anónima— para seguir enviando correos
    // arbitrarios desde el dominio.
    await (0, rolLlamante_1.exigirPersonal)(context);
    const { to, subject, body, url } = data;
    if (!to || !subject || !url) {
        throw new functions.https.HttpsError('invalid-argument', 'Se requieren to, subject y url');
    }
    if (!RESEND_API_KEY) {
        throw new functions.https.HttpsError('failed-precondition', 'RESEND_API_KEY no está configurada');
    }
    const resend = new resend_1.Resend(RESEND_API_KEY);
    const html = buildEmailHtml({ subject, body, url });
    try {
        await resend.emails.send({
            from: FROM_EMAIL,
            to,
            subject,
            html,
        });
        return { success: true };
    }
    catch (error) {
        throw new functions.https.HttpsError('internal', 'Error al enviar el email');
    }
});
