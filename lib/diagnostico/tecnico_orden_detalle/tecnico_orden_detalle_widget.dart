import '/app_constants.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Fallas de una orden, para que el técnico reporte su avance — etapa 08 del Excel.
///
/// `Finalizado`, `Tiempo_finalizado` y `Comentarios_finalizado` están declarados en el
/// esquema de `diagnosticos` desde el principio y varias pantallas los LEEN, pero ninguna los
/// escribía: eran campos muertos. Aquí es donde se rellenan.
///
/// La orden pasa a «Reparación» en cuanto el técnico cierra la primera falla: si está
/// trabajando, el coche está en el elevador, y no tiene sentido que alguien tenga que ir al
/// panel a moverlo a mano.
class TecnicoOrdenDetalleWidget extends StatefulWidget {
  const TecnicoOrdenDetalleWidget({super.key, required this.recepcion});

  final RecepcionesRecord? recepcion;

  static String routeName = 'tecnico-orden-detalle';
  static String routePath = '/tecnicoOrdenDetalle';

  @override
  State<TecnicoOrdenDetalleWidget> createState() => _TecnicoOrdenDetalleWidgetState();
}

class _TecnicoOrdenDetalleWidgetState extends State<TecnicoOrdenDetalleWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _guardando = false;

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final r = widget.recepcion;

    if (r == null) {
      return Scaffold(
        backgroundColor: theme.primaryBackground,
        body: Center(child: Text('No se pudo abrir la orden.')),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        backgroundColor: theme.primary,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: theme.info, size: 24.0),
          onPressed: () => context.safePop(),
        ),
        title: Text(
          r.placa.isNotEmpty ? r.placa : 'Orden',
          style: theme.headlineMedium.override(
            font: GoogleFonts.montserrat(),
            color: theme.info,
            letterSpacing: 0.0,
          ),
        ),
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: StreamBuilder<List<DiagnosticosRecord>>(
          stream: queryDiagnosticosRecord(parent: r.reference),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(theme.primary),
                  ),
                ),
              );
            }

            final fallas = snapshot.data!;
            if (fallas.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'Esta orden todavía no tiene fallas registradas. El diagnóstico lo hace el asesor.',
                    textAlign: TextAlign.center,
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.montserrat(),
                      color: theme.secondaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              );
            }

            final pendientes = fallas.where((f) => !f.finalizado).length;

            return ListView(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
              children: [
                Text(
                  pendientes == 0
                      ? 'Todas las fallas están cerradas'
                      : '$pendientes falla${pendientes == 1 ? '' : 's'} por cerrar',
                  style: theme.titleSmall.override(
                    font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                    letterSpacing: 0.0,
                  ),
                ),
                SizedBox(height: 12.0),
                ...fallas.map((f) => _falla(context, r, f)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _falla(BuildContext context, RecepcionesRecord r, DiagnosticosRecord f) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: f.finalizado ? Color(0xFF43A047) : theme.alternate,
            width: f.finalizado ? 1.5 : 1.0,
          ),
        ),
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    f.nombreFalla.isNotEmpty ? f.nombreFalla : 'Falla sin nombre',
                    style: theme.titleSmall.override(
                      font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
                if (f.finalizado)
                  Icon(Icons.check_circle, color: Color(0xFF43A047), size: 22.0),
              ],
            ),
            if (f.solucion.isNotEmpty) ...[
              SizedBox(height: 6.0),
              Text(
                f.solucion,
                style: theme.bodySmall.override(
                  font: GoogleFonts.montserrat(),
                  color: theme.secondaryText,
                  letterSpacing: 0.0,
                ),
              ),
            ],
            SizedBox(height: 10.0),
            if (f.finalizado)
              Text(
                'Cerrada · ${f.tiempoFinalizado} h'
                '${f.comentariosFinalizado.isNotEmpty ? ' · ${f.comentariosFinalizado}' : ''}',
                style: theme.bodySmall.override(
                  font: GoogleFonts.montserrat(),
                  color: Color(0xFF43A047),
                  letterSpacing: 0.0,
                ),
              )
            else
              TextButton.icon(
                onPressed: _guardando ? null : () => _abrirCierre(context, r, f),
                icon: Icon(Icons.done_all, size: 18.0),
                label: Text(
                  'Marcar como terminada',
                  style: theme.bodyMedium.override(
                    font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                    color: theme.primary,
                    letterSpacing: 0.0,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _abrirCierre(
      BuildContext context, RecepcionesRecord r, DiagnosticosRecord f) async {
    final horasCtrl = TextEditingController();
    final comentarioCtrl = TextEditingController();
    final formKey = GlobalKey<FormState>();

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        final theme = FlutterFlowTheme.of(ctx);
        return Padding(
          padding: MediaQuery.viewInsetsOf(ctx),
          child: Container(
            decoration: BoxDecoration(
              color: theme.secondaryBackground,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            ),
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 28.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cerrar «${f.nombreFalla}»',
                    style: theme.titleMedium.override(
                      font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      letterSpacing: 0.0,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: horasCtrl,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Horas empleadas',
                      hintText: 'Ejem: 2 o 1.5',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    // Mismo criterio que el tiempo estimado: solo un numero. Ahi el campo
                    // aceptaba texto libre y «2 dias» se convertia en cero horas, con lo que
                    // la mano de obra se facturaba a cero.
                    validator: (v) {
                      final horas = double.tryParse((v ?? '').trim().replaceAll(',', '.'));
                      if (horas == null) return 'Escribe solo el número de horas';
                      if (horas <= 0) return 'Tiene que ser mayor que cero';
                      return null;
                    },
                  ),
                  SizedBox(height: 12.0),
                  TextFormField(
                    controller: comentarioCtrl,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Comentarios del trabajo',
                      hintText: 'Qué se hizo, repuestos usados, observaciones…',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() != true) return;
                        Navigator.of(ctx).pop(true);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Text('Guardar y cerrar falla'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ).then((confirmado) async {
      if (confirmado != true) return;
      await _cerrarFalla(
        r,
        f,
        double.tryParse(horasCtrl.text.trim().replaceAll(',', '.')) ?? 0.0,
        comentarioCtrl.text.trim(),
      );
    });

    horasCtrl.dispose();
    comentarioCtrl.dispose();
  }

  Future<void> _cerrarFalla(
      RecepcionesRecord r, DiagnosticosRecord f, double horas, String comentario) async {
    setState(() => _guardando = true);
    try {
      await f.reference.update({
        'Finalizado': true,
        'Tiempo_finalizado': horas,
        'Comentarios_finalizado': comentario,
        'finalizadoPor': currentUserUid,
        'finalizadoAt': FieldValue.serverTimestamp(),
      });

      // Si el tecnico esta cerrando fallas, el coche esta en el elevador. Se mueve la orden
      // desde «Programado» sin obligar a nadie a ir al panel a hacerlo a mano. No se toca
      // ningun otro estado: pasar de «Listo para entrega» a «Reparacion» seria retroceder.
      if (r.status == FFAppConstants.Programado) {
        await r.reference.update({'status': FFAppConstants.Enreparacion});
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Falla cerrada. Buen trabajo.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No se pudo guardar. Revisa tu conexión e inténtalo de nuevo.'),
            duration: Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _guardando = false);
    }
  }
}
