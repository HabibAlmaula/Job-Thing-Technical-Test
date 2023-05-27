import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

class AppRouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Logger().i('New route pushed: ${route.settings.name}');
    if (previousRoute != null) {
      Logger().i('previous route: ${previousRoute.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    Logger().i('back to route: ${route.settings.name}');
    Logger().i('previous route: ${previousRoute!.settings.name}');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    Logger().i('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    Logger().i('Tab route re-visited: ${route.name}');
  }
}
