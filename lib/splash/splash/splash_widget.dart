import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'Splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  FlutterFlowTheme get _theme => FlutterFlowTheme.of(context);

  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      try {
        if (loggedIn) {
          _model.userread = await UsersRecord
              .getDocumentOnce(currentUserReference!)
              .timeout(const Duration(seconds: 5));
          final role = _model.userread?.userRole.trim().toLowerCase();
          if (role == 'administrador' ||
              role == 'gerente general' ||
              role == 'jefe de taller' ||
              role == 'asesor servicio') {
            context.goNamedAuth(
              DashboardWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          } else if (role == 'tecnico mecanico') {
            // La rama que expulsaba al tecnico al login estaba desactivada con un
            // `if (false)`: codigo muerto que ademas mostraba «Debe loguearse en la app
            // movil» DENTRO de la propia app movil. El tecnico entra al panel del taller,
            // que es su herramienta; lo que se recorta segun el rol son las acciones de
            // dentro (ver dashboard_widget: recepcionar es del asesor).
              context.goNamedAuth(
                DashboardWidget.routeName,
                context.mounted,
                extra: <String, dynamic>{
                  '__transition_info__': TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                  ),
                },
              );

              return;
          } else if (role == 'asesor repuesto') {
            context.goNamedAuth(
              DashboardWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  // Este aviso lo ve, sobre todo, un CLIENTE. El texto anterior decía
                  // «Debe loguearse en web Admin» y los empujaba al panel del taller, que
                  // no tiene ninguna pantalla para ellos: al entrar veían el escritorio
                  // interno con los datos del resto de clientes. El cliente no necesita
                  // ninguna cuenta — accede con el enlace que le envía el taller.
                  'Esta cuenta no es de personal del taller. Si eres cliente, abre el enlace que te enviamos para ver tu vehículo.',
                  style: _theme.labelLarge.override(
                        font: GoogleFonts.montserrat(
                          fontWeight: _theme
                              .labelLarge
                              .fontWeight,
                          fontStyle: _theme
                              .labelLarge
                              .fontStyle,
                        ),
                        color: _theme.primaryText,
                        letterSpacing: 0.0,
                        fontWeight: _theme
                            .labelLarge
                            .fontWeight,
                        fontStyle: _theme
                            .labelLarge
                            .fontStyle,
                      ),
                ),
                // El mensaje es más largo que el anterior y tiene que dar tiempo a leerlo
                // antes de que la sesión se cierre y vuelva a la pantalla de acceso.
                duration: Duration(milliseconds: 7000),
                backgroundColor: _theme.primary,
              ),
            );
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            context.goNamedAuth(
              IniciarSessionWidget.routeName,
              context.mounted,
              extra: <String, dynamic>{
                '__transition_info__': TransitionInfo(
                  hasTransition: true,
                  transitionType: PageTransitionType.fade,
                  duration: Duration(milliseconds: 0),
                ),
              },
            );

            return;
          }
        } else {
          context.goNamedAuth(
            IniciarSessionWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          return;
        }
      } catch (_) {
        if (context.mounted) {
          GoRouter.of(context).prepareAuthEvent();
          await authManager.signOut();
          GoRouter.of(context).clearRedirectLocation();
          context.goNamedAuth(
            IniciarSessionWidget.routeName,
            context.mounted,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = FlutterFlowTheme.of(context);
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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.asset(
                'assets/images/Splash.png',
                width: 300.0,
                height: 200.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
