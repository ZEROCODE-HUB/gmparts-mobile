# Mejoras pendientes — GMParts

Documento de seguimiento de mejoras técnicas detectadas como pendientes.
Se ejecutan por separado, cuando el cliente termine sus pruebas en curso.

## 1. Actualizar dependencias del backend (firebase-admin + firebase-functions)

- **Estado:** pendiente (bloqueado por pruebas activas del cliente)
- **Output:** 2 alertas moderate de Dependabot sin riesgo explotable hoy

### Causa
Toda la cadena depende de `firebase-admin@12.7.0`, cuyo árbol arrastra:

- `uuid` < 11.1.1 (buffer overflow, CVSS 7.5 — solo explotable v3/v5/v6, no usado aquí)
- `@google-cloud/firestore` 7.6–7.11.6
- `@google-cloud/storage`, `retry-request`, `teeny-request`, `gaxios`, `google-gax`

### Cambio propuesto (cuando se ejecute)
En `firebase/function-source/package.json`:

- `firebase-admin`: `^12.7.0` → `^14.2.0`
- `firebase-functions`: `^6.1.0` → `^7.3.2` (única que acepta admin v14 como peer)
- `engines.node`: `"20"` → `"22"`

### Riesgos evaluados
| Aspecto | Impacto |
|---|---|
| Código de funciones (admin.* / functions/v1) | Bajo — API estable, sin cambios en el surface usado |
| Generación de PDF (cliente Flutter) | Cero — no vive en Cloud Functions |
| Deploy en vivo | El riesgo real: redebles las 7 funciones en producción |
| Node 22 | Firebase Functions lo soporta (18/20/22); alinear CI/CD si usa Node 20 |

### Verificación antes de desplegar
- `npm install`
- `npm run build` (TypeScript)
- `npm test` (suites de `pushEvent.test.cjs`)
- `firebase emulators:start` local

### Criterio de cierre
- Build + tests verdes
- Cliente terminó sus pruebas de producción
- Alinear cualquier pipeline de deploy a Node 22

---

_Registrado: 2026-08-08_