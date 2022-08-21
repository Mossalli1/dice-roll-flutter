// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
// @MaterialAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:dice_roll/Screens/history.dart';
import 'package:dice_roll/Screens/home.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Home,History',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: History),
  ],
)
class $AppRouter {}
