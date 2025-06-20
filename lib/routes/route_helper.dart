import 'package:bloc_structure_setup/routes/route_transition.dart';
import 'package:go_router/go_router.dart';
import '../features/splash/view/splash_page.dart';
import 'app_routes.dart';
import '../features/home/view/home_page.dart';
// @blocgen-imports

class RouterHelper {
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.SPLASH,
        name: Routes.SPLASH,
        pageBuilder: (context, state) {
          return RouteTransition.fadeTransition(state: state, context: context, child: const SplashPage());
        },
      ),
      GoRoute(
        path: Routes.HOME,
        name: Routes.HOME,
        pageBuilder: (context, state) {
          return RouteTransition.fadeTransition(state: state, context: context, child: const HomePage());
        },
      ),

      // @blocgen-code
    ],
  );
}
