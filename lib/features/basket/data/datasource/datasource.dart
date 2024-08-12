import 'package:dio/dio.dart';
import 'package:khalifa/core/base_url/url.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/features/basket/data/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BasketDataSource {
  Future<List<BasketModel>> getBasketProducts();
  Future<bool> deleteBasketProducts(int productId);
  Future<bool> addBasketProduct(int productId, int productAmount);

  factory BasketDataSource() => _BasketDataSourceImpl();
}

class _BasketDataSourceImpl implements BasketDataSource {
  final headers = {
    'Authorization': 'Token ${ins<SharedPreferences>().getString("token")}',
  };
  @override
  Future<bool> deleteBasketProducts(int productId) async {
    try {
      print("Keldi bu yerga $productId");
      final a = await ins<Dio>().delete(
          "$baseurl/api/savatcha-delete/$productId/",
          options: Options(headers: headers));
      print("Delete a => ${a.data}");

      return true;
    } catch (e) {
      throw const ServerFailure();
    }
  }

  bool isLiked(int id) {
    try {
      final a = ins<SharedPreferences>().getInt(id.toString());
      return a != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<BasketModel>> getBasketProducts() async {
    try {
      final data = await ins<Dio>().get(
        "$baseurl/api/savatcha-list/",
        options: Options(headers: headers),
      );
      return (data.data["results"] as List)
          .map(
            (e) => BasketModel.fromJson(
              e,
              isLiked(
                e["product"]["id"],
              ),
            ),
          )
          .toList();
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<bool> addBasketProduct(int productId, int productAmount) async {
    try {
      await ins<Dio>().post(
        "$baseurl/api/savatcha-create/",
        data: {
          "product": productId,
          "product_amount": productAmount,
        },
        options: Options(
          headers: headers,
        ),
      );
      return true;
    } catch (e) {
      throw const ServerFailure();
    }
  }
}
