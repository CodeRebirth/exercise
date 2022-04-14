import 'package:auto_route/auto_route.dart';
import 'package:exercise/presentation/details/details.dart';
import 'package:exercise/presentation/home/home.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(
      page: Details,
    )
  ],
)
// extend the generated private router
class $AppRouter {}
