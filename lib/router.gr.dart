// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:dice_roll/Screens/history.dart' as _i2;
import 'package:dice_roll/Screens/home.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HistoryPage.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child:  _i1.HomePage());
    },
    History.name: (routeData) {
      final args = routeData.argsAs<HistoryArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.History(key: args.key,));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HistoryPage.name, path: '/'),
        _i3.RouteConfig(History.name, path: '/History')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HistoryPage extends _i3.PageRouteInfo<void> {
  const HistoryPage() : super(HistoryPage.name, path: '/');

  static const String name = 'HistoryPage';
}

/// generated route for
/// [_i2.History]
class History extends _i3.PageRouteInfo<HistoryArgs> {
  History({_i4.Key? key, required String title})
      : super(History.name,
            path: '/History', args: HistoryArgs(key: key, title: title));

  static const String name = 'History';
}

class HistoryArgs {
  const HistoryArgs({this.key, required this.title});

  final _i4.Key? key;

  final String title;

  @override
  String toString() {
    return 'HistoryArgs{key: $key, title: $title}';
  }
}
