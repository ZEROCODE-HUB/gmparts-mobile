# Clasificación de Pantallas — GMParts FlutterFlow

> Generado el 2026-07-19 — Proyecto: `D:\Zerocode\PROYECTOS\GMPARTS-FLUTTERFLOW-EXPORT-ORIGINAL`

---

## Leyenda

| Categoría | Descripción |
|---|---|
| **ADMIN_WEB** | Pantallas de gestión administrativa (clientes, proveedores, personal, almacén, compras, ventas, cobranza, reportes). Panel web de escritorio. |
| **MOBILE_CLIENTE** | Pantallas orientadas al flujo de recepción/diagnóstico/reparación en taller — usadas por asesores de servicio, técnicos y clientes desde dispositivo móvil. |
| **COMPARTIDA** | Pantallas compartidas por ambos entornos (login, splash, cambio de contraseña, cuenta, privacidad). |
| **INCIERTA** | No se pudo determinar con confianza. |

---

## Rutas Registradas en `lib/flutter_flow/nav/nav.dart`

Todas las rutas se definen mediante `FFRoute` en el `GoRouter` dentro de `createRouter()`. A continuación se listan en el orden exacto en que aparecen en el archivo.

---

## Tabla Completa de Clasificación

| # | Ruta (path) | Widget Class | Clasificación | Propósito | Colecciones Firestore | Dependencias (Componentes) |
|---|---|---|---|---|---|---|
| 1 | `/` | `_initialize` (SplashWidget o IniciarSessionWidget) | **COMPARTIDA** | Página raíz — redirige a Splash si logueado o a Login si no. | — | — |
| 2 | `/splash` | `SplashWidget` | **COMPARTIDA** | Pantalla de carga / splash inicial. | — | — |
| 3 | `/iniciarSession` | `IniciarSessionWidget` | **COMPARTIDA** | Inicio de sesión (email, Google, Apple). | `users` | — |
| 4 | `/restaurarContrasena1` | `RestaurarContrasena1Widget` | **COMPARTIDA** | Paso 1 de recuperación de contraseña. | — | — |
| 5 | `/restaurarContrasena2` | `RestaurarContrasena3Widget` | **COMPARTIDA** | Paso 2 de recuperación de contraseña. | — | — |
| 6 | `/restaurarContrasena3` | `RestaurarContrasena2Widget` | **COMPARTIDA** | Paso 3 de recuperación de contraseña. | — | — |
| 7 | `/bNuevarecepcionrapidaF` | `BNuevarecepcionrapidaFWidget` | **MOBILE_CLIENTE** | Formulario de recepción rápida (crear/editar). Selecciona cliente, vehículo, técnico. | `recepciones`, `users`, `Vehiculos`, `personal` | `AgregarClienteWidget`, `AgregarVehiculoWidget` |
| 8 | `/cNuevaRecepcionCompletaF` | `CNuevaRecepcionCompletaFWidget` | **MOBILE_CLIENTE** | Wizard de recepción completa (3 pasos: datos personales, vehículo, servicio). | `recepciones`, `users`, `Vehiculos`, `personal` | `AgregarClienteWidget` |
| 9 | `/gLinkcliente` | `GLinkclienteWidget` | **MOBILE_CLIENTE** | Página pública para cliente — ver estado de recepción y aprobar cotización. | `recepciones`, `diagnosticos` | — |
| 10 | `/hLinkGMParts2` | `HLinkGMParts2Widget` | **MOBILE_CLIENTE** | Pantalla de enlace para asesor de servicio. | `recepciones` | — |
| 11 | `/iNuevarecrapida` | `INuevarecrapidaWidget` | **MOBILE_CLIENTE** | Variante de recepción rápida (asesor de servicio). | `recepciones` | — |
| 12 | `/fRecepcionGuardada` | `FRecepcionGuardadaWidget` | **MOBILE_CLIENTE** | Confirmación de recepción guardada exitosamente. | `recepciones` | — |
| 13 | `/aRecepcionesInicio` | `ARecepcionesInicioWidget` | **MOBILE_CLIENTE** | Lista principal de recepciones con búsqueda y filtro por estado. Requiere auth. | `recepciones` | `TipoRecepcionWidget`, `VacioWidget` |
| 14 | `/bDashBoardDiagnostico` | `BDashBoardDiagnosticoWidget` | **MOBILE_CLIENTE** | Detalle de servicio (datos del cliente + vehículo con opciones de editar/compartir). | `recepciones` | `EnvioclienteWidget` |
| 15 | `/dCotizacion` | `DCotizacionWidget` | **MOBILE_CLIENTE** | Pantalla de cotización (detalle de precios, diagnóstico). | `recepciones`, `diagnosticos` | — |
| 16 | `/eDiagnostico` | `EDiagnosticoWidget` | **MOBILE_CLIENTE** | Diagnóstico — ver fallas de una orden de servicio. | `recepciones`, `diagnosticos` | — |
| 17 | `/fDiagnostico` | `FDiagnosticoWidget` | **MOBILE_CLIENTE** | Diagnóstico (variante). | `recepciones`, `diagnosticos` | — |
| 18 | `/controldecalidadtecnico2` | `Controldecalidadtecnico2Widget` | **MOBILE_CLIENTE** | Control de calidad — formulario para técnico (checklist de aprobación). | `recepciones` | — |
| 19 | `/dashBoard2CopyCopy` | `DashBoard2CopyCopyWidget` | **MOBILE_CLIENTE** | Dashboard variante (copia). | — | — |
| 20 | `/encuestacliente` | `EncuestaclienteWidget` | **MOBILE_CLIENTE** | Encuesta de satisfacción para el cliente (link público). | `recepciones` | — |
| 21 | `/gLinkclienteCotizacion` | `GLinkclienteCotizacionWidget` | **MOBILE_CLIENTE** | Página pública para que el cliente vea la cotización. | `recepciones` | — |
| 22 | `/hAprobacionclientecotiz` | `HAprobacionclientecotizWidget` | **MOBILE_CLIENTE** | Aprobación de cotización por parte del cliente (link público). | `recepciones`, `diagnosticos` | — |
| 23 | `/cDashBoard2Finalizar` | `CDashBoard2FinalizarWidget` | **MOBILE_CLIENTE** | Reparaciones en progreso — lista diagnósticos aprobados por cliente para finalizar. | `recepciones`, `diagnosticos` | `FinalizarfallaWidget` |
| 24 | `/bDetalleestatico` | `BDetalleestaticoWidget` | **MOBILE_CLIENTE** | Detalle de recepción en modo solo lectura. | `recepciones` | — |
| 25 | `/dControldecalidadenviarcliente` | `DControldecalidadenviarclienteWidget` | **MOBILE_CLIENTE** | Enviar control de calidad al cliente (compartir link). | — | `EnvioclienteWidget` |
| 26 | `/dFinalizado` | `DFinalizadoWidget` | **MOBILE_CLIENTE** | Pantalla de confirmación de proceso finalizado. | `recepciones` | — |
| 27 | `/dFincliente` | `DFinclienteWidget` | **MOBILE_CLIENTE** | Pantalla de agradecimiento al cliente ("ya puedes recoger tu vehículo"). | — | — |
| 28 | `/aPcDashboard` | `APcDashboardWidget` | **ADMIN_WEB** | Dashboard principal del panel web administrativo. | `users`, `diagnosticos` | `MenuwebWidget` |
| 29 | `/aPcRegistroDeClientes` | `APcRegistroDeClientesWidget` | **ADMIN_WEB** | Lista de clientes registrados (rol Cliente). CRUD. | `users` | `MenuwebWidget`, `EliminarClienteWidget` |
| 30 | `/aPcRegistroDeProveedores` | `APcRegistroDeProveedoresWidget` | **ADMIN_WEB** | Lista de proveedores. CRUD. | `Proveedores` | `MenuwebWidget`, `EliminarProvedoresWidget` |
| 31 | `/bPcRegistroDePersonal` | `BPcRegistroDePersonalWidget` | **ADMIN_WEB** | Lista de personal (roles internos). CRUD. | `users` | `MenuwebWidget`, `EliminarPersonalWidget` |
| 32 | `/ePcEmisionVentaFactura` | `EPcEmisionVentaFacturaWidget` | **ADMIN_WEB** | Emisión de factura de venta (productos). | `FacturasVentasCompras` | `MenuwebWidget` |
| 33 | `/dPcCrearRegistroCliente` | `DPcCrearRegistroClienteWidget` | **ADMIN_WEB** | Formulario crear nuevo cliente. | `users` | `MenuwebWidget`, `GuardarWidget` |
| 34 | `/dPcCrearProveedores` | `DPcCrearProveedoresWidget` | **ADMIN_WEB** | Formulario crear nuevo proveedor. | `Proveedores` | `MenuwebWidget`, `GuardarWidget` |
| 35 | `/dPcEditarProvedor` | `DPcEditarProvedorWidget` | **ADMIN_WEB** | Formulario editar proveedor existente. | `Proveedores` | `MenuwebWidget`, `GuardarWidget` |
| 36 | `/dPcCrearPersonal` | `DPcCrearPersonalWidget` | **ADMIN_WEB** | Formulario crear nuevo personal. | `users` | `MenuwebWidget`, `GuardarWidget` |
| 37 | `/dPcEditaPersonal` | `DPcEditaPersonalWidget` | **ADMIN_WEB** | Formulario editar personal existente. | `users` | `MenuwebWidget`, `GuardarWidget` |
| 38 | `/ePcOrdenTrabajo` | `EPcOrdenTrabajoWidget` | **ADMIN_WEB** | Gestión de órdenes de trabajo (desde recepciones). | `recepciones` | `MenuwebWidget` |
| 39 | `/ePcEmisionVentaBoleta` | `EPcEmisionVentaBoletaWidget` | **ADMIN_WEB** | Emisión de boleta de venta (productos). | — | `MenuwebWidget` |
| 40 | `/ePcEmisionDeRemision` | `EPcEmisionDeRemisionWidget` | **ADMIN_WEB** | Emisión de guía de remisión (productos). | — | `MenuwebWidget` |
| 41 | `/ePcNotadeCredito` | `EPcNotadeCreditoWidget` | **ADMIN_WEB** | Nota de crédito (productos). | — | `MenuwebWidget` |
| 42 | `/ePcCotizacionDeSevicios` | `EPcCotizacionDeSeviciosWidget` | **ADMIN_WEB** | Cotización de servicios — lista recepciones para cotizar. | `recepciones` | `MenuwebWidget`, `CrearRecWebCrearWidget`, `SeleccionWebWidget` |
| 43 | `/ePcEmisionDeFacturaTaller` | `EPcEmisionDeFacturaTallerWidget` | **ADMIN_WEB** | Emisión de factura de taller (servicios). | `Facturas` | `MenuwebWidget`, `CrearfacturaWidget`, `VerfacturaWidget`, `VacioCopyWidget` |
| 44 | `/ePcEmisionDeBoletas` | `EPcEmisionDeBoletasWidget` | **ADMIN_WEB** | Emisión de boletas (servicios de taller). | `Facturas` | `MenuwebWidget`, `CrearfacturaWidget`, `VerfacturaWidget`, `VacioCopyWidget` |
| 45 | `/ePcRegistroDeNotaVentas` | `EPcRegistroDeNotaVentasWidget` | **ADMIN_WEB** | Registro de notas de venta (servicios). | `Facturas` | `MenuwebWidget`, `CanjearnotaventaWidget`, `CrearfacturaWidget`, `VacioCopyWidget` |
| 46 | `/ePcCompraFactura` | `EPcCompraFacturaWidget` | **ADMIN_WEB** | Gestión de facturas de compra. | `FacturasVentasCompras`, `Proveedores`, `users` | `MenuwebWidget`, `CrearfacturaCompraWidget`, `EditarfacturaCompraWidget` |
| 47 | `/ePcCompraBoleta` | `EPcCompraBoletaWidget` | **ADMIN_WEB** | Gestión de boletas de compra. | `FacturasVentasCompras` | `MenuwebWidget`, `CrearfacturaCompraWidget` |
| 48 | `/ePcNotadePedido` | `EPcNotadePedidoWidget` | **ADMIN_WEB** | Gestión de notas de pedido (compras/almacén). | `FacturasVentasCompras` | `MenuwebWidget`, `CrearfacturaCompraWidget` |
| 49 | `/ePcGuiaCompra` | `EPcGuiaCompraWidget` | **ADMIN_WEB** | Gestión de guías de compra. | `FacturasVentasCompras` | `MenuwebWidget` |
| 50 | `/ePcOrdenPago` | `EPcOrdenPagoWidget` | **ADMIN_WEB** | Órdenes de pago a proveedores. | `cuentasPorCobrar`, `pagos_CporCobrar` | `MenuwebWidget` |
| 51 | `/ePcCuetasporpagar` | `EPcCuetasporpagarWidget` | **ADMIN_WEB** | Cuentas por pagar (proveedores). | `cuentasPorCobrar` | `MenuwebWidget`, `StatusEmisionventafacturaWidget` |
| 52 | `/ePcReporteDeVentas` | `EPcReporteDeVentasWidget` | **ADMIN_WEB** | Reporte de ventas. | — | `MenuwebWidget` |
| 53 | `/ePcReporteDocumentosElect` | `EPcReporteDocumentosElectWidget` | **ADMIN_WEB** | Reporte de documentos electrónicos. | — | `MenuwebWidget` |
| 54 | `/ePcAlmacenServicio` | `EPcAlmacenServicioWidget` | **ADMIN_WEB** | Gestión de servicios (mantenimiento). | `service` | `MenuwebWidget`, `GestionServicioNuevoCrearWidget` |
| 55 | `/ePcAlmacenRegistro` | `EPcAlmacenRegistroWidget` | **ADMIN_WEB** | Registro de artículos en almacén. | `Articles` | `MenuwebWidget` |
| 56 | `/ePcAlmacenGestion` | `EPcAlmacenGestionWidget` | **ADMIN_WEB** | Gestión de almacenes (CRUD). | `Almacen` | `MenuwebWidget`, `GestionAlmacenNuevoWidget`, `GestionAlmacenEditarWidget` |
| 57 | `/ePcAlmacenIngreso` | `EPcAlmacenIngresoWidget` | **ADMIN_WEB** | Ingreso de inventario a almacén (stock). | `Articles_Warehouse`, `Almacen` | `MenuwebWidget` |
| 58 | `/ePcAlmacenValeInsumos` | `EPcAlmacenValeInsumosWidget` | **ADMIN_WEB** | Vale de insumos/salidas de almacén. | `Insumos` | `MenuwebWidget` |
| 59 | `/ePcAlmacenListaKardex` | `EPcAlmacenListaKardexWidget` | **ADMIN_WEB** | Lista Kardex de inventario (movimientos). | `Kardex_element`, `Almacen` | `MenuwebWidget` |
| 60 | `/ePcAlmacenGestinVehculos` | `EPcAlmacenGestinVehiculosWidget` | **ADMIN_WEB** | Gestión de vehículos en almacén. | `Vehiculos` | `MenuwebWidget` |
| 61 | `/ePcAlmacenNotaDeVenta` | `EPcAlmacenNotaDeVentaWidget` | **ADMIN_WEB** | Nota de venta desde almacén. | `FacturasVentasCompras` | `MenuwebWidget` |
| 62 | `/ePcCuetasporCobrar` | `EPcCuetasporCobrarWidget` | **ADMIN_WEB** | Cuentas por cobrar (clientes) — registro de pagos. | `cuentasPorCobrar`, `pagos_CporCobrar` | `MenuwebWidget`, `PagosWebWidget`, `VacioCopyWidget` |
| 63 | `/dPcCrearVehiculo` | `DPcCrearVehiculoWidget` | **ADMIN_WEB** | Formulario crear nuevo vehículo. | `Vehiculos`, `users`, `Proveedores`, `vehicle_marca_brand`, `vehicle_model_modelo` | `MenuwebWidget`, `AddVehicleMarcaBrandWidget`, `AddVehicleModelWidget`, `GuardarWidget` |
| 64 | `/dPcCrearArticulo` | `DPcCrearArticuloWidget` | **ADMIN_WEB** | Formulario crear nuevo artículo/producto. | `Articles`, `article_brand_marca`, `measurement_unit`, `Group`, `subgroup` | `MenuwebWidget`, `AddArticleMarcaWidget`, `AddGroupWidget`, `AddMeasurmentUnitWidget`, `AddSubgroupWidget`, `GuardarWidget` |
| 65 | `/dPcEditarVehiculo` | `DPcEditarVehiculoWidget` | **ADMIN_WEB** | Formulario editar vehículo existente. | `Vehiculos`, `users`, `Proveedores` | `MenuwebWidget`, `GuardarWidget` |
| 66 | `/ePcCrearComprafactura` | `EPcCrearComprafacturaWidget` | **ADMIN_WEB** | Formulario crear factura de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 67 | `/ePcEditarComprafactura` | `EPcEditarComprafacturaWidget` | **ADMIN_WEB** | Formulario editar factura de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 68 | `/ePcCrearCompraboleta` | `EPcCrearCompraboletaWidget` | **ADMIN_WEB** | Formulario crear boleta de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 69 | `/ePcEditarCompraboleta` | `EPcEditarCompraboletaWidget` | **ADMIN_WEB** | Formulario editar boleta de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 70 | `/ePcCrearCompraNotaPedido` | `EPcCrearCompraNotaPedidoWidget` | **ADMIN_WEB** | Formulario crear nota de pedido (compra). | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 71 | `/ePcEditarCompraNotadePedido` | `EPcEditarCompraNotadePedidoWidget` | **ADMIN_WEB** | Formulario editar nota de pedido (compra). | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 72 | `/ePcCrearCompraGuia` | `EPcCrearCompraGuiaWidget` | **ADMIN_WEB** | Formulario crear guía de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 73 | `/ePcEditarCompraGuia` | `EPcEditarCompraGuiaWidget` | **ADMIN_WEB** | Formulario editar guía de compra. | `users`, `FacturasVentasCompras` | `MenuwebWidget` |
| 74 | `/dPcEditarArticulo` | `DPcEditarArticuloWidget` | **ADMIN_WEB** | Formulario editar artículo existente. | `Articles`, `article_brand_marca`, `measurement_unit`, `Group`, `subgroup` | `MenuwebWidget`, `AddArticleMarcaWidget`, `AddGroupWidget`, `AddMeasurmentUnitWidget`, `AddSubgroupWidget`, `GuardarWidget` |
| 75 | `/dPcInventarioIngresoCreacion` | `DPcInventarioIngresoCreacionWidget` | **ADMIN_WEB** | Crear ingreso de inventario (lote de artículos a almacén). | `users`, `Almacen`, `Articles`, `Articles_Warehouse` | `MenuwebWidget`, `GuardarWidget` |
| 76 | `/dPcEditarVehiculo1` | `DPcEditarVehiculo1Widget` | **ADMIN_WEB** | Formulario editar vehículo (variante con más campos). | `Vehiculos`, `vehicle_marca_brand`, `vehicle_model_modelo`, `users`, `Proveedores` | `MenuwebWidget`, `AddVehicleMarcaBrandWidget`, `AddVehicleModelWidget`, `GuardarWidget` |
| 77 | `/dPcInventarioIngresoEdicion` | `DPcInventarioIngresoEdicionWidget` | **ADMIN_WEB** | Editar ingreso de inventario existente. | `Articles_Warehouse`, `users`, `Almacen`, `Articles` | `MenuwebWidget`, `GuardarWidget` |
| 78 | `/ePcAlmacenTest` | `EPcAlmacenTestWidget` | **INCIERTA** | Pantalla de prueba para almacén. | varias | `MenuwebWidget` |
| 79 | `/crearCotizacionFuncionando` | `CrearCotizacionFuncionandoWidget` | **MOBILE_CLIENTE** | Crear cotización desde diagnóstico (flujo principal). | `recepciones`, `diagnosticos` | `FallacomponentUpdateWidget` |
| 80 | `/encuestaclientev` | `EncuestaclientevWidget` | **MOBILE_CLIENTE** | Encuesta de satisfacción al cliente (variante con video). | `recepciones` | — |
| 81 | `/cDashBoard2Finalizado` | `CDashBoard2FinalizadoWidget` | **MOBILE_CLIENTE** | Reparaciones finalizadas — vista solo lectura. | `recepciones`, `diagnosticos` | `FinalizadofallaWidget` |
| 82 | `/dControldecalidadenviarclientePre` | `DControldecalidadenviarclientePreWidget` | **MOBILE_CLIENTE** | Pantalla previa antes de enviar control de calidad al cliente. | `recepciones` | — |
| 83 | `/ePcOrdenTrabajo2` | `EPcOrdenTrabajo2Widget` | **ADMIN_WEB** | Órdenes de trabajo (variante actualizada con selección mejorada). | `recepciones` | `MenuwebWidget`, `SeleccionWebOrdenTrabajoWidget` |
| 84 | `/zNuevacontrasena` | `ZNuevacontrasenaWidget` | **COMPARTIDA** | Cambiar/restablecer contraseña. | — | — |
| 85 | `/ePcCotizacionCrear` | `EPcCotizacionCrearWidget` | **ADMIN_WEB** | Crear cotización desde el panel web (productos). | `Articles_Warehouse`, `users`, `Almacen` | `MenuwebWidget`, `GuardarWidget` |
| 86 | `/privacy` | `PrivacyWidget` | **COMPARTIDA** | Política de privacidad. | — | — |
| 87 | `/cotizacionFuncionando` | `CotizacionFuncionandoWidget` | **MOBILE_CLIENTE** | Cotización en ejecución — lista diagnósticos, calcula totales. | `recepciones`, `diagnosticos` | `CotizacionNUEVOWidget`, `TotalWidget` |
| 88 | `/aCuenta` | `ACuentaWidget` | **COMPARTIDA** | Perfil de cuenta — cerrar sesión, borrar cuenta. Requiere auth. | — | — |
| 89 | `/aConfirmarBorrarCuenta` | `AConfirmarBorrarCuentaWidget` | **COMPARTIDA** | Confirmación de borrado de cuenta. Requiere auth. | — | — |
| 90 | `/ePcEmisionDeFacturaVentasArticulo` | `EPcEmisionDeFacturaVentasArticuloWidget` | **ADMIN_WEB** | Emisión de factura de ventas de artículos/productos. | `FacturasVentasCompras` | `MenuwebWidget`, `CrearfacturaArticulosWidget`, `VacioCopyWidget` |
| 91 | `/ePcEmisionDeBoletaVentasArticulo` | `EPcEmisionDeBoletaVentasArticuloWidget` | **ADMIN_WEB** | Emisión de boleta de ventas de artículos/productos. | `FacturasVentasCompras` | `MenuwebWidget`, `CrearfacturaArticulosWidget`, `VacioCopyWidget` |
| 92 | `/dPcEditarRegistroCliente` | `DPcEditarRegistroClienteWidget` | **ADMIN_WEB** | Formulario editar cliente existente. | `users` | `MenuwebWidget`, `GuardarWidget` |
| 93 | `/detalleFallas` | `DetalleFallasWidget` | **MOBILE_CLIENTE** | Detalle de fallas/diagnósticos de una orden. | `recepciones` | — |
| 94 | `/gLinkclienteCopy` | `GLinkclienteCopyWidget` | **MOBILE_CLIENTE** | Página pública para cliente (copia/variante). | `recepciones` | — |
| 95 | `/crearCotizacionFuncionandoCopy` | `CrearCotizacionFuncionandoCopyWidget` | **MOBILE_CLIENTE** | Crear cotización (copia/variante). | `recepciones`, `diagnosticos` | `FallacomponentUpdateWidget` |

---

## Pantallas que NO son rutas (usadas como modales, bottom sheets o componentes embebidos)

Estos archivos existen en `lib/components/`, `lib/elegir_insumos_repuestos/` y otras carpetas, pero **no tienen entrada en nav.dart**. Se usan desde otras pantallas como widgets reutilizables.

### Componentes de uso general (`lib/components/`)

| Componente | Propósito | Usado por |
|---|---|---|
| `MenuwebWidget` | Barra lateral de navegación del panel web | Casi todas las pantallas ADMIN_WEB |
| `GuardarWidget` | Botón guardar con animación | CRUDs de administración |
| `CrearfacturaWidget` | Formulario crear factura (servicios) | Ventas Servicios |
| `CrearfacturaArticulosWidget` | Formulario crear factura (artículos) | Ventas Productos |
| `CrearfacturaCompraWidget` | Formulario crear factura de compra | Compras, CompraFactura |
| `CrearfacturaCompraCopyWidget` | Variante de factura de compra | Compras |
| `VerfacturaWidget` | Modal para ver detalle de factura | Ventas Servicios |
| `VacioWidget` / `VacioCopyWidget` | Estado vacío (empty state) | Varias pantallas |
| `PagosWebWidget` | Registro de pagos | Cuentas por Cobrar |
| `OpcionesWidget` | Opciones del menú lateral | MenuwebWidget |
| `CanjearnotaventaWidget` | Canje de nota de venta | Registro Nota Ventas |
| `EditarfacturaCompraWidget` | Editar factura de compra | CompraFactura |
| `StatusEmisionventafacturaWidget` | Indicador de estado | Cuentas por Pagar |
| `ElegirArticulosWidget` / `ElegirArticulosCopyWidget` | Selector de artículos | Varias |
| `ElegirRepuestosFinalWidget` | Selector de repuestos | Varias |
| `EditarArticuloModalWidget` / `EditarArticuloModalCopyWidget` | Modal editar artículo | Almacén |
| `EditarItemsWidget` / `EditarItemsCopyWidget` | Modal editar items | Facturación |
| `CrearRecWebCrearWidget` | Crear recepción desde web | Cotización Servicios |
| `CrearRecWebEditarWidget` | Editar recepción desde web | Cotización Servicios |
| `SeleccionWebWidget` | Selector web genérico | Cotización Servicios |
| `SeleccionWebOrdenTrabajoWidget` | Selector específico para órdenes | Orden Trabajo 2 |
| `GestionAlmacenNuevoWidget` | Crear almacén | Almacén Gestión |
| `GestionAlmacenEditarWidget` | Editar almacén | Almacén Gestión |
| `GestionServicioNuevoCrearWidget` | Crear servicio | Almacén Servicio |
| `AddArticleMarcaWidget` | Agregar marca de artículo (modal) | Crear/Editar Artículo |
| `AddGroupWidget` | Agregar grupo (modal) | Crear/Editar Artículo |
| `AddMeasurmentUnitWidget` | Agregar unidad de medida (modal) | Crear/Editar Artículo |
| `AddSubgroupWidget` | Agregar subgrupo (modal) | Crear/Editar Artículo |
| `AddVehicleMarcaBrandWidget` | Agregar marca de vehículo (modal) | Crear/Editar Vehículo |
| `AddVehicleModelWidget` | Agregar modelo de vehículo (modal) | Crear/Editar Vehículo |
| `AgregarClienteWidget` | Modal agregar cliente rápido | Recepciones |
| `AgregarVehiculoWidget` | Modal agregar vehículo rápido | Recepciones |
| `TipoRecepcionWidget` | Selector de tipo de recepción | Recepciones Inicio |
| `EnvioclienteWidget` | Modal compartir link con cliente | Dashboard Diagnóstico, Control Calidad |
| `CotizacionNUEVOWidget` | Item de cotización (diagnóstico) | Cotización Funcionando |
| `TotalWidget` | Bottom sheet de totales (subtotal/IGV/total) | Cotización Funcionando |
| `FallacomponentUpdateWidget` | Componente de falla para cotización | CrearCotizacionFuncionando |
| `FinalizarfallaWidget` | Componente para finalizar falla | Dashboard Finalizar |
| `FinalizadofallaWidget` | Componente de falla finalizada | Dashboard Finalizado |
| `ErrorsWidget` | Modal de errores | Agregar Cliente |
| `BuscarcotizacionWidget` | Buscador de cotizaciones | Varias |
| `CotizacionesWidget` / `CotizacionclienteWidget` | Visualizar cotizaciones | Varias |
| `CrearcuentacobrarWidget` | Crear cuenta por cobrar | Cobranza |
| `CrearfallaNUEVOWidget` / `CrearfallaNUEVOeditarWidget` | Crear/editar falla | Diagnóstico |
| `FallacomponentWidget` / `FallacomponentUpdateWidget` / `FallacomponentUpdateCopyWidget` | Componentes de falla | Cotización |
| `RowArticlesWidget` | Fila de artículo en listas | Varias |
| `TextcomponentWidget` / `TextfallasWidget` / `TexttselectWidget` | Componentes de texto | Varias |
| `ModelChooseWidget` | Selector de modelo | Vehículos |
| `TipoRecepcionWidget` | Tipo de recepción | Recepciones Inicio |
| `CanjearnotaventaWidget` | Canje de nota de venta | Registro Nota Ventas |
| `SeleccionarFormatoWidget` | Seleccionar formato | Varias |

### Pantallas modales de `lib/elegir_insumos_repuestos/`

| Widget | Propósito | Colecciones Firestore |
|---|---|---|
| `ElegirInsumosWidget` | Selector de insumos (modal) | `Articles` (Algolia) |
| `ElegirInsumosCopyWidget` | Selector de insumos (variante) | `Articles` |
| `ElegirRepuestosWidget` | Selector de repuestos (filtro local) | `Articles` |
| `ElegirRepArregladoWidget` | Selector de repuestos (Algolia) | `Articles` (Algolia) |
| `ElegirRepuestosCotizacionWidget` | Selector de repuestos para cotización | `Articles`, `diagnosticos` |
| `ElegirRepuestoCotizacionFacturaWidget` | Selector de repuestos para factura | `Articles` (Algolia) |
| `GestionServicioNuevoEditarWidget` | Editar servicio | `service` |
| `ManodeObraFacturaWidget` | Ingresar horas de mano de obra | — |
| `ModificarHorasCotizacionWidget` | Modificar horas en cotización | `diagnosticos` |

### Widgets de eliminación (`lib/web/administracion/eliminar_*`)

| Widget | Propósito |
|---|---|
| `EliminarAlmacenWidget` | Confirmación eliminar almacén |
| `EliminarArticuloWidget` | Confirmación eliminar artículo |
| `EliminarClienteWidget` | Confirmación eliminar cliente |
| `EliminarIngresoalmacnWidget` | Confirmación eliminar ingreso almacén |
| `EliminarPersonalWidget` | Confirmación eliminar personal |
| `EliminarProvedoresWidget` | Confirmación eliminar proveedor |
| `EliminarRecepcionWidget` | Confirmación eliminar recepción |
| `EliminarServicioWidget` | Confirmación eliminar servicio |
| `EliminarVehiculosWidget` | Confirmación eliminar vehículo |

---

## Resumen Estadístico

| Categoría | Cantidad |
|---|---|
| **ADMIN_WEB** | 48 |
| **MOBILE_CLIENTE** | 32 |
| **COMPARTIDA** | 11 |
| **INCIERTA** | 1 |
| **Total rutas en nav.dart** | 95 |
| **Componentes reutilizables (sin ruta)** | ~45 |

---

## Notas Adicionales

1. **Las pantallas MOBILE_CLIENTE** están mayoritariamente en `lib/diagnostico/` y sus subcarpetas. Algunas son accesibles públicamente mediante link (rutas `gLinkcliente*`, `hAprobacion*`, `encuesta*`).

2. **Las pantallas ADMIN_WEB** están organizadas en `lib/web/` con subcarpetas por módulo:
   - `administracion/` — clientes, proveedores, personal, dashboard
   - `almacen/` — artículos, vehículos, inventario, kardex, servicios
   - `cobranza/` — cuentas por cobrar/pagar
   - `compras/` — facturas, boletas, guías, notas de pedido, órdenes de pago
   - `reportes/` — reportes de ventas, documentos electrónicos
   - `ventas_productos/` — facturación de productos
   - `ventas_servicios/` — facturación de servicios de taller

---

## ⚠️ INSTRUCCIÓN DE MEMORIA DEL PROYECTO

> **Objetivo futuro**: Reconstruir una versión del panel administrativo web completamente nueva.
> **Acción**: NO borrar, NO modificar los archivos originales hasta nueva orden.
> **Base de partida**: Las pantallas ADMIN_WEB (48 rutas) + COMPARTIDA (11 rutas) listadas arriba sirven como referencia funcional.
> **Archivos fuente**: TODO está en `lib/web/`, `lib/components/`, `lib/flutter_flow/nav/nav.dart` y `lib/index.dart`.
> **Regeneración**: Se reconstruirá desde cero la carpeta `lib/web/` con nueva arquitectura, manteniendo los originales como referencia.

---

## COMPARTIDA — Inventario Completo para Reutilizar en la Nueva Versión Web

Estas 11 pantallas son compartidas entre el web admin y la app móvil. Al reconstruir el admin web, **evalúa si reutilizarlas tal cual** o si conviene crear versiones específicas web.

### 1. `SplashWidget`
| Campo | Valor |
|---|---|
| Ruta | `/splash` |
| Archivo | `lib/splash/splash/splash_widget.dart` |
| Propósito | Pantalla de carga inicial con logo |
| Colecciones | — |
| Dependencias | — |

### 2. `IniciarSessionWidget` — Login
| Campo | Valor |
|---|---|
| Ruta | `/iniciarSession` |
| Archivo | `lib/iniciar_sesion/iniciar_session/iniciar_session_widget.dart` |
| Propósito | Inicio de sesión (email, Google, Apple) |
| Colecciones | `users` (lectura/escritura) |
| Dependencias | — |

### 3. `RestaurarContrasena1Widget`
| Campo | Valor |
|---|---|
| Ruta | `/restaurarContrasena1` |
| Archivo | `lib/iniciar_sesion/restaurar_contrasena1/restaurar_contrasena1_widget.dart` |
| Propósito | Paso 1 — solicitar recuperación |
| Colecciones | — |
| Dependencias | — |

### 4. `RestaurarContrasena2Widget`
| Campo | Valor |
|---|---|
| Ruta | `/restaurarContrasena2` |
| Archivo | `lib/iniciar_sesion/restaurar_contrasena2/restaurar_contrasena2_widget.dart` |
| Propósito | Paso 2 — verificar/ingresar código |
| Colecciones | — |
| Dependencias | — |

### 5. `RestaurarContrasena3Widget`
| Campo | Valor |
|---|---|
| Ruta | `/restaurarContrasena3` |
| Archivo | `lib/iniciar_sesion/restaurar_contrasena3/restaurar_contrasena3_widget.dart` |
| Propósito | Paso 3 — nueva contraseña |
| Colecciones | — |
| Dependencias | — |

### 6. `ZNuevacontrasenaWidget` — Cambio de contraseña (web)
| Campo | Valor |
|---|---|
| Ruta | `/zNuevacontrasena` |
| Archivo | `lib/web/z_nuevacontrasena/z_nuevacontrasena_widget.dart` |
| Propósito | Formulario para establecer nueva contraseña (lado web) |
| Colecciones | — |
| Dependencias | — |
| Nota | Físicamente en `lib/web/` pero es funcionalidad de cuenta |

### 7. `ACuentaWidget` — Perfil
| Campo | Valor |
|---|---|
| Ruta | `/aCuenta` |
| Archivo | `lib/diagnostico/a_cuenta/a_cuenta_widget.dart` |
| Propósito | Perfil de usuario: avatar, nombre, cerrar sesión, borrar cuenta |
| Colecciones | — |
| Dependencias | — |

### 8. `AConfirmarBorrarCuentaWidget`
| Campo | Valor |
|---|---|
| Ruta | `/aConfirmarBorrarCuenta` |
| Archivo | `lib/diagnostico/a_confirmar_borrar_cuenta/a_confirmar_borrar_cuenta_widget.dart` |
| Propósito | Confirmación y advertencia de borrado irreversible |
| Colecciones | — |
| Dependencias | — |

### 9. `PrivacyWidget`
| Campo | Valor |
|---|---|
| Ruta | `/privacy` |
| Archivo | `lib/privacy/privacy_widget.dart` |
| Propósito | Política de privacidad / términos legales |
| Colecciones | — |
| Dependencias | — |

### 10. `_initialize` (raíz)
| Campo | Valor |
|---|---|
| Ruta | `/` |
| Archivo | (lógica en `nav.dart`:77-84) |
| Propósito | Redirige a Splash o Login según estado de autenticación |
| Colecciones | — |
| Dependencias | — |

---

### Resumen COMPARTIDA

| # | Pantalla | Ubicación |
|---|---|---|
| 1 | Splash | `lib/splash/` |
| 2 | Login | `lib/iniciar_sesion/iniciar_session/` |
| 3 | RestaurarContrasena1 | `lib/iniciar_sesion/restaurar_contrasena1/` |
| 4 | RestaurarContrasena2 | `lib/iniciar_sesion/restaurar_contrasena2/` |
| 5 | RestaurarContrasena3 | `lib/iniciar_sesion/restaurar_contrasena3/` |
| 6 | ZNuevacontrasena | `lib/web/z_nuevacontrasena/` |
| 7 | ACuenta | `lib/diagnostico/a_cuenta/` |
| 8 | AConfirmarBorrarCuenta | `lib/diagnostico/a_confirmar_borrar_cuenta/` |
| 9 | Privacy | `lib/privacy/` |
| 10 | _initialize (raíz) | `lib/flutter_flow/nav/nav.dart` |

---

## INCIERTA

| Pantalla | Ubicación | Razón |
|---|---|---|
| `EPcAlmacenTestWidget` | `lib/web/almacen/e_pc_almacen_test/` | Pantalla de prueba/depuración, sin propósito de negocio definido. Decidir si mantener o descartar en la nueva versión. |

---

## Recordatorio para la nueva versión web

- **Conservar** la carpeta `lib/web/` original como referencia (no borrar nada).
- **Crear** una nueva estructura web (ej. `lib/web_v2/` o reconstruir in-place cuando se ordene).
- **Las 48 pantallas ADMIN_WEB** actuales sirven como especificación funcional.
- **Las 11 pantallas COMPARTIDA** deben evaluarse una por una: algunas podrian reutilizarse, otras necesitarán versión web específica.
- **Los ~45 componentes** de `lib/components/` son candidatos a refactorización.
- **No tocar** las pantallas MOBILE_CLIENTE (32) — son el flujo de taller que se conserva intacto.
