import 'package:flutter/material.dart';
import 'package:dice_roll/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();

  App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
