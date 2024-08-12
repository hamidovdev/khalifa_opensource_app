import 'package:dio/dio.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getUserInfo();
  Future<bool> updateUserInfo(ProfileModel user);

  factory ProfileDataSource() => _ProfileDataSourceImpl();
}

class _ProfileDataSourceImpl implements ProfileDataSource {
  final headers = {
    'Authorization': 'Token ${ins<SharedPreferences>().getString("token")}',
  };
  @override
  Future<ProfileModel> getUserInfo() async {
    try {
      print("Profile ishladi");
      final data = await ins<Dio>().get(
        "http://13.48.130.141/auth/user-info",
        options: Options(
          headers: headers,
        ),
      );
      print("Profile Data=> ${data.data}");
      return ProfileModel.fromJson(data.data);
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<bool> updateUserInfo(ProfileModel user) async {
    try {
      print("Birnchi kelgan datalar \n ${user.toJson()}}");

      final result =
          await ins<Dio>().put("http://13.48.130.141/auth/user-update",
              data: user.toJson(),
              options: Options(
                headers: headers,
              ));

      print("Ikkinchi data => ${result.data}");
      return true;
    } catch (e) {
      print("Xatolik bu $e");
      throw const ServerFailure();
    }
  }
}
