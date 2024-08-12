import 'package:dio/dio.dart';
import 'package:khalifa/core/base_url/url.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/injector/injector.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ShoppingDataSource {
  Future<List<ProductModel>> getProducts(int pageNumber);
  Future<List<CategoryModel>> getCategories();
  Future<bool> clickLikeBtn(int productId);
  Future<bool> clickDisLikeBtn(int productId);
  Future<bool> addProductToBasket(int productId, int productAmount);
  Future<List<ProductModel>> getProductsSorted(int pageNumber, int categoryId);
  Future<ProductModel> getProductById(int productId);
  factory ShoppingDataSource() => _ShoppingDataSourceImpl();
}

class _ShoppingDataSourceImpl implements ShoppingDataSource {
  final headers = {
    'Authorization': 'Token ${ins<SharedPreferences>().getString("token")}',
  };
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      final data = await ins<Dio>().get(
        "$baseurl/api/category-list/",
        options: Options(
          headers: headers,
        ),
      );
      List<CategoryModel> categories = (data.data["results"] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
      return categories;
    } catch (e) {
      throw const ServerFailure(message: "Shop xato");
    }
  }

  @override
  Future<List<ProductModel>> getProducts(int pageNumber) async {
    try {
      final data = await ins<Dio>().get(
        "$baseurl/api/product-menu/?page=${pageNumber.toString()}",
        options: Options(
          headers: headers,
        ),
      );
      final products = (data.data["results"] as List)
          .map((e) => ProductModel.fromJson(
                e,
                isLiked(
                  e["id"],
                ),
              ))
          .toList();
      return products;
    } catch (e) {
      throw const ServerFailure(message: "Shop xato");
    }
  }

  @override
  Future<bool> addProductToBasket(int productId, int productAmount) async {
    try {
      if (ins<SharedPreferences>()
              .getString("basket_product-${productId.toString()}") !=
          null) {
        final data = await ins<Dio>().put(
          "$baseurl/api/savatcha-update/${ins<SharedPreferences>().getString("basket_product-${productId.toString()}")}/",
          data: {
            "product": productId,
            "product_amount":
                ins<SharedPreferences>().getInt("product_amount-$productId"),
          },
          options: Options(
            headers: headers,
          ),
        );
        await ins<SharedPreferences>().setInt(
            "product_amount-$productId", data.data["product_amount"] + 1);
      } else if (ins<SharedPreferences>()
              .getString("basket_product-${productId.toString()}") ==
          null) {
        final data = await ins<Dio>().post(
          "$baseurl/api/savatcha-create/",
          data: {
            "product": productId,
            "product_amount": productAmount,
          },
          options: Options(
            headers: headers,
          ),
        );
        await ins<SharedPreferences>().setString(
          "basket_product-${productId.toString()}",
          data.data["uuid"],
        );
        await ins<SharedPreferences>().setInt("product_amount-$productId", 1);
      }
      return true;
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<bool> clickLikeBtn(int productId) async {
    try {
      print("Likedga keldi $productId");
      final getId = await ins<Dio>().post(
        "$baseurl/api/liked-products-create/",
        data: {
          "product_id": productId,
        },
        options: Options(
          headers: headers,
        ),
      );
      await ins<SharedPreferences>().setString(
          "liked_product-${productId.toString()}", getId.data["uuid"]);
      return true;
    } catch (e) {
      throw const ServerFailure();
    }
  }

  @override
  Future<List<ProductModel>> getProductsSorted(
    int pageNumber,
    int categoryId,
  ) async {
    try {
      final data = await ins<Dio>().get(
        "$baseurl/api/category-products-list/$categoryId/?page=${pageNumber.toString()}",
        options: Options(
          headers: headers,
        ),
      );
      List<ProductModel> products = (data.data["results"] as List)
          .map(
            (e) => ProductModel.fromJson(
              e,
              isLiked(
                e["id"],
              ),
            ),
          )
          .toList();
      return products;
    } catch (e) {
      throw const ServerFailure(message: "Shop xato");
    }
  }

  @override
  Future<bool> clickDisLikeBtn(int productId) async {
    try {
      final id = ins<SharedPreferences>().getString(
        "liked_product-${productId.toString()}",
      );
      print("Bu yerga keldi Dislike $id");
      final p = await ins<Dio>().delete(
        "$baseurl/api/liked-product-delete/$id/",
        options: Options(
          headers: headers,
        ),
      );
      print("Dislike ga keldi 222 ${p.data}");
      await ins<SharedPreferences>()
          .remove("liked_product-${productId.toString()}");
      return true;
    } catch (e) {
      throw const ServerFailure();
    }
  }

  bool isLiked(int id) {
    try {
      final a =
          ins<SharedPreferences>().getString("liked_product-${id.toString()}");
      return a != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  bool isinBasket(int id) {
    try {
      final a =
          ins<SharedPreferences>().getString("basket_product-${id.toString()}");
      return a != null ? true : false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ProductModel> getProductById(int productId) async {
    try {
      final productData = await ins<Dio>()
          .get("http://13.48.130.141/api/product-by-id/$productId/");
      return ProductModel.fromJson(
        productData.data,
        isLiked(
          productData.data["id"],
        ),
      );
    } catch (e) {
      throw const ServerFailure();
    }
  }
}
