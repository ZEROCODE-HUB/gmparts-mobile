'use strict'

const test = require('node:test')
const assert = require('node:assert/strict')

const {
  detectRecepcionEvents,
  EVENT_ROLES,
  buildEventPayload,
  buildRoleVariants,
} = require('../lib/pushEvent')

const createRecord = {
  numeroorden: 1024,
  nombre_cliente: 'Juan Pérez',
  placa: 'ABC-123',
  status: 'Recepción',
}

test('create: se dispara recepcion_creada', () => {
  assert.deepEqual(detectRecepcionEvents(null, { ...createRecord }), [
    'recepcion_creada',
  ])
})

test('delete (after null): no hay eventos', () => {
  assert.deepEqual(detectRecepcionEvents({ ...createRecord }, null), [])
})

test('cliente aprueba recepcion: aprobacion_cliente false -> true', () => {
  const before = { ...createRecord, aprobacion_cliente: false, status: 'Recepción' }
  const after = { ...createRecord, aprobacion_cliente: true, status: 'Diagnóstico' }
  assert.deepEqual(detectRecepcionEvents(before, after), [
    'cliente_aprueba_recepcion',
  ])
})

test('cliente aprueba cotizacion: aprobacion_cotizacion -> true', () => {
  const before = { ...createRecord, aprobacion_cotizacion: false, status: 'Cotización' }
  const after = { ...createRecord, aprobacion_cotizacion: true, status: 'Reparación' }
  assert.deepEqual(detectRecepcionEvents(before, after), [
    'cliente_aprueba_cotizacion',
  ])
})

test('vehiculo finalizado: status -> Finalizado', () => {
  const before = { ...createRecord, status: 'Reparación' }
  const after = { ...createRecord, status: 'Finalizado' }
  assert.deepEqual(detectRecepcionEvents(before, after), ['vehiculo_finalizado'])
})

test('status fuera de Finalizado no genera evento', () => {
  const before = { ...createRecord, status: 'Recepción' }
  const after = { ...createRecord, status: 'Diagnóstico' }
  assert.deepEqual(detectRecepcionEvents(before, after), [])
})

test('factura emitida: facturado -> true', () => {
  const before = { ...createRecord, status: 'Finalizado', facturado: false }
  const after = { ...createRecord, status: 'Finalizado', facturado: true }
  assert.deepEqual(detectRecepcionEvents(before, after), ['factura_emitida'])
})

test('cliente aprueba reporte: Clientecontrolcalidad1 vacio -> valor', () => {
  const before = {
    ...createRecord,
    status: 'Reparación',
    Clientecontrolcalidad1: '',
  }
  const after = {
    ...createRecord,
    status: 'Finalizado',
    Clientecontrolcalidad1: '5',
    Clientecontrolcalidad2: '4',
    Clientecontrolcalidad3: '5',
    Clientecontrolcalidad4: 'Excelente servicio',
  }
  assert.deepEqual(detectRecepcionEvents(before, after), [
    'vehiculo_finalizado',
    'cliente_aprueba_reporte',
  ])
})

test('eventos combinados en approveReport: finalizado + reporte', () => {
  const before = { ...createRecord, status: 'Reparación' }
  const after = {
    ...createRecord,
    status: 'Finalizado',
    Clientecontrolcalidad1: '5',
  }
  const events = detectRecepcionEvents(before, after)
  assert.ok(events.includes('vehiculo_finalizado'))
  assert.ok(events.includes('cliente_aprueba_reporte'))
})

test('evento con status en minusculas tambien detecta finalizado', () => {
  const before = { ...createRecord, status: 'Reparación' }
  const after = { ...createRecord, status: 'finalizado' }
  assert.deepEqual(detectRecepcionEvents(before, after), ['vehiculo_finalizado'])
})

test('roles: eventos 1-5 incluyen Admin, Gerente General y Jefe de Taller', () => {
  const directivos = ['Admin', 'Administrador', 'Gerente General', 'Jefe de Taller']
  for (const event of [
    'recepcion_creada',
    'cliente_aprueba_recepcion',
    'cliente_aprueba_cotizacion',
    'vehiculo_finalizado',
    'factura_emitida',
  ]) {
    for (const role of directivos) {
      assert.ok(
        EVENT_ROLES[event].includes(role),
        `${event} debe incluir el rol ${role}`
      )
    }
  }
})

test('roles: cliente_aprueba_reporte va a Admin, Gerente General y Encargado (sin Jefe de Taller)', () => {
  const roles = EVENT_ROLES['cliente_aprueba_reporte']
  assert.ok(roles.includes('Admin'))
  assert.ok(roles.includes('Administrador'))
  assert.ok(roles.includes('Gerente General'))
  assert.ok(roles.includes('Encargado'))
  assert.ok(!roles.includes('Jefe de Taller'))
})

test('buildEventPayload: datos incluidos en title/body/data', () => {
  const payload = buildEventPayload(
    'cliente_aprueba_cotizacion',
    { ...createRecord, nombre_cliente: 'María Gomez', placa: 'XYZ-999' },
    'doc-123'
  )
  assert.equal(payload.data.event, 'cliente_aprueba_cotizacion')
  assert.equal(payload.data.recepcionId, 'doc-123')
  assert.match(payload.body, /María Gomez/)
  assert.match(payload.body, /#1024/)
  assert.match(payload.title, /aprobó la cotización/i)
  assert.ok(payload.body.length > 0)
})

test('buildEventPayload: sin cliente siempre genera body no vacio', () => {
  const payload = buildEventPayload('recepcion_creada', { placa: 'X-1' }, 'doc-1')
  assert.ok(payload.body.length > 0)
  assert.match(payload.body, /X-1/)
})

test('mensaje FCM: notification debe contener title/body y data al mismo nivel', () => {
  const payload = buildEventPayload(
    'cliente_aprueba_cotizacion',
    createRecord,
    'doc-123'
  )
  const message = {
    tokens: ['tok-1'],
    notification: { title: payload.title, body: payload.body },
    data: payload.data,
  }
  assert.equal(typeof message.notification, 'object')
  assert.ok(message.notification.title.length > 0)
  assert.ok(message.notification.body.length > 0)
  assert.equal(message.data.event, 'cliente_aprueba_cotizacion')
  assert.ok(!('title' in message))
  assert.ok(!('body' in message))
})

test('buildRoleVariants: genera variantes minuscula y mantiene la original', () => {
  const result = buildRoleVariants(['Gerente General', 'Admin'])
  assert.ok(result.includes('Gerente General'))
  assert.ok(result.includes('gerente general'))
  assert.ok(result.includes('Admin'))
  assert.ok(result.includes('admin'))
})

test('buildRoleVariants: ignora roles vacios y no duplica', () => {
  const result = buildRoleVariants(['Encargado', '  ', 'Encargado', ''])
  assert.deepEqual(result.includes('  '), false)
  assert.equal(result.length, 2)
  assert.ok(result.includes('Encargado'))
  assert.ok(result.includes('encargado'))
})

test('buildRoleVariants: variantes de cada evento respetan limite de 10 del in de Firestore', () => {
  for (const event of Object.keys(EVENT_ROLES)) {
    const variants = buildRoleVariants(EVENT_ROLES[event])
    assert.ok(
      variants.length <= 10,
      `Evento ${event}: ${variants.length} variantes excede el limite de Firestore (10)`
    )
  }
})