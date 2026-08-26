import * as functions from 'firebase-functions/v1'
import * as admin from 'firebase-admin'

export const approveQuote = functions.https.onCall(async (data) => {
  const { key, documentId } = data

  if (!key) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Se requiere key'
    )
  }

  const db = admin.firestore()
  const snapshot = await db
    .collection('recepciones')
    .where('quote_access_key', '==', key)
    .limit(1)
    .get()

  if (snapshot.empty) {
    throw new functions.https.HttpsError(
      'not-found',
      'No se encontró cotización con esta clave'
    )
  }

  const doc = snapshot.docs[0]

  if (documentId && doc.id !== String(documentId)) {
    throw new functions.https.HttpsError(
      'not-found',
      'La clave no corresponde a esta cotización'
    )
  }

  const docData = doc.data()

  if (
    docData.aprobacionCotizacion === true ||
    docData.aprobacion_cotizacion === true
  ) {
    throw new functions.https.HttpsError(
      'already-exists',
      'Esta cotización ya fue aprobada anteriormente'
    )
  }

  await doc.ref.update({
    aprobacionCotizacion: true,
    aprobacion_cotizacion: true,
    // Etapa 06 -> 07 del Excel, no 06 -> 08.
    //
    // Que el cliente apruebe no pone el coche en el elevador: falta que el jefe de taller le
    // asigne tecnico, bahia y fecha. Antes esto escribia 'Reparación' directamente, con lo
    // que una orden recien aprobada y otra ya en curso eran indistinguibles — y no habia
    // ninguna lista de «esto esta aprobado y sin asignar», que es donde se pierden los dias.
    status: 'Programado',
    aprobadaAt: admin.firestore.FieldValue.serverTimestamp(),
    quote_access_key: admin.firestore.FieldValue.delete(),
  })

  return { success: true }
})
