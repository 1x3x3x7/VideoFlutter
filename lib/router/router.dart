import 'package:flutter/material.dart';
import 'package:video_flutter/router/route_aware_widget.dart';
import 'package:video_flutter/screen/home_screen.dart';
import 'package:video_flutter/screen/video_screen.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case AppRoutes.home_screen:
        return _WrapRoute(HomeScreen(), settings: settings);
      case AppRoutes.video_screen:
        return _WrapRoute(VideoScreen(), settings: settings);
      default:
        return _WrapRoute(
            Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ),
            settings: settings);
    }
  }
}

class _WrapRoute<T> extends MaterialPageRoute<T> {
  _WrapRoute(Widget widget, {RouteSettings? settings})
      : super(
            builder: (_) => RouteAwareWidget(child: widget),
            settings: settings);

  // @override
  // Widget buildTransitions(BuildContext context, Animation<double> animation,
  //     Animation<double> secondaryAnimation, Widget child) {
  //   if (settings.name == AppRoutes.home_screen) return child;
  //   return SlideTransition(
  //       position: new Tween<Offset>(
  //         begin: const Offset(0.0, 1.0),
  //         end: Offset.zero,
  //       ).animate(animation),
  //       child: child);
  // }
}
