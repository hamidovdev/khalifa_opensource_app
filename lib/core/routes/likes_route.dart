import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/pages/for_product_screen.dart';
import 'package:khalifa/core/route_names/likes_screen_route_names.dart';
import 'package:khalifa/features/likes/presentation/pages/likes_screen.dart';

class LikesRoute {
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case LikesRouteNames.likesScreen:
        return CupertinoPageRoute(
          builder: (context) => const LikesScreen(),
        );
      case LikesRouteNames.pushSingleScreen:
        return CupertinoPageRoute(
          fullscreenDialog: true,
          builder: (
            context,
          ) =>
              ForProductScreen(productId: settings.arguments as int),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
