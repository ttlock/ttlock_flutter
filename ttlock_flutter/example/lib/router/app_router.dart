// Callers: MaterialApp.router. Affected API: redirect gate for config then login.
// Schema: none. User: 无凭证强制 /config；有凭证未登录 /login；空 token 不算登录.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ttlock_flutter_demo/router/routes.dart';
import 'package:ttlock_flutter_demo/services/app_config_service/app_config_service.dart';
import 'package:ttlock_flutter_demo/services/user_service/user_provider.dart';

Widget withRouteBackGuard(Widget child) => _RouteBackGuard(child: child);

class _RouteBackGuard extends StatelessWidget {
  const _RouteBackGuard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => PopScope(canPop: true, child: child);
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  ref.listen(userProvider, (_, _) => refresh.value++);
  ref.listen(appConfigServiceProvider, (_, _) => refresh.value++);
  ref.onDispose(refresh.dispose);

  return GoRouter(
    initialLocation: RoutePaths.home,
    refreshListenable: refresh,
    redirect: (context, state) {
      final hasCredentials = ref.read(appConfigServiceProvider).hasCredentials;
      final loggedIn = ref.read(userProvider)?.accessToken.isNotEmpty == true;
      final loc = state.matchedLocation;
      final onConfig = loc == RoutePaths.config;
      final onAuth = loc == RoutePaths.login || loc == RoutePaths.register;

      if (!hasCredentials) {
        return onConfig ? null : RoutePaths.config;
      }
      if (!loggedIn && !onAuth && !onConfig) return RoutePaths.login;
      if (loggedIn && onAuth) return RoutePaths.home;
      return null;
    },
    routes: $appRoutes,
  );
});
