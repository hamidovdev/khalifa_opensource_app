import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/pages/for_product_screen.dart';
import 'package:khalifa/core/route_names/basket_route_names.dart';
import 'package:khalifa/features/basket/presentation/pages/basket_screen.dart';

class BasketRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case BasketRouteNames.basketScreen:
        return CupertinoPageRoute(
          builder: (context) => const BasketScreen(),
        );
      case BasketRouteNames.pushSingleScreen:
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
