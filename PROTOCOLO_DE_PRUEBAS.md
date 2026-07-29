# Protocolo de Pruebas - GM Parts Mobile

## Instrucciones generales
- Cada prueba debe ejecutarse en **Android y iOS** (si aplica)
- Marcar cada caso como **PASS** / **FAIL** / **BLOCKED**
- Si una prueba falla, registrar el error en la sección de observaciones
- Limpiar datos de prueba entre cada escenario cuando sea necesario
- Ejecutar en **modo release** (no debug) para descartar errores de hot-reload

---

## 1. Página de reinicio de contraseña

### 1.1 Campo de email sin ocultar
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario está en pantalla "Restaurar Contraseña" (`/restaurarContrasena1`) |
| **When** | Usuario visualiza el campo de correo electrónico |
| **Then** | El texto del email debe ser visible (no oculto con asteriscos) |
| **Then** | NO debe haber un ícono de ojo (visibility toggle) en el campo |
| **Evidencia** | Captura de pantalla del formulario |

### 1.2 Envío de correo - Redirección
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla "Restaurar Contraseña" con email válido ingresado |
| **When** | Usuario presiona "Enviar correo electrónico" |
| **Then** | Se redirige a la pantalla de confirmación "Correo enviado" |
| **Then** | El texto visible debe decir: "Correo enviado. El correo de reinicio de contraseña fue enviado exitosamente a su bandeja" |
| **Evidencia** | Captura de pantalla de la pantalla de confirmación |

### 1.3 Pantalla de confirmación - Scroll
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla de confirmación "Correo enviado" |
| **When** | Usuario hace scroll hacia arriba y abajo |
| **Then** | El texto debe permanecer visible y no desaparecer |
| **Evidencia** | Video corto del scroll |

### 1.4 Botón de retorno a Login
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla de confirmación "Correo enviado" |
| **When** | Usuario presiona el botón "Continuar" |
| **Then** | La app debe redirigir a la pantalla de inicio de sesión (`IniciarSession`) |
| **Evidencia** | Captura de pantalla de la pantalla de login después del clic |

---

## 2. Selección de cliente en recepciones

### 2.1 Recepción Rápida - Filtro Persona Natural

| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario está en pantalla "Recepción Rápida" |
| **When** | Usuario selecciona "Natural" en el campo "Tipo de persona" |
| **Then** | El dropdown "Nombre del cliente" debe listar TODOS los usuarios con `tipo_de_persona = "Natural"` (incluyendo "Cliente 29.07" si existe en BD) |
| **Validación** | Verificar en Firestore que existan usuarios con `tipo_de_persona == "Natural"` y que todos aparezcan |
| **Evidencia** | Lista de usuarios visibles en el dropdown + consulta en Firestore console |

### 2.2 Recepción Completa - Filtro Persona Natural
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario está en pantalla "Recepción Completa" (paso 1) |
| **When** | Usuario selecciona "Natural" en "Tipo de persona" |
| **Then** | El dropdown debe listar todos los usuarios con `tipo_de_persona = "Natural"` |
| **Evidencia** | Captura de pantalla |

### 2.3 Preselección de marca al seleccionar vehículo
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en "Recepción Rápida", selecciona cliente "Jorge Zapata" |
| **When** | Usuario selecciona vehículo con placa "abc987" en el dropdown "Número de placa" |
| **Then** | El campo "Marca" debe preseleccionarse automáticamente con la marca del vehículo abc987 |
| **Then** | El campo "Modelo" debe preseleccionarse automáticamente con el modelo del vehículo abc987 |
| **Then** | El dropdown de modelo debe mostrar SOLO los modelos asociados a la marca preseleccionada |
| **Then** | Los campos marca y modelo deben ser de solo lectura si el vehículo ya tiene esos valores |
| **Validación** | Verificar en Firestore que el vehículo abc987 tenga Marca y Modelo definidos |
| **Evidencia** | Video del flujo completo |

### 2.4 Marca/Modelo - Mismos datos que web-admin
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en creación de vehículo o recepción |
| **When** | Usuario abre el dropdown de marcas de vehículo |
| **Then** | La lista de marcas debe coincidir con la disponible en el proyecto web-admin |
| **Validación** | Consultar la colección `vehicle_marca_brand` en Firestore y comparar con las marcas del web-admin (deberían ser idénticas por ser la misma BD) |
| **Nota** | Si difieren, el problema está en la fuente de datos del web-admin, no en la app móvil |
| **Evidencia** | Lista de marcas en app + consulta Firestore + lista de marcas en web-admin |

---

## 3. Creación de nuevo vehículo

### 3.1 Listado de marcas y modelos
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario abre modal "Nuevo vehículo" (`AgregarVehiculoWidget`) |
| **When** | Usuario abre el dropdown de marcas |
| **Then** | Deben aparecer todas las marcas de la colección `vehicle_marca_brand` |
| **When** | Usuario selecciona una marca |
| **Then** | El dropdown de modelos debe mostrar SOLO los modelos asociados a esa marca (campo `brandname`) |
| **Validación** | Comparar contra consulta directa a Firestore `vehicle_model_modelo.where('brandname', '==', marcaSeleccionada)` |
| **Evidencia** | Capturas de pantalla de ambos dropdowns + consulta Firestore |

---

## 4. Avatar de usuario

### 4.1 Homologación del avatar en todas las pantallas

Para CADA una de las siguientes pantallas, verificar:

| Pantalla | Ruta / Widget |
|----------|---------------|
| Dashboard | `/dashboard` |
| Recepción Rápida | `BNuevarecepcionrapidaFWidget` |
| Recepción Completa | `CNuevaRecepcionCompletaFWidget` |
| Listado de Recepciones | `ARecepcionesInicioWidget` |
| Cotización Funcionando | `CotizacionFuncionandoWidget` |
| Crear Cotización Funcionando | `CrearCotizacionFuncionandoWidget` |
| Dashboard Diagnóstico | `BDashBoardDiagnosticoWidget` |
| Dashboard a Finalizar | `CDashBoard2FinalizarWidget` |
| Dashboard Finalizado | `CDashBoard2FinalizadoWidget` |
| Detalle Estático | `BDetalleestaticoWidget` |
| Control de Calidad Técnico | `Controldecalidadtecnico2Widget` |
| DashBoard2 Copy | `DashBoard2CopyCopyWidget` |
| Crear Cotizacion Funcionando Copy | `CrearCotizacionFuncionandoCopyWidget` |
| Nueva Recepción Rápida (SA) | `INuevarecrapidaWidget` |
| Cuenta | `ACuentaWidget` |

**Prueba por pantalla:**
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario logueado con foto de perfil |
| **When** | Usuario visualiza su avatar en la esquina superior derecha |
| **Then** | Debe mostrar la foto de perfil del usuario (si tiene) |
| **When** | Usuario logueado SIN foto de perfil |
| **Then** | Debe mostrar la primera letra del nombre en un círculo rojo (color primario `#E94560`) |
| **Evidencia** | Captura de cada pantalla con y sin foto de perfil |

**Casos borde:**
| Ítem | Descripción |
|------|-------------|
| Usuario con display_name vacío | Debe mostrar "?" en el círculo |
| Usuario con foto pero URL inválida | Debe fallback a la inicial del nombre |
| Usuario con nombre compuesto (ej: "Juan Pérez") | Debe mostrar "J" (primera letra del primer nombre) |

---

## 5. Listado de recepciones - Etiqueta de estado

### 5.1 Etiquetas de estado correctas
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla "Recepciones v1" (`ARecepcionesInicioWidget`) |
| **When** | Usuario visualiza la lista de recepciones |
| **Then** | CADA ítem debe mostrar una etiqueta con su estado REAL: "Recepción", "Diagnóstico", "Cotización", "Reparación" o "Finalizado" |
| **Then** | El color de la etiqueta debe corresponder al estado (ej: verde para Finalizado, rojo para Recepción) |
| **Validación** | Verificar contra el campo `status` en Firestore para cada recepción mostrada |
| **Evidencia** | Captura de pantalla con al menos una recepción de cada estado visible |

### 5.2 Filtro por estado
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en "Recepciones v1" |
| **When** | Usuario selecciona "Diagnóstico" en el filtro |
| **Then** | Solo deben aparecer recepciones con status "Diagnóstico" |
| **When** | Usuario selecciona "Finalizado" |
| **Then** | Solo deben aparecer recepciones con status "Finalizado" |
| **Evidencia** | Capturas de pantalla para cada filtro |

---

## 6. Dropdown de servicios en cotización

### 6.1 Servicio "2907ServicioTest" visible
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario está creando una falla en una cotización |
| **When** | Usuario abre el dropdown "Tipo de servicio" |
| **Then** | El servicio "2907ServicioTest" debe aparecer en la lista (si existe en la colección `service` con `Descripcion = "2907ServicioTest"`) |
| **Validación** | Verificar en Firestore: `service.where('Descripcion', '==', '2907ServicioTest')` |
| **Evidencia** | Captura del dropdown con el servicio visible + consulta Firestore |

### 6.2 Sin límite en resultados
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en el dropdown de servicios |
| **When** | Usuario despliega la lista completa |
| **Then** | Deben aparecer TODOS los servicios de la colección, sin límite de 6 |
| **Validación** | Contar documentos en `service` collection y verificar que aparezcan todos |
| **Evidencia** | Captura del dropdown scrolleado hasta el final |

### 6.3 Búsqueda en dropdown de servicios
| Ítm | Descripción |
|-----|-------------|
| **Given** | Usuario en dropdown de servicios (searchable) |
| **When** | Usuario escribe "2907" en el campo de búsqueda |
| **Then** | El servicio "2907ServicioTest" debe aparecer como resultado |
| **Evidencia** | Captura de pantalla con el resultado de búsqueda |

---

## 7. Búsqueda y selección de repuestos

### 7.1 Búsqueda por "Cintillos" - Items clickeables
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla de selección de repuestos (`ElegirRepuestosWidget`) |
| **When** | Usuario escribe "Cintillos" en el buscador |
| **Then** | Los resultados deben aparecer en la lista |
| **Then** | CADA resultado debe ser clickeable (seleccionable) |
| **When** | Usuario presiona un resultado |
| **Then** | El repuesto debe agregarse a la lista de seleccionados |
| **Evidencia** | Video del flujo de búsqueda, selección y confirmación de que se agregó |

### 7.2 Items por defecto (buscador vacío) - Clickeables
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en selección de repuestos sin texto en el buscador |
| **When** | Usuario presiona uno de los items listados por defecto |
| **Then** | El repuesto debe agregarse a la lista de seleccionados |
| **Evidencia** | Video del flujo |

### 7.3 Tiempo de respuesta de búsqueda
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en buscador de repuestos |
| **When** | Usuario escribe un término de búsqueda |
| **Then** | Los resultados deben aparecer en menos de 1 segundo (el debounce actual es de 2000ms, considerar reducirlo) |
| **Evidencia** | Medición con cronómetro |

---

## 8. Carga de imágenes

### 8.1 Velocidad de carga
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario en pantalla que permite tomar/adjuntar imágenes |
| **When** | Usuario toma una foto o selecciona de galería |
| **Then** | La imagen debe comprimirse antes de subir |
| **Then** | El estado "Subiendo foto..." no debe durar más de 5 segundos en una conexión 4G promedio |
| **Evidencia** | Video con medición de tiempo |

### 8.2 Estado de carga
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario sube una imagen |
| **When** | Durante la subida |
| **Then** | Debe verse un indicador de progreso o "Subiendo imagen..." |
| **Then** | La app no debe quedarse congelada en "cargando imagen" |
| **Evidencia** | Video del proceso de carga |

---

## 9. Valor del servicio en cotización

### 9.1 Precio del servicio visible en creación
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario está creando una cotización (pantalla `CrearCotizacionFuncionandoWidget`) |
| **When** | Usuario agrega una falla con un servicio asociado (ej: "2907ServicioTest") |
| **Then** | El precio del servicio debe ser visible en el resumen de la falla |
| **Evidencia** | Captura de pantalla del resumen de falla mostrando el precio del servicio |

### 9.2 Precio del servicio en el PDF
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario ha creado una cotización |
| **When** | Usuario genera el PDF de cotización |
| **Then** | El PDF debe incluir el precio del servicio (mano de obra) en la tabla de items |
| **Then** | El total del servicio (precio × horas estimadas) debe estar correctamente calculado |
| **Evidencia** | PDF generado mostrando los valores |

### 9.3 Cálculo correcto del subtotal
| Ítem | Descripción |
|------|-------------|
| **Given** | Cotización con 1 falla (servicio S/50, 2 horas) y 1 repuesto (S/100) |
| **When** | Se calculan los totales |
| **Then** | Subtotal = (50 × 2) + 100 = S/200 |
| **Then** | IGV = 200 × 0.18 = S/36 |
| **Then** | Total = 200 × 1.18 = S/236 |
| **Validación** | Verificar en Firestore: `recepciones.subtotal`, `recepciones.igv`, `recepciones.total` |
| **Evidencia** | Captura de la cotización mostrando los valores |

---

## 10. Pruebas de regresión

### 10.1 Flujo completo: Recepción → Diagnóstico → Cotización → PDF
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario administrador logueado |
| **When** | Usuario: 1. Crea recepción rápida con cliente Natural + vehículo existente |
| **Then** | 2. Agrega diagnóstico con falla + servicio + repuestos + fotos |
| **Then** | 3. Genera cotización y visualiza resumen |
| **Then** | 4. Genera PDF de cotización |
| **Then** | 5. Cambia estado a "Cotización" |
| **Then** | 6. Visualiza en listado de recepciones con etiqueta "Cotización" |
| **Then** | TODO debe funcionar sin errores |
| **Evidencia** | Video del flujo completo |

### 10.2 Login + Password Reset completo
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario no autenticado |
| **When** | Usuario: 1. Va a login, presiona "Olvidé mi contraseña" |
| **Then** | 2. Ingresa email (visible, sin asteriscos) |
| **Then** | 3. Presiona enviar → ve pantalla de confirmación |
| **Then** | 4. Presiona "Continuar" → regresa a login |
| **Then** | 5. Inicia sesión normalmente |
| **Evidencia** | Video del flujo completo |

### 10.3 Avatar en todas las pantallas
| Ítem | Descripción |
|------|-------------|
| **Given** | Usuario logueado sin foto de perfil |
| **When** | Usuario navega por todas las pantallas listadas en 4.1 |
| **Then** | En TODAS debe aparecer la inicial del nombre en círculo rojo (no placeholder image) |
| **When** | Usuario sube foto de perfil |
| **Then** | En TODAS las pantallas debe aparecer la foto (no la inicial) |
| **Evidencia** | Video navegando por todas las pantallas |

---

## 11. Matriz de resultados

| # | Prueba | Dispositivo | Resultado | Observaciones |
|---|--------|-------------|-----------|---------------|
| 1.1 | | | | |
| 1.2 | | | | |
| 1.3 | | | | |
| 1.4 | | | | |
| 2.1 | | | | |
| 2.2 | | | | |
| 2.3 | | | | |
| 2.4 | | | | |
| 3.1 | | | | |
| 4.1 | | | | |
| 5.1 | | | | |
| 5.2 | | | | |
| 6.1 | | | | |
| 6.2 | | | | |
| 6.3 | | | | |
| 7.1 | | | | |
| 7.2 | | | | |
| 7.3 | | | | |
| 8.1 | | | | |
| 8.2 | | | | |
| 9.1 | | | | |
| 9.2 | | | | |
| 9.3 | | | | |
| 10.1 | | | | |
| 10.2 | | | | |
| 10.3 | | | | |

---

## 12. Checklist de preparación

- [ ] Firebase emulator o acceso a Firestore de desarrollo
- [ ] Usuario de prueba con vehículo "abc987" con Marca y Modelo definidos
- [ ] Usuario "Cliente 29.07" con `tipo_de_persona = "Natural"`
- [ ] Servicio "2907ServicioTest" en colección `service`
- [ ] Repuesto con nombre que contenga "Cintillos" en colección `articles`
- [ ] Usuario sin foto de perfil (photo_url vacío)
- [ ] Usuario con foto de perfil
- [ ] Recepciones en cada estado: Recepción, Diagnóstico, Cotización, Reparación, Finalizado
- [ ] Conexión a internet estable
