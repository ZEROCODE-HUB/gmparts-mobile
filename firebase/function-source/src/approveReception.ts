import * as functions from 'firebase-functions/v1'
import * as admin from 'firebase-admin'

export const approveReception = functions.https.onCall(async (data) => {
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
    .where('reception_access_key', '==', key)
    .limit(1)
    .get()

  if (snapshot.empty) {
    throw new functions.https.HttpsError(
      'not-found',
      'No se encontró recepción con esta clave'
    )
  }

  const doc = snapshot.docs[0]

  if (documentId && doc.id !== String(documentId)) {
    throw new functions.https.HttpsError(
      'not-found',
      'La clave no corresponde a esta recepción'
    )
  }

  const docData = doc.data()

  if (docData.aprobacionCliente === true) {
    throw new functions.https.HttpsError(
      'already-exists',
      'Esta recepción ya fue aprobada anteriormente'
    )
  }

  await doc.ref.update({
    aprobacionCliente: true,
    status: 'Diagnóstico',
    reception_access_key: admin.firestore.FieldValue.delete(),
  })

  return { success: true }
})
