import 'package:dio/dio.dart';
import 'package:khalifa/core/base_url/url.dart';
import 'package:khalifa/core/exception/exception.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthDataSource {
  Future<AuthStatus> getUser();
  Future<AuthModel> signUp(String email, String password);
  Future<bool> confirmCode(String email, int confirmationCode);
  Future<AuthEntity> getToken(String email, String password);
  Future<AuthEntity> signIn(String email, String password);
  Future<bool> logout();
  factory AuthDataSource() => _AuthDataSourceImpl();
}

class _AuthDataSourceImpl implements AuthDataSource {
  final headers = {
    'Authorization': 'Token ${ins<SharedPreferences>().getString("token")}',
  };
  @override
  Future<AuthStatus> getUser() async {
    final token = ins<SharedPreferences>().getString("token");
    if (token != null) {
      return AuthStatus.authentication;
    } else {
      return AuthStatus.unAuthentication;
    }
  }

  @override
  Future<AuthEntity> signIn(String email, String password) async {
    try {
      final result = await ins<Dio>().post(
        "$baseurl/auth/token",
        data: AuthModel(
          email: email,
          password: password,
        ).toJsonForToken(),
      );
      final token = AuthModel.fromJsonForToken(result.data);
      final getLikedProducts = await ins<Dio>().get(
        "$baseurl/api/liked-products/",
        options: Options(
          headers: {
            'Authorization': 'Token ${token.token}',
          },
        ),
      );
      print("Login ishladiyuuuuuuu ${result.data}");
      print("Token saqlandi11 ${ins<SharedPreferences>().getString("token")}");

      await ins<SharedPreferences>().setString("token", token.token.toString());
      print("Token saqlandi22 ${ins<SharedPreferences>().getString("token")}");
      print(
          "Like bosilgan tovarlar ============================= ${getLikedProducts.data}");
      if (getLikedProducts.data["results"] == []) {
        return token.toEntity;
      } else {
        print("Else ga akeldi======================");
        await saveLocal(getLikedProducts.data["results"]); ////localga saqlash
        return token.toEntity;
      }
    } catch (e) {
      throw ServerException(errorMessage: "GetTokenda xato", errorCode: "330");
    }
  }

  Future<bool> saveLocal(List results) async {
    print("Savvvvvvvvvvvvvvvveeeeeeeeeeeee $results");
    try {
      for (var i = 0; i < results.length; i++) {
        print("Birinchisi*** ${results[i]["product"]}");
        print("Ikkinchi*** ${results[i]["product"]["id"]}");
        await ins<SharedPreferences>().setString(
          "liked_product-${results[i]["product"]["id"]}",
          results[i]["uuid"],
        );
        print("Malumotlar saqlanyapdi ${results[i]}");
      }
      return true;
    } catch (e) {
      print("Catch ishladi $e");
      return false;
    }
  }

  @override
  Future<AuthModel> signUp(String email, String password) async {
    try {
      print("ppppppppppppppp");
      final confirmcode = await ins<Dio>().post("$baseurl/auth/create",
          data: AuthModel(email: email, password: password).toJsonForCreate());
      print('Confirmation ------------ $confirmcode');
      final haveNum = AuthModel.fromJsonForCreate(confirmcode.data);
      return haveNum;
    } catch (e) {
      throw ServerException(
        errorMessage: "Sign upda error",
        errorCode: "330",
      );
    }
    //Qizilni yo'qotish uchun
  }

  @override
  Future<bool> confirmCode(String email, int confirmationCode) async {
    try {
      final isConfirm = await ins<Dio>().post("$baseurl/auth/confirm-code",
          data: AuthModel(
            email: email,
            confirm_code: confirmationCode,
          ).toJsonForConfirmCode());
      print("confirm ============ $isConfirm");
      final isTrue = AuthModel.fromJsonForConfirmCode(isConfirm.data);
      return isTrue.isSuccess!;
    } catch (e) {
      throw ServerException(
          errorMessage: "Confirm codeda xato", errorCode: "330");
    }
  }

  @override
  Future<AuthEntity> getToken(String email, String password) async {
    try {
      final getToken = await ins<Dio>().post("$baseurl/auth/token",
          data: AuthModel(
            email: email,
            password: password,
          ).toJsonForToken());
      print("Tokeeeeeeeeeeen --------- $getToken");
      final token = AuthModel.fromJsonForToken(getToken.data);
      ins<SharedPreferences>().setString(
        "token",
        token.token.toString(),
      );
      await ins<SharedPreferences>().setString("token", token.token.toString());
      return token.toEntity;
    } catch (e) {
      throw ServerException(errorMessage: "GetTokenda xato", errorCode: "330");
    }
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
