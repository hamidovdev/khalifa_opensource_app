import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final ins = GetIt.I;

Future<void> getItInjector() async {
  ins.registerSingletonAsync(
    () async => Dio(),
  );
  ins.registerSingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );
}
