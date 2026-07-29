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
            if (false) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Debe loguearse en la app móvil',
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
                  duration: Duration(milliseconds: 4000),
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
            } else {
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
            }
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
                  'Debe loguearse en web Admin',
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
                duration: Duration(milliseconds: 4000),
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
