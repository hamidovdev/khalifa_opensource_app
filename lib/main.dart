import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:khalifa/assets/theme.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/routes/app_route.dart';
import 'package:khalifa/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:khalifa/features/basket/presentation/bloc/basket_bloc.dart';
import 'package:khalifa/features/home/bloc/bloc/home_bloc.dart';
import 'package:khalifa/features/likes/presentation/bloc/likes_bloc.dart';
import 'package:khalifa/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:khalifa/features/shopping/presentation/bloc/shopping_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await getItInjector();
  print("*** App Started ***");
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // String appName = packageInfo.appName;
  // String packageName = packageInfo.packageName;
  // String version = packageInfo.version;
  // String buildNumber = packageInfo.buildNumber;

  // print("Platform name => $appName");
  // print("Package name => $packageName");
  // print("Platform version => ${Version.parse(version)}");
  // print("Platform buildNumber => $buildNumber");
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale("en", "EN"),
      Locale("uz", "UZ"),
      Locale("ru", "RU"),
    ],
    path: "asset/translations",
    fallbackLocale: const Locale("uz", "UZ"),
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthenticationBloc(),
            ),
            BlocProvider(
              create: (context) => HomeBloc(),
            ),
            BlocProvider(
              create: (context) => ShoppingBloc(),
            ),
            BlocProvider(
              create: (context) => LikesBloc(),
            ),
            BlocProvider(
              create: (context) => BasketBloc(),
            ),
            BlocProvider(
              create: (context) => ProfileBloc(),
            ),
          ],
          child: MaterialApp(
            onGenerateRoute: AppRoute.onGenerateRoute,
            theme: AppTheme().lightTheme(),
            darkTheme: context.theme.darkTheme(),
            themeMode: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          )),
    );
  }
}
