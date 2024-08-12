import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/pages/onboarding_screen.dart';
import 'package:khalifa/core/pages/splash_screen.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';
import 'package:khalifa/features/authentication/presentation/pages/confirmCodeScreen.dart';
import 'package:khalifa/features/authentication/presentation/pages/signIn_screen.dart';
import 'package:khalifa/features/authentication/presentation/pages/signUp_screen.dart';
import 'package:khalifa/features/home/pages/home.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return CupertinoPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case AppRouteNames.home:
        return CupertinoPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case AppRouteNames.signIn:
        return CupertinoPageRoute(
          builder: (context) => const SignInScreen(),
        );
      case AppRouteNames.signUp:
        return CupertinoPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case AppRouteNames.confirmCode:
        return CupertinoPageRoute(
          builder: (context) => const ConfirmCodeScreen(),
        );
      case AppRouteNames.onBoarding:
        return CupertinoPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
