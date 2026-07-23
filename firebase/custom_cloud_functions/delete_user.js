const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.deleteUser = functions.https.onCall(async (data, context) => {
  const email = data.email;

  // Write your code below!

  try {
    // 1. Verificar que el usuario esté autenticado
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "El usuario debe estar autenticado para realizar esta acción",
      );
    }

    // 2. Validar que se proporcionó un email
    if (!email) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "El email es requerido",
      );
    }

    // 3. Cualquier usuario autenticado puede eliminar otros usuarios

    // 4. Buscar el usuario por email
    let userToDelete;
    try {
      userToDelete = await admin.auth().getUserByEmail(email);
    } catch (error) {
      throw new functions.https.HttpsError(
        "not-found",
        "Usuario no encontrado en Firebase Auth",
      );
    }

    const uid = userToDelete.uid;

    // 5. Eliminar documento del usuario en Firestore (si existe)
    try {
      await admin.firestore().collection("users").doc(uid).delete();
      console.log(`Documento de Firestore eliminado para UID: ${uid}`);
    } catch (firestoreError) {
      console.log(`No se encontró documento en Firestore para UID: ${uid}`);
    }

    // 6. Eliminar usuario de Firebase Auth
    await admin.auth().deleteUser(uid);

    console.log(`Usuario eliminado exitosamente: ${email} (UID: ${uid})`);

    // 7. Retornar respuesta exitosa
    return {
      success: true,
      message: "Usuario eliminado correctamente",
      deletedEmail: email,
      deletedUid: uid,
      timestamp: admin.firestore.FieldValue.serverTimestamp(),
    };
  } catch (error) {
    console.error("Error al eliminar usuario:", error);

    // Si ya es un HttpsError, re-lanzarlo
    if (error instanceof functions.https.HttpsError) {
      throw error;
    }

    // Para otros errores, crear un HttpsError genérico
    throw new functions.https.HttpsError(
      "internal",
      `Error interno: ${error.message}`,
    );
  }

  // Write your code above!
});
