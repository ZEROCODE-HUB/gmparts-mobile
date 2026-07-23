import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SplashWidget() : IniciarSessionWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SplashWidget()
              : IniciarSessionWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: IniciarSessionWidget.routeName,
          path: IniciarSessionWidget.routePath,
          builder: (context, params) => IniciarSessionWidget(),
        ),
        FFRoute(
          name: RestaurarContrasena1Widget.routeName,
          path: RestaurarContrasena1Widget.routePath,
          builder: (context, params) => RestaurarContrasena1Widget(),
        ),
        FFRoute(
          name: RestaurarContrasena3Widget.routeName,
          path: RestaurarContrasena3Widget.routePath,
          builder: (context, params) => RestaurarContrasena3Widget(),
        ),
        FFRoute(
          name: RestaurarContrasena2Widget.routeName,
          path: RestaurarContrasena2Widget.routePath,
          builder: (context, params) => RestaurarContrasena2Widget(),
        ),
        FFRoute(
          name: BNuevarecepcionrapidaFWidget.routeName,
          path: BNuevarecepcionrapidaFWidget.routePath,
          builder: (context, params) => BNuevarecepcionrapidaFWidget(
            recepcionid: params.getParam(
              'recepcionid',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['recepciones'],
            ),
          ),
        ),
        FFRoute(
          name: CNuevaRecepcionCompletaFWidget.routeName,
          path: CNuevaRecepcionCompletaFWidget.routePath,
          builder: (context, params) => CNuevaRecepcionCompletaFWidget(
            inventario: params.getParam<String>(
              'inventario',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: GLinkclienteWidget.routeName,
          path: GLinkclienteWidget.routePath,
          builder: (context, params) => GLinkclienteWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HLinkGMParts2Widget.routeName,
          path: HLinkGMParts2Widget.routePath,
          builder: (context, params) => HLinkGMParts2Widget(),
        ),
        FFRoute(
          name: INuevarecrapidaWidget.routeName,
          path: INuevarecrapidaWidget.routePath,
          builder: (context, params) => INuevarecrapidaWidget(),
        ),
        FFRoute(
          name: FRecepcionGuardadaWidget.routeName,
          path: FRecepcionGuardadaWidget.routePath,
          builder: (context, params) => FRecepcionGuardadaWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: ARecepcionesInicioWidget.routeName,
          path: ARecepcionesInicioWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ARecepcionesInicioWidget(),
        ),
        FFRoute(
          name: BDashBoardDiagnosticoWidget.routeName,
          path: BDashBoardDiagnosticoWidget.routePath,
          asyncParams: {
            'datos': getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => BDashBoardDiagnosticoWidget(
            datos: params.getParam(
              'datos',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DCotizacionWidget.routeName,
          path: DCotizacionWidget.routePath,
          builder: (context, params) => DCotizacionWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: EDiagnosticoWidget.routeName,
          path: EDiagnosticoWidget.routePath,
          builder: (context, params) => EDiagnosticoWidget(
            numeroorden: params.getParam(
              'numeroorden',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: FDiagnosticoWidget.routeName,
          path: FDiagnosticoWidget.routePath,
          builder: (context, params) => FDiagnosticoWidget(),
        ),
        FFRoute(
          name: Controldecalidadtecnico2Widget.routeName,
          path: Controldecalidadtecnico2Widget.routePath,
          builder: (context, params) => Controldecalidadtecnico2Widget(
            idrecep: params.getParam(
              'idrecep',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['recepciones'],
            ),
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DashBoard2CopyCopyWidget.routeName,
          path: DashBoard2CopyCopyWidget.routePath,
          builder: (context, params) => DashBoard2CopyCopyWidget(),
        ),
        FFRoute(
          name: EncuestaclienteWidget.routeName,
          path: EncuestaclienteWidget.routePath,
          builder: (context, params) => EncuestaclienteWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: GLinkclienteCotizacionWidget.routeName,
          path: GLinkclienteCotizacionWidget.routePath,
          builder: (context, params) => GLinkclienteCotizacionWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: HAprobacionclientecotizWidget.routeName,
          path: HAprobacionclientecotizWidget.routePath,
          builder: (context, params) => HAprobacionclientecotizWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CDashBoard2FinalizarWidget.routeName,
          path: CDashBoard2FinalizarWidget.routePath,
          asyncParams: {
            'recepcion':
                getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => CDashBoard2FinalizarWidget(
            recepcion: params.getParam(
              'recepcion',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: BDetalleestaticoWidget.routeName,
          path: BDetalleestaticoWidget.routePath,
          asyncParams: {
            'datos': getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => BDetalleestaticoWidget(
            datos: params.getParam(
              'datos',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DControldecalidadenviarclienteWidget.routeName,
          path: DControldecalidadenviarclienteWidget.routePath,
          builder: (context, params) => DControldecalidadenviarclienteWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: DFinalizadoWidget.routeName,
          path: DFinalizadoWidget.routePath,
          builder: (context, params) => DFinalizadoWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            refrece: params.getParam(
              'refrece',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['recepciones'],
            ),
          ),
        ),
        FFRoute(
          name: DFinclienteWidget.routeName,
          path: DFinclienteWidget.routePath,
          builder: (context, params) => DFinclienteWidget(),
        ),

        FFRoute(
          name: CrearCotizacionFuncionandoWidget.routeName,
          path: CrearCotizacionFuncionandoWidget.routePath,
          asyncParams: {
            'recepcion':
                getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => CrearCotizacionFuncionandoWidget(
            recepcion: params.getParam(
              'recepcion',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EncuestaclientevWidget.routeName,
          path: EncuestaclientevWidget.routePath,
          builder: (context, params) => EncuestaclientevWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CDashBoard2FinalizadoWidget.routeName,
          path: CDashBoard2FinalizadoWidget.routePath,
          asyncParams: {
            'recepcion':
                getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => CDashBoard2FinalizadoWidget(
            recepcion: params.getParam(
              'recepcion',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: DControldecalidadenviarclientePreWidget.routeName,
          path: DControldecalidadenviarclientePreWidget.routePath,
          builder: (context, params) => DControldecalidadenviarclientePreWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
            idrecep: params.getParam(
              'idrecep',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['recepciones'],
            ),
          ),
        ),
        FFRoute(
          name: ZNuevacontrasenaWidget.routeName,
          path: ZNuevacontrasenaWidget.routePath,
          builder: (context, params) => ZNuevacontrasenaWidget(),
        ),
        FFRoute(
          name: PrivacyWidget.routeName,
          path: PrivacyWidget.routePath,
          builder: (context, params) => PrivacyWidget(),
        ),
        FFRoute(
          name: CotizacionFuncionandoWidget.routeName,
          path: CotizacionFuncionandoWidget.routePath,
          asyncParams: {
            'recepcion':
                getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => CotizacionFuncionandoWidget(
            recepcion: params.getParam(
              'recepcion',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ACuentaWidget.routeName,
          path: ACuentaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => ACuentaWidget(),
        ),
        FFRoute(
          name: AConfirmarBorrarCuentaWidget.routeName,
          path: AConfirmarBorrarCuentaWidget.routePath,
          requireAuth: true,
          builder: (context, params) => AConfirmarBorrarCuentaWidget(),
        ),
        FFRoute(
          name: DetalleFallasWidget.routeName,
          path: DetalleFallasWidget.routePath,
          builder: (context, params) => DetalleFallasWidget(
            nroOrdden: params.getParam(
              'nroOrdden',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: GLinkclienteCopyWidget.routeName,
          path: GLinkclienteCopyWidget.routePath,
          builder: (context, params) => GLinkclienteCopyWidget(
            id: params.getParam(
              'id',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: CrearCotizacionFuncionandoCopyWidget.routeName,
          path: CrearCotizacionFuncionandoCopyWidget.routePath,
          asyncParams: {
            'recepcion':
                getDoc(['recepciones'], RecepcionesRecord.fromSnapshot),
          },
          builder: (context, params) => CrearCotizacionFuncionandoCopyWidget(
            recepcion: params.getParam(
              'recepcion',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/iniciarSession';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
