# PROMPT DELTA — Solo cambios pendientes en web-admin

> ✅ Los puntos 1 (tipo_de_persona) ya fueron migrados en Firestore.
> Este prompt contiene solo lo que FALTA por implementar.

---

### A. `Propietario` como DocumentReference en Vehículos

**Archivo:** `src/pages/almacen/VehiculoForm.jsx`

Al guardar un vehículo, además de `Propietario_name` y `Propietario_Document` (strings), **también guardar `Propietario` como Firestore DocumentReference** apuntando al documento del cliente.

Agregar en `handleSubmit`:
```jsx
const clienteSel = clientesOpts.find(c => c.nombre === form.Propietario_name);
if (clienteSel?.id) {
  formData.Propietario = doc(db, "users", clienteSel.id);
}
```

---

### B. Status — Eliminar "Completado" y "Aprobado"

| Archivo | Cambio |
|---------|--------|
| `OrdenTrabajoList.jsx` | Quitar de filtros y colores |
| `OrdenTrabajoEditor.jsx` | Quitar opciones de status |
| `CotizacionServicioList.jsx` | Quitar de filtros |
| `Dashboard.jsx` | Quitar de cards |
| `pdfGenerator.js:1174` | Dejar solo: `status === 'reparación' \|\| status === 'finalizado'` |

---

### C. `tecnico_servicio` — Unificar nombre de campo

| Archivo | Cambio |
|---------|--------|
| `OrdenTrabajoEditor.jsx` | Guardar: `tecnico_servicio`. Leer: `data.tecnico_servicio ?? data.tecnico ?? ''` |
| `OrdenTrabajoList.jsx` | Columna: `data.tecnico_servicio ?? data.tecnico` |

---

### D. `Observaciones_adicionales` — Fallback en lectura

| Archivo | Cambio |
|---------|--------|
| `pdfGenerator.js:1261` | `observaciones: data.Observaciones_adicionales \|\| data.observacion \|\| data.motivo \|\| data.observaciones \|\| ''` |
| `OrdenTrabajoEditor.jsx` | Leer: `data.Observaciones_adicionales ?? data.observaciones ?? ''` |
