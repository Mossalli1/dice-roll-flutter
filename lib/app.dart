import 'package:flutter/material.dart';

import 'Screens/home.dart';
import 'package:dice_roll/router.gr.dart';

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({super.key, });
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // home: const MyHomePage(title: 'Dice roll - flutter application'),
      // builder: ExtendedNavigator.builder(
      //   router: FlutterRouter(),
      //   initialRoute: Routes.homePage,
      //   builder: (_, navigator) => Theme(
      //     data: ThemeData.dark(),
      //     child: navigator,
      //   ),
      // ),
    );
  }
}

