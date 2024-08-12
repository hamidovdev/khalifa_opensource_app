import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/route_names/app_route_names.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/features/authentication/presentation/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<AuthenticationBloc>().add(GetUserEvent());
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.authStatus == AuthStatus.unAuthentication) {
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouteNames.onBoarding,
                (route) => false,
              );
            },
          );
        } else if (state.authStatus == AuthStatus.authentication) {
          Timer(
            const Duration(seconds: 3),
            () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouteNames.home,
                (route) => false,
              );
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Padding(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).height / 20),
                child: Image.asset(
                  context.icons.logo,
                ),
              ),
              SpinKitChasingDots(
                color: context.colors.dark1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
