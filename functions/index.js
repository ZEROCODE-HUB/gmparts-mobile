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
