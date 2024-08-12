import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/route_names/profile_route_names.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/presentation/pages/about_app.dart';
import 'package:khalifa/features/profile/presentation/pages/profileEditScreen.dart';
import 'package:khalifa/features/profile/presentation/pages/profile_screen.dart';

class ProfileRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProfileRouteNames.profileScreen:
        return CupertinoPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case ProfileRouteNames.profileEditScreen:
        return CupertinoPageRoute(
          builder: (context) => ProfileEditScreen(
            user: settings.arguments as ProfileModel,
          ),
        );
      case ProfileRouteNames.aboutApp:
        return CupertinoPageRoute(
          builder: (context) => const AboutApp(),
        );

      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
