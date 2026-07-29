import '/app_constants.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  static String routeName = 'Dashboard';
  static String routePath = '/dashboard';

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  late DashboardModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Widget _buildKpiCard(
      BuildContext context, String title, Future<int> countFuture, Color color, IconData icon) {
    return Expanded(
      child: FutureBuilder<int>(
        future: countFuture,
        builder: (context, snapshot) {
          final value = snapshot.hasData ? snapshot.data! : 0;
          return Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 28.0),
                SizedBox(height: 8.0),
                Text(
                  value.toString(),
                  style: _theme.headlineMedium.override(
                        font: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
                        color: Colors.white,
                      ),
                ),
                Text(
                  title,
                  style: _theme.labelSmall.override(
                        font: GoogleFonts.montserrat(),
                        color: Colors.white70,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
    final todayStart = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    final todayEnd = todayStart.add(Duration(days: 1));

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: _theme.primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AuthUserStreamWidget(
                        builder: (context) => InkWell(
                          onTap: () => context.pushNamed(ACuentaWidget.routeName),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    currentUserDisplayName.isNotEmpty
                                        ? currentUserDisplayName
                                        : 'Usuario',
                                    style: _theme
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w600),
                                        ),
                                  ),
                                  Text(
                                    'Ver perfil',
                                    style: _theme
                                        .labelSmall
                                        .override(
                                          font: GoogleFonts.montserrat(),
                                          color: _theme.primary,
                                          fontSize: 11.0,
                                        ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8.0),
                              Container(
                                width: 48.0,
                                height: 48.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(shape: BoxShape.circle),
                                child: (currentUserPhoto.isNotEmpty)
                                    ? Image.network(currentUserPhoto,
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            _buildInitialsAvatar())
                                    : _buildInitialsAvatar(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Resumen',
                    style: _theme.headlineSmall.override(
                          font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      _buildKpiCard(
                        context,
                        'Pendientes',
                        queryRecepcionesRecordCount(
                          queryBuilder: (q) => q.where('status', isEqualTo: 'Recepcion'),
                        ),
                        Color(0xFFE53935),
                        Icons.pending_actions,
                      ),
                      SizedBox(width: 12.0),
                      _buildKpiCard(
                        context,
                        'En reparación',
                        queryRecepcionesRecordCount(
                          queryBuilder: (q) => q.where('status', isEqualTo: FFAppConstants.Enreparacion),
                        ),
                        Color(0xFF1E88E5),
                        Icons.build_outlined,
                      ),
                      SizedBox(width: 12.0),
                      _buildKpiCard(
                        context,
                        'Completadas hoy',
                        queryRecepcionesRecordCount(
                          queryBuilder: (q) => q
                              .where('status', isEqualTo: 'Finalizado')
                              .where('fecha_creacion', isGreaterThanOrEqualTo: todayStart)
                              .where('fecha_creacion', isLessThan: todayEnd),
                        ),
                        Color(0xFF43A047),
                        Icons.check_circle_outline,
                      ),
                    ],
                  ),
                  SizedBox(height: 28.0),
                  Text(
                    'Acciones rápidas',
                    style: _theme.headlineSmall.override(
                          font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                        ),
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickAction(
                          context,
                          'Recepción\nrápida',
                          Icons.speed,
                          () => context.pushNamed(BNuevarecepcionrapidaFWidget.routeName),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: _buildQuickAction(
                          context,
                          'Recepción\ncompleta',
                          Icons.assignment,
                          () => context.pushNamed(CNuevaRecepcionCompletaFWidget.routeName),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: _buildQuickAction(
                          context,
                          'Ver\nrecepciones',
                          Icons.list_alt,
                          () => context.pushNamed(ARecepcionesInicioWidget.routeName),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 28.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Últimas recepciones',
                        style: _theme.headlineSmall.override(
                              font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  StreamBuilder<List<RecepcionesRecord>>(
                    stream: queryRecepcionesRecord(
                      queryBuilder: (q) =>
                          q.orderBy('fecha_creacion', descending: true),
                      limit: 5,
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      final list = snapshot.data!;
                      if (list.isEmpty) {
                        return _buildEmptyPlaceholder(context);
                      }
                      return Column(
                        children: list
                            .map((r) => _buildReceptionTile(context, r))
                            .toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInitialsAvatar() {
    return CircleAvatar(
      backgroundColor: _theme.primary,
      child: Text(
        (currentUserDisplayName.isNotEmpty ? currentUserDisplayName[0] : '?')
            .toUpperCase(),
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }

  Widget _buildQuickAction(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: _theme.secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: _theme.primary, size: 32.0),
            SizedBox(height: 8.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: _theme.labelMedium.override(
                    font: GoogleFonts.montserrat(),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReceptionTile(BuildContext context, RecepcionesRecord r) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            BDashBoardDiagnosticoWidget.routeName,
            queryParameters: {
              'datos': serializeParam(r, ParamType.Document),
            }.withoutNulls,
            extra: <String, dynamic>{
              'datos': r,
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        },
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: _theme.secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: _theme.alternate),
          ),
          child: Row(
            children: [
              Container(
                width: 4.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: _statusColor(r.status),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '#${r.numeroorden ?? '---'}',
                      style: _theme.bodyMedium.override(
                            font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                          ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      r.nombreCliente ?? 'Sin cliente',
                      style: _theme.labelSmall.override(
                            font: GoogleFonts.montserrat(),
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: _statusColor(r.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Text(
                  r.status ?? '',
                  style: _theme.labelSmall.override(
                        font: GoogleFonts.montserrat(),
                        color: _statusColor(r.status),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _statusColor(String? status) {
    switch (status) {
      case 'Recepcion':
        return Color(0xFFE53935);
      case 'Diagnostico':
        return Colors.orange;
      case 'Cotizacion':
        return Color(0xFF1E88E5);
      case 'Reparación':
        return Colors.deepPurple;
      case 'Finalizado':
        return Color(0xFF43A047);
      default:
        return Colors.grey;
    }
  }

  Widget _buildEmptyPlaceholder(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
      child: Column(
        children: [
          Icon(Icons.inbox_outlined,
              size: 80.0, color: _theme.alternate),
          SizedBox(height: 16.0),
          Text(
            '¡Bienvenido!',
            style: _theme.headlineMedium.override(
                  font: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                ),
          ),
          SizedBox(height: 8.0),
          Text(
            'Aún no hay recepciones registradas.\nComienza creando una nueva recepción.',
            textAlign: TextAlign.center,
            style: _theme.bodyMedium.override(
                  font: GoogleFonts.montserrat(),
                ),
          ),
          SizedBox(height: 24.0),
          FFButtonWidget(
            onPressed: () =>
                context.pushNamed(BNuevarecepcionrapidaFWidget.routeName),
            text: 'Crear primera recepción',
            options: FFButtonOptions(
              height: 45.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              color: _theme.primary,
              textStyle: _theme.titleSmall.override(
                    font: GoogleFonts.montserrat(),
                    color: Colors.white,
                  ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
