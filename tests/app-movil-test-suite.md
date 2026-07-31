# Suite de Pruebas — Módulo App Móvil GMParts

## Convenciones
- **PASS** / **FAIL** / **BLOCKED**
- Ejecutar en **modo release** (no debug)
- Limpiar datos de prueba entre escenarios

---

## RN1: Tiempo estimado de trabajo siempre en horas

### RN1.1 Label del campo "Tiempo estimado"
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario crea/edita una falla en `CrearfallaNUEVOWidget` |
| **When** | Usuario visualiza el formulario |
| **Then** | La etiqueta del campo debe decir `"Tiempo estimado (horas)"` |
| **Then** | El mensaje del validador debe decir `"Ingresa el tiempo estimado en horas"` |

### RN1.2 Entrada solo numérica
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en campo "Tiempo estimado (horas)" |
| **When** | Usuario intenta escribir letras o símbolos (`abc`, `10 días`, `5 hrs`) |
| **Then** | El campo NO debe aceptar caracteres no numéricos |
| **Then** | Solo se permiten dígitos (`0-9`) |

### RN1.3 Cálculo correcto con horas
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario crea falla con servicio de precio S/100 y Tiempo estimado = `10` |
| **When** | Se guarda la falla |
| **Then** | `Mano_de_obra` en Firestore debe ser `1000` (10 × 100) |
| **Then** | `precioservicio` en Firestore debe ser `100` |
| **Then** | El resumen en `CrearCotizacionFuncionandoWidget` debe mostrar "S/ 1,000.00" como precio del servicio |

### RN1.4 PDF refleja horas
| Ítem | Descripción |
|------|-------------|
| **Given** | Cotización generada con falla que tiene Tiempo estimado = `10` y precio servicio = S/100 |
| **When** | Se genera el PDF |
| **Then** | En la tabla de ítems debe aparecer una fila con: |
| | - Descripción = nombre de la falla |
| | - Unidad = "HRS" |
| | - Cantidad = `10` |
| | - Precio = `100.00` |
| | - Total = `1,000.00` |

---

## RN4: PDF Cotización — Datos completos de cliente, vehículo y fotos

### RN4.1 Datos de cliente leídos desde Firestore
| Ítem | Descripción |
|------|-------------|
| **Given** | Se genera PDF de cotización para una recepción existente |
| **When** | Se ejecuta `generarCotizacionPDF` |
| **Then** | El PDF debe leer cliente, vehículo desde Firestore usando `recepcionRef` (no solo parámetros) |
| **Then** | Debe incluir: nombre/Razon social, RUC/DNI, teléfono, email, dirección del cliente |
| **Then** | Debe incluir: placa, marca, modelo, color, combustible, kilometraje, año del vehículo |

### RN4.2 Fotos de recepción en PDF
| Ítem | Descripción |
|------|-------------|
| **Given** | Recepción tiene fotos adjuntas (campo `fotos` en `recepciones`) |
| **When** | Se genera el PDF de cotización |
| **Then** | El PDF debe incluir una sección "Fotos de recepción" con las imágenes |

### RN4.3 Fotos de fallas en PDF
| Ítem | Descripción |
|------|-------------|
| **Given** | Diagnósticos tienen fotos adjuntas (campo `Fotos` en cada `diagnostico`) |
| **When** | Se genera el PDF de cotización |
| **Then** | El PDF debe incluir las fotos de cada falla junto a su descripción |

### RN4.4 Nombre correcto de fallas
| Ítem | Descripción |
|------|-------------|
| **Given** | Falla creada con nombre específico (ej. "Falla motor") y servicio seleccionado (ej. "Cambio aceite") |
| **When** | Se genera el PDF |
| **Then** | El campo `Nombre_falla` en el PDF debe mostrar el nombre de la FALLA, no el nombre del servicio |
| **Then** | El campo `Solucion` debe mostrar el servicio asociado |

---

## RN5: Enlace de recepción (Vercel) — Datos completos

### RN5.1 Página `/recepcion` muestra datos completos
| Ítem | Descripción |
|------|-------------|
| **Given** | Cliente abre enlace de recepción (`/recepcion?key=xxx`) |
| **Then** | Debe mostrar: nombre/RUC del cliente, teléfono, email |
| **Then** | Debe mostrar: placa, marca, modelo, año del vehículo |
| **Then** | Debe mostrar: fotos de recepción (campo `fotos`) |
| **Then** | Debe mostrar: motivo de ingreso, kilometraje |

### RN5.2 Página `/cotizacion` muestra datos completos
| Ítem | Descripción |
|------|-------------|
| **Given** | Cliente abre enlace de cotización (`/cotizacion?key=xxx`) |
| **Then** | Debe mostrar: datos del cliente, datos del vehículo |
| **Then** | Debe mostrar: fotos de recepción + fotos de fallas |
| **Then** | Debe mostrar: detalle de servicios con precios, repuestos, subtotal, IGV, total |

### RN5.3 Página `/conformidad` muestra resumen completo
| Ítem | Descripción |
|------|-------------|
| **Given** | Cliente abre enlace de conformidad (`/conformidad?key=xxx`) |
| **Then** | Debe mostrar: resumen completo con datos de cliente, vehículo |
| **Then** | Debe mostrar: fotos de recepción + fotos de fallas |
| **Then** | Debe mostrar: detalle de servicios realizados, repuestos utilizados |
| **Then** | Debe mostrar: totales y estado final |

---

## RN2: App no debe permitir aprobar cotización con datos incompletos del cliente

> **NOTA:** Esta validación ocurre en el web app de Vercel (`gmparts-aprobaciones.vercel.app`), no en la app móvil. La app móvil solo genera/envía el enlace. Se incluye para trazar el requisito completo.

### RN2.1 Enlace generado correctamente
| Ítem | Descripción |
|------|-------------|
| **Given** | Asesor en pantalla "Control de calidad" con orden lista para entrega |
| **When** | Presiona "Está listo para entregar" |
| **Then** | Se llama a `generateLink(id, 'report')` |
| **Then** | Se abre el modal `EnvioclienteWidget` con el enlace generado |
| **Then** | El enlace tiene formato `https://gmparts-aprobaciones.vercel.app/conformidad?key=<uuid>` |

### RN2.2 Enlace shareable
| Ítem | Descripción |
|------|-------------|
| **Given** | Modal "Enviar detalle al cliente" abierto |
| **Then** | Los botones WhatsApp, Email y Copiar deben estar visibles y funcionales |

---

## RN3: Toda recepción creada desde app debe quedar visible como OT en estado "Recepción"

### RN3.1 Creación de recepción rápida — Happy path
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario logueado como administrador/técnico |
| **When** | Completa Recepción Rápida: selecciona cliente Natural, ingresa placa (vehículo existente), llena kilometraje, motivo de ingreso, y guarda |
| **Then** | Se crea documento en colección `recepciones` |
| **Then** | El campo `status` debe ser `"Recepción"` |
| **Then** | El campo `numeroorden` debe tener un valor numérico único |
| **Then** | El documento debe ser visible consultando desde Web Admin (misma BD) |

### RN3.2 Campos obligatorios en Recepción Rápida
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario intenta guardar recepción sin completar campos |
| **When** | Presiona el botón guardar |
| **Then** | Los siguientes campos deben mostrar error de validación: |
| | - Selección de cliente (tipo persona + nombre) |
| | - Placa del vehículo |
| | - Kilometraje de ingreso |
| | - Motivo de ingreso |
| **Then** | No se debe crear el documento en Firestore |

### RN3.3 Autocompletado al seleccionar cliente
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en Recepción Rápida |
| **When** | Selecciona un cliente existente (Natural o Jurídico) |
| **Then** | El campo de correo electrónico debe autocompletarse con el email del cliente |
| **Then** | El campo de teléfono debe autocompletarse |
| **Then** | El DNI/RUC debe autocompletarse |

### RN3.4 Autocompletado al seleccionar vehículo
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario seleccionó un cliente que tiene vehículos registrados |
| **When** | Selecciona una placa del dropdown de vehículos |
| **Then** | La marca debe autocompletarse (campo readonly) |
| **Then** | El modelo debe autocompletarse (campo readonly) |
| **Then** | Los dropdowns de marca y modelo deben mostrar SOLO valores asociados al vehículo |

### RN3.5 Edición de recepción existente
| Ítem | Descripción |
|------|-------------|
| **Given** | Recepción existente en estado "Recepción" |
| **When** | Usuario abre y edita la recepción |
| **Then** | Los campos deben precargarse con los valores existentes |
| **When** | Usuario modifica motivo de ingreso y guarda |
| **Then** | El documento en Firestore debe reflejar los cambios |
| **Then** | El `status` NO debe modificarse (debe seguir siendo "Recepción") |

---

## Flujo completo: Recepción → Diagnóstico → Cotización → Aprobación → Encuesta

### FC1 Registro de recepción
| Paso | Acción | Resultado esperado |
|------|--------|-------------------|
| 1 | Seleccionar cliente Natural | Email, teléfono, DNI autocompletados |
| 2 | Seleccionar vehículo por placa | Marca, modelo autocompletados |
| 3 | Ingresar kilometraje, motivo | Campos aceptan valores |
| 4 | Guardar | Documento creado con status "Recepción" |

### FC2 Diagnóstico y cotización
| Paso | Acción | Resultado esperado |
|------|--------|-------------------|
| 1 | Desde listado de recepciones, abrir la OT creada | Navega a dashboard |
| 2 | Agregar diagnóstico con servicio | Servicio visible en dropdown (sin límite de items) |
| 3 | Ingresar "Tiempo estimado (horas)" = `10` | Solo números aceptados |
| 4 | Agregar repuestos | Repuestos seleccionables y agregados |
| 5 | Guardar falla | Falla guardada con `manoDeObra` calculado |
| 6 | Ir a "Crear cotización" | Resumen muestra servicio con precio |
| 7 | Generar PDF | PDF incluye ítem de servicio con precio, total, fotos de recepción y fallas |

### FC3 Aprobación y encuesta (vía enlace web)
| Paso | Acción | Resultado esperado |
|------|--------|-------------------|
| 1 | Asesor da "Está listo para entregar" | Enlace generado |
| 2 | Asesor envía enlace al cliente | Modal de envío funcional |
| 3 | Cliente abre enlace `/recepcion` | Ve datos + fotos de recepción |
| 4 | Cliente navega a cotización | Ve datos + fotos + precios |
| 5 | Cliente da "Conforme" | Status cambia a "Reparación" |
| 6 | Cliente ve `/conformidad` | Ve resumen completo con todas las fotos |
| 7 | Cliente llena encuesta (3 preguntas + comentario) | Campos guardados en Firestore |
| 8 | Cliente envía | Status cambia a "Finalizado" |
| 9 | Admin abre detalle de la OT finalizada | Feedback del cliente visible |

---

## Pruebas de regresión

### REG1 Avatar de usuario
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario sin foto de perfil |
| **When** | Navega por todas las pantallas de recepción |
| **Then** | El avatar debe mostrar la inicial del nombre en círculo rojo (#E94560) |

### REG2 Vehículos del cliente visible al seleccionar
| Ítem | Descripción |
|------|-------------|
| **Given** | Cliente con vehículos asociados en Firestore |
| **When** | Se selecciona el cliente en Recepción Rápida |
| **Then** | El dropdown de vehículos debe mostrar todos los vehículos del cliente |

### REG3 Servicios visibles en dropdown
| Ítem | Descripción |
|------|-------------|
| **Given** | Servicios existentes en colección `service` |
| **When** | Usuario abre dropdown de servicios al crear falla |
| **Then** | Todos los servicios deben aparecer (sin límite de resultados) |

---

## Matriz de resultados

| # | Prueba | Dispositivo | Resultado | Observaciones |
|---|--------|-------------|-----------|---------------|
| RN1.1 | | | | |
| RN1.2 | | | | |
| RN1.3 | | | | |
| RN1.4 | | | | |
| RN2.1 | | | | |
| RN2.2 | | | | |
| RN3.1 | | | | |
| RN3.2 | | | | |
| RN3.3 | | | | |
| RN3.4 | | | | |
| RN3.5 | | | | |
| RN4.1 | | | | |
| RN4.2 | | | | |
| RN4.3 | | | | |
| RN4.4 | | | | |
| RN5.1 | | | | |
| RN5.2 | | | | |
| RN5.3 | | | | |
| FC1 | | | | |
| FC2 | | | | |
| FC3 | | | | |
| REG1 | | | | |
| REG2 | | | | |
| REG3 | | | | |
