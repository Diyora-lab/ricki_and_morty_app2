import 'package:auto_route/auto_route.dart';
import 'package:ricki_and_morty_app2/core/config/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: ProfileCharactersRoute.page)
      ];
}
