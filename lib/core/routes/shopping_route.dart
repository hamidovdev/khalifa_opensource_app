import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/pages/for_product_screen.dart';
import 'package:khalifa/core/route_names/shopping_route_names.dart';
import 'package:khalifa/features/shopping/presentation/pages/shopping_screen.dart';

class ShoppingRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ShoppingRouteNames.shoppingScreen:
        return CupertinoPageRoute(
          builder: (context) => const ShoppingScreen(),
        );
      case ShoppingRouteNames.pushSingleScreen:
        return CupertinoPageRoute(
          builder: (context) =>
              ForProductScreen(productId: settings.arguments as int),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
