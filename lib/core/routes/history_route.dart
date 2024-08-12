import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/pages/for_product_screen.dart';
import 'package:khalifa/core/route_names/history_route_names.dart';
import 'package:khalifa/features/history/presentation/pages/history_screen.dart';

class HistoryRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HistoryRouteNames.historyScreen:
        return CupertinoPageRoute(
          builder: (context) => const HistoryScreen(),
        );
      case HistoryRouteNames.pushSingleScreen:
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
