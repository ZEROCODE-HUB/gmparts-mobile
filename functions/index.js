const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.onAprobacionClienteUpdate = functions.firestore
  .document('recepciones/{receptionId}')
  .onUpdate(async (change, context) => {
    const before = change.before.data();
    const after = change.after.data();

    const wasApproved = before?.aprobacionCliente !== true && after?.aprobacionCliente === true;
    const wasQuoteApproved = before?.aprobacion_cotizacion !== true && after?.aprobacion_cotizacion === true;

    if (wasApproved || wasQuoteApproved) {
      const newStatus = 'Reparación';
      if (after?.status !== newStatus) {
        await change.after.ref.update({ status: newStatus });
        functions.logger.info(`Recepción ${context.params.receptionId}: aprobación detectada, status → ${newStatus}`);
      }
    }

    return null;
  });

exports.generateLink = functions.https.onCall((data, context) => {
  const { receptionId, purpose } = data;

  const baseUrl = 'https://gmpartsprueba.flutterflow.app';
  let path;
  switch (purpose) {
    case 'quote':
      path = `/gLinkclienteCotizacion?id=${receptionId}`;
      break;
    case 'report':
      path = `/encuestacliente?id=${receptionId}`;
      break;
    default:
      path = `/gLinkcliente?id=${receptionId}`;
  }

  return { url: `${baseUrl}${path}` };
});
