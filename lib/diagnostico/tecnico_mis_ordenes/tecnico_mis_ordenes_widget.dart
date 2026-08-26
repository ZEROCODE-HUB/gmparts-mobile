import '/app_constants.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Órdenes asignadas al técnico que ha iniciado sesión — etapa 08 del Excel.
///
/// Hasta ahora el técnico no tenía nada suyo en la app: entraba al mismo panel que el asesor,
/// solo sin los botones de recepcionar, y el diagnóstico lo registraba el asesor. El Excel
/// dice justo lo contrario —«En proceso · Técnico / Jefe de taller · Ejecutar y reportar
/// avance»— y los campos para hacerlo (`Finalizado`, `Tiempo_finalizado`,
/// `Comentarios_finalizado`) llevaban desde el principio declarados en el esquema y leídos
/// por varias pantallas, pero NINGUNA los escribía.
///
/// Se filtra por `tecnico_servicio` (el nombre) y no por `tecnicoservicioRef`: la referencia
/// es lo correcto y ya se guarda, pero las 48 recepciones que hay en producción solo tienen
/// el texto. Filtrar por la referencia dejaría al técnico con la lista vacía el primer día.
class TecnicoMisOrdenesWidget extends StatefulWidget {
  const TecnicoMisOrdenesWidget({super.key});

  static String routeName = 'tecnico-mis-ordenes';
  static String routePath = '/tecnicoMisOrdenes';

  @override
  State<TecnicoMisOrdenesWidget> createState() => _TecnicoMisOrdenesWidgetState();
}

class _TecnicoMisOrdenesWidgetState extends State<TecnicoMisOrdenesWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /// Una orden cerrada o anulada ya no es trabajo pendiente. Se descarta aquí y no en la
  /// consulta para no exigir un índice compuesto por cada combinación de estados.
  static const _cerradas = [FFAppConstants.Finalizado, 'Anulado'];

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

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
          'Mis órdenes',
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
        child: StreamBuilder<List<RecepcionesRecord>>(
          stream: queryRecepcionesRecord(
            queryBuilder: (q) => q.where('tecnico_servicio',
                isEqualTo: currentUserDisplayName),
          ),
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

            final ordenes = snapshot.data!
                .where((r) => !_cerradas.contains(r.status))
                .toList()
              ..sort((a, b) => (b.fechaCreacion ?? DateTime(1970))
                  .compareTo(a.fechaCreacion ?? DateTime(1970)));

            if (ordenes.isEmpty) {
              return _sinTrabajo(context);
            }

            return ListView.builder(
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
              itemCount: ordenes.length,
              itemBuilder: (context, i) => _tarjeta(context, ordenes[i]),
            );
          },
        ),
      ),
    );
  }

  Widget _sinTrabajo(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.build_circle_outlined, size: 56.0, color: theme.secondaryText),
            SizedBox(height: 16.0),
            Text(
              'No tienes órdenes asignadas',
              textAlign: TextAlign.center,
              style: theme.titleMedium.override(
                font: GoogleFonts.montserrat(),
                letterSpacing: 0.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'El jefe de taller te asigna las órdenes desde el panel. Cuando tengas alguna, aparecerá aquí.',
              textAlign: TextAlign.center,
              style: theme.bodySmall.override(
                font: GoogleFonts.montserrat(),
                color: theme.secondaryText,
                letterSpacing: 0.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, RecepcionesRecord r) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () => context.pushNamed(
          TecnicoOrdenDetalleWidget.routeName,
          queryParameters: {
            'recepcion': serializeParam(r, ParamType.Document),
          }.withoutNulls,
          extra: <String, dynamic>{'recepcion': r},
        ),
        child: Container(
          decoration: BoxDecoration(
            color: theme.secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(blurRadius: 4.0, color: Color(0x1A000000), offset: Offset(0.0, 2.0)),
            ],
          ),
          padding: EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r.placa.isNotEmpty ? r.placa : 'Sin placa',
                    style: theme.titleMedium.override(
                      font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                      letterSpacing: 0.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: _colorEstado(r.status).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      r.status,
                      style: theme.bodySmall.override(
                        font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        color: _colorEstado(r.status),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.0),
              Text(
                '${r.marca} ${r.modelo}'.trim(),
                style: theme.bodySmall.override(
                  font: GoogleFonts.montserrat(),
                  color: theme.secondaryText,
                  letterSpacing: 0.0,
                ),
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Icon(Icons.confirmation_number_outlined, size: 14.0, color: theme.secondaryText),
                  SizedBox(width: 4.0),
                  Text(
                    r.codeCT.isNotEmpty ? r.codeCT : 'N.º ${r.numeroorden}',
                    style: theme.bodySmall.override(
                      font: GoogleFonts.montserrat(),
                      color: theme.secondaryText,
                      letterSpacing: 0.0,
                    ),
                  ),
                  if (r.bahia.isNotEmpty) ...[
                    SizedBox(width: 14.0),
                    Icon(Icons.garage_outlined, size: 14.0, color: theme.secondaryText),
                    SizedBox(width: 4.0),
                    Text(
                      'Bahía ${r.bahia}',
                      style: theme.bodySmall.override(
                        font: GoogleFonts.montserrat(),
                        color: theme.secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                  if (r.fechaProgramada != null) ...[
                    SizedBox(width: 14.0),
                    Icon(Icons.event_outlined, size: 14.0, color: theme.secondaryText),
                    SizedBox(width: 4.0),
                    Text(
                      dateTimeFormat('d/M/y', r.fechaProgramada),
                      style: theme.bodySmall.override(
                        font: GoogleFonts.montserrat(),
                        color: theme.secondaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _colorEstado(String status) {
    switch (status) {
      case FFAppConstants.Programado:
        return Color(0xFF00ACC1);
      case FFAppConstants.Enreparacion:
        return Colors.deepPurple;
      case FFAppConstants.ListoParaEntrega:
        return Color(0xFF00897B);
      default:
        return Colors.grey;
    }
  }
}
