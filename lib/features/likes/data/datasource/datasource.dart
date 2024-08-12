import 'package:dio/dio.dart';
import 'package:khalifa/core/base_url/url.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/exception/exception.dart';
import 'package:khalifa/core/extensions/extensions.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LikesDataSource {
  Future<List<ProductEntity>> getProducts();

  factory LikesDataSource() => _LikesDataSourceImpl();
}

class _LikesDataSourceImpl implements LikesDataSource {
  final headers = {
    'Authorization': 'Token ${ins<SharedPreferences>().getString("token")}',
  };
  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      final data = await ins<Dio>().get(
        "$baseurl/api/liked-products/",
        options: Options(
          headers: headers,
        ),
      );
      return (data.data["results"] as List)
          .map(
            (e) => (ProductModel.fromJson(e["product"], true)).toProductEntity,
          )
          .toList();
    } catch (e) {
      throw ServerException(errorMessage: "", errorCode: "");
    }
  }
}
