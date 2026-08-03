import * as functions from 'firebase-functions/v1'
import * as admin from 'firebase-admin'
import { randomUUID } from 'crypto'

const WEB_CLIENT_URL = process.env.WEB_CLIENT_URL || 'https://gmparts-aprobaciones.vercel.app'

export const generateLink = functions.https.onCall(async (data) => {
  const { receptionId, purpose } = data

  if (!receptionId || !purpose) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Se requieren receptionId y purpose'
    )
  }

  if (purpose !== 'quote' && purpose !== 'report' && purpose !== 'reception') {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'purpose debe ser "quote", "report" o "reception"'
    )
  }

  const db = admin.firestore()
  const recepcionesRef = db.collection('recepciones')

  let doc: admin.firestore.DocumentSnapshot | undefined
  for (let attempt = 0; attempt < 5; attempt++) {
    const snapshot = await recepcionesRef
      .where('numeroorden', '==', Number(receptionId))
      .limit(1)
      .get()
    if (!snapshot.empty) {
      doc = snapshot.docs[0]
      break
    }
    await new Promise((resolve) => setTimeout(resolve, 300))
  }

  if (!doc) {
    throw new functions.https.HttpsError(
      'not-found',
      `No se encontró recepción con numeroorden ${receptionId}`
    )
  }

  const key = randomUUID()
  const fieldName = `${purpose}_access_key`

  await doc.ref.update({
    [fieldName]: key,
  })

  let path: string
  switch (purpose) {
    case 'quote':
      path = 'cotizacion'
      break
    case 'report':
      path = 'conformidad'
      break
    case 'reception':
      path = 'recepcion'
      break
    default:
      path = 'recepcion'
  }
  const url = `${WEB_CLIENT_URL}/${path}?key=${key}`

  return { url }
})
