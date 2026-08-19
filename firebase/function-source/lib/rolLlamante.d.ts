import * as functions from 'firebase-functions/v1';
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
export declare function rolDelLlamante(context: functions.https.CallableContext): Promise<string>;
/**
 * Exige que quien llama sea personal del taller con sesión iniciada.
 *
 * Se excluye el acceso anónimo a propósito: el proveedor anónimo existe como andamiaje de
 * FlutterFlow, y sin esta comprobación bastaría una sesión anónima creada desde el
 * navegador para pasar por autenticado.
 */
export declare function exigirPersonal(context: functions.https.CallableContext): Promise<string>;
