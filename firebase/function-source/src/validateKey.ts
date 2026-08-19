import * as functions from 'firebase-functions/v1'
import * as admin from 'firebase-admin'

interface Repuesto {
  nombre: string
  cantidad: number
  precio: number
  total: number
}

interface Diagnostico {
  nombreFalla: string
  solucion: string
  fotos: string[]
  repuestos: Repuesto[]
  manoDeObra: number
  imagenesFinalizado?: string[]
  fotosfinalizar?: string[]
  precioservicio?: number
  nombreServicio?: string
  aprobacionCliente?: boolean
}

interface RecepcionData {
  id: string
  numeroorden: number
  nombreCliente: string
  telefono: string
  correoElectronico: string
  placa: string
  marca: string
  modelo: string
  anio?: string
  nivelCombustible?: string
  inventario?: string[]
  observaciones?: string
  status: string
  aprobacionCotizacion: boolean
  subtotal: number
  igv: number
  total: number
  fechaIngreso?: string
  fechaSalida?: string
  tecnicoServicio?: string
  tipoServicio?: string
  motivoIngreso?: string
  fotos?: string[]
  fotosFinalizacion?: string[]
  comentariosFinalizacion?: string
  aprobacionCliente?: boolean
  diagnosticos: Diagnostico[]
}

interface RepuestoCrudo {
  nombre?: string
  descripcion?: string
  Nombre?: string
  cantidad?: number
  cant?: number
  precio?: number
  pu?: number
  precioVenta?: number
  total?: number
}

const IGV = 0.18

function redondear(n: number): number {
  return Math.round((Number(n) || 0) * 100) / 100
}

/**
 * Importes de la cotización que ve el cliente.
 *
 * Si el documento ya trae un total (viene de la app móvil o de un comprobante), se respeta
 * tal cual: no es cosa de esta función recalcular lo que otro ya decidió. Solo cuando no hay
 * total se suma lo que hay en los diagnósticos —repuestos, mano de obra y precio de
 * servicio—, que es exactamente lo que se le está enseñando en pantalla.
 *
 * El IGV se desglosa como incluido, igual que hace el panel con «INCLUIDO IGV».
 */
function calcularImportes(
  docData: FirebaseFirestore.DocumentData,
  diagnosticos: Diagnostico[]
): { subtotal: number; igv: number; total: number } {
  const guardado = Number(docData.total ?? docData.Total ?? 0) || 0
  if (guardado > 0) {
    const sub = Number(docData.subtotal ?? docData.Subtotal ?? 0) || redondear(guardado / (1 + IGV))
    return {
      subtotal: redondear(sub),
      igv: Number(docData.igv ?? docData.IGV ?? 0) || redondear(guardado - sub),
      total: redondear(guardado),
    }
  }

  const suma = diagnosticos.reduce((acc, d) => {
    const repuestos = (d.repuestos || []).reduce((s, r) => s + (Number(r.total) || 0), 0)
    return acc + repuestos + (Number(d.manoDeObra) || 0) + (Number(d.precioservicio) || 0)
  }, 0)

  const total = redondear(suma)
  const subtotal = redondear(total / (1 + IGV))
  return { subtotal, igv: redondear(total - subtotal), total }
}

function toIso(value: unknown): string | undefined {
  if (value == null) return undefined
  if (typeof value === 'string') return value
  const v = value as { toDate?: () => Date }
  if (typeof v.toDate === 'function') return v.toDate().toISOString()
  return undefined
}

export const validateKey = functions.https.onCall(async (data) => {
  const { key, purpose, documentId } = data

  if (!key || !purpose) {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'Se requieren key y purpose'
    )
  }

  if (purpose !== 'quote' && purpose !== 'report' && purpose !== 'reception') {
    throw new functions.https.HttpsError(
      'invalid-argument',
      'purpose debe ser "quote", "report" o "reception"'
    )
  }

  const db = admin.firestore()
  const fieldName = `${purpose}_access_key`
  const snapshot = await db
    .collection('recepciones')
    .where(fieldName, '==', key)
    .limit(1)
    .get()

  if (snapshot.empty) {
    return { valid: false }
  }

  const doc = snapshot.docs[0]

  if (documentId && doc.id !== String(documentId)) {
    return { valid: false }
  }

  const docData = doc.data()

  const diagnosticosSnapshot = await doc.ref.collection('diagnosticos').get()
  const diagnosticos: Diagnostico[] = diagnosticosSnapshot.docs.map((d) => {
    const diagData = d.data()
    return {
      nombreFalla: diagData.nombreFalla ?? diagData.Nombre_falla ?? '',
      solucion: diagData.solucion ?? diagData.Solucion ?? '',
      fotos: diagData.fotos ?? diagData.Fotos ?? [],
      // `descripcion` es el nombre que escribe el panel; `nombre`, el que escribe la app
      // móvil. Leyendo solo uno de los dos, la mitad de los repuestos salían sin nombre en
      // la pantalla del cliente. Y el total de la línea se calcula si no viene guardado.
      repuestos: ((diagData.repuestos ?? diagData.Repuestos) || []).map((r: RepuestoCrudo) => {
        const cantidad = Number(r.cantidad ?? r.cant ?? 0) || 0
        const precio = Number(r.precio ?? r.pu ?? r.precioVenta ?? 0) || 0
        return {
          nombre: r.nombre || r.descripcion || r.Nombre || '',
          cantidad,
          precio,
          total: Number(r.total ?? 0) || redondear(precio * cantidad),
        }
      }),
      manoDeObra: diagData.manoDeObra ?? diagData.Mano_de_obra ?? 0,
      imagenesFinalizado: diagData.imagenes_finalizado ?? diagData.imagenesFinalizado ?? [],
      fotosfinalizar: diagData.Fotosfinalizar ?? diagData.fotosfinalizar ?? [],
      precioservicio: diagData.precioservicio ?? 0,
      nombreServicio: diagData.nombre_servicio ?? diagData.nombreServicio ?? diagData.Solucion ?? diagData.solucion ?? '',
      aprobacionCliente: diagData.aprobacionCliente ?? diagData.aprobacion_cliente ?? false,
    }
  })

  const recepcionData: RecepcionData = {
    id: doc.id,
    numeroorden: docData.numeroorden,
    nombreCliente: docData.nombreCliente ?? docData.nombre_cliente ?? '',
    telefono: docData.telefono || '',
    correoElectronico: docData.correoElectronico ?? docData.Correo_electronico ?? '',
    placa: docData.placa || '',
    marca: docData.marca || '',
    modelo: docData.modelo || '',
    anio: docData.anio ?? docData.Ano_fabricacion ?? undefined,
    nivelCombustible: docData.nivelCombustible ?? docData.Nivel_combustible ?? undefined,
    inventario: docData.inventario ?? docData.Inventario ?? undefined,
    observaciones: docData.observaciones ?? docData.Observaciones_adicionales ?? undefined,
    status: docData.status || '',
    aprobacionCotizacion: docData.aprobacionCotizacion ?? docData.aprobacion_cotizacion ?? false,
    // Los importes se calculan a partir de los diagnósticos cuando el documento no los trae.
    //
    // Una recepción NO guarda subtotal/igv/total: esos campos son de la colección de
    // comprobantes. Leyéndolos a secas, la pantalla de aprobación mostraba «Total S/ 0.00»
    // al cliente, con la mano de obra impresa justo encima, y le pedía aprobar eso.
    // Comprobado sobre una orden real: repuestos y mano de obra a la vista, total cero.
    ...calcularImportes(docData, diagnosticos),
    fechaIngreso: toIso(docData.fechaIngreso) ?? toIso(docData.fecha_creacion),
    fechaSalida: toIso(docData.fechaSalida) ?? toIso(docData.fecha_salida),
    tecnicoServicio: docData.tecnicoServicio ?? docData.tecnico_servicio ?? undefined,
    tipoServicio: docData.tipoServicio ?? docData.tipo_servicio ?? undefined,
    motivoIngreso: docData.motivoIngreso ?? docData.motivo_ingreso ?? undefined,
    fotos: docData.fotos ?? undefined,
    fotosFinalizacion: docData.fotosFinalizacion ?? docData.fotos_finalizacion ?? undefined,
    comentariosFinalizacion:
      (docData.comentariosFinalizacion ?? docData.comentarios_finalizacion ?? '')
        .trim(),
    aprobacionCliente: docData.aprobacionCliente ?? docData.aprobacion_cliente ?? false,
    diagnosticos,
  }

  return { valid: true, data: recepcionData }
})
