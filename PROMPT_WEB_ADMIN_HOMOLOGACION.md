# Prompt para homologar web-admin con app móvil

## Cambios requeridos en gmparts-admin-web

---

### 0. `Propietario` en Vehículos — Guardar también como DocumentReference

**Archivo:** `src/pages/almacen/VehiculoForm.jsx`

Al guardar un vehículo, además de `Propietario_name` y `Propietario_Document` (strings), **también guardar `Propietario` como Firestore DocumentReference** apuntando al documento del cliente en `users/{uid}`.

Actualmente solo se guardan strings. Se necesita agregar:

```jsx
// En handleSubmit o en el onChange del selector de propietario:
// 1. Obtener el id/reference del cliente seleccionado
const clienteSel = clientesOpts.find(c => c.nombre === form.Propietario_name);
if (clienteSel?.id) {
  formData.Propietario = doc(db, "users", clienteSel.id);
}
```

Esto asegura que los vehículos creados por el web-admin también sean encontrados por la app móvil cuando consulta por `Propietario` (DocumentReference).

---

### 1. `tipo_de_persona` — Valores: "Persona"/"Empresa" → "Natural"/"Jurídica"

**Buscar y reemplazar en TODOS los archivos de `src/`:**

| Valor actual | Nuevo valor |
|---|---|
| `"Persona"` | `"Natural"` |
| `"Empresa"` | `"Jurídica"` |

**Archivos a modificar:**
- `src/pages/almacen/ClientesList.jsx` — formulario creación/edición, tabla, seed data, filtros
- `src/pages/ventas/servicios/ServicioEditor.jsx` — selector de cliente
- `src/pages/ventas/servicios/OrdenTrabajoEditor.jsx` — selector de cliente
- `src/pages/ventas/documents/DocumentEditor.jsx` — selector de cliente
- `src/pages/almacen/VehiculoForm.jsx` — campo `Propietario_Type` (mismos valores)
- `src/mock/` — cualquier seed data con estos valores
- Cualquier otro archivo que use `"Persona"`/`"Empresa"` como valor

**Reglas:**
- El cambio es en el VALOR guardado en Firestore, no solo en etiquetas visuales
- Tanto `tipo_de_persona` como `Propietario_Type` deben usar los mismos valores
- Donde se lea de Firestore, hacer fallback: `data.tipo_de_persona ?? 'Natural'`

---

### 2. Status de recepciones — Eliminar "Completado" y "Aprobado"

**Reemplazar TODAS las referencias a esos valores.** El flujo correcto es:

```
"Recepción" → "Diagnóstico" → "Cotización" → "Reparación" → "Finalizado"
```

**Archivos a modificar:**

| Archivo | Cambio |
|---------|--------|
| `src/pages/ventas/servicios/OrdenTrabajoList.jsx` | Quitar "Completado"/"Aprobado" de filtros y colores de status |
| `src/pages/ventas/servicios/OrdenTrabajoEditor.jsx` | Quitar opciones de status inválidas |
| `src/pages/ventas/servicios/CotizacionServicioList.jsx` | Quitar de filtros |
| `src/pages/almacen/Dashboard.jsx` | Quitar de cards de resumen |
| `src/lib/pdfGenerator.js` línea 1174 | Cambiar de: `if (status === 'reparación' \|\| status === 'finalizado' \|\| status === 'completado' \|\| status === 'aprobado')` a: `if (status === 'reparación' \|\| status === 'finalizado')` |

---

### 3. `tecnico_servicio` — Unificar nombre de campo

**Firestore:** renombrar campo `tecnico` → `tecnico_servicio` en colección `recepciones`.

**Archivos a modificar:**

| Archivo | Cambio |
|---------|--------|
| `src/pages/ventas/servicios/OrdenTrabajoEditor.jsx` | Al guardar: `tecnico_servicio`. Al leer: `data.tecnico_servicio ?? data.tecnico ?? ''` |
| `src/pages/ventas/servicios/OrdenTrabajoList.jsx` | Columna: `data.tecnico_servicio ?? data.tecnico` |
| `src/lib/pdfGenerator.js` | Revisar si recibe `tecnico` como parámetro y actualizar |

---

### 4. `Observaciones_adicionales` — Web se adapta al nombre de la app

**Firestore:** la app móvil usa `Observaciones_adicionales`. El web-admin usa `observaciones`.

**Archivos a modificar:**

| Archivo | Cambio |
|---------|--------|
| `src/lib/pdfGenerator.js` línea 1261 | Cambiar de: `observaciones: data.observacion \|\| data.motivo \|\| data.observaciones \|\| ''` a: `observaciones: data.Observaciones_adicionales \|\| data.observacion \|\| data.motivo \|\| data.observaciones \|\| ''` |
| `src/pages/ventas/servicios/OrdenTrabajoEditor.jsx` | Al leer: `data.Observaciones_adicionales ?? data.observaciones ?? ''`. Al guardar: `observaciones` (se mantiene, se migrará después) |

---

### 5. Resumen de archivos a modificar

| Archivo | Puntos |
|---------|--------|
| `ClientesList.jsx` | 1 |
| `ServicioEditor.jsx` | 1 |
| `OrdenTrabajoEditor.jsx` | 1, 3, 4 |
| `DocumentEditor.jsx` | 1 |
| `VehiculoForm.jsx` | 1 |
| `OrdenTrabajoList.jsx` | 2, 3 |
| `CotizacionServicioList.jsx` | 2 |
| `Dashboard.jsx` | 2 |
| `pdfGenerator.js` | 2, 4 |
| Seed/mock data | 1 |
