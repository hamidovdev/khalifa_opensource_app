import 'package:khalifa/core/model/models.dart';

class BasketModel {
  final int id;
  final ProductModel product;
  final double productAmount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;

  BasketModel({
    required this.id,
    required this.product,
    required this.productAmount,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory BasketModel.fromJson(Map<String, dynamic> json, bool isLiked) =>
      BasketModel(
        id: json["id"],
        product: ProductModel.fromJson(json["product"], isLiked),
        productAmount: json["product_amount"]?.toDouble(),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "product_amount": productAmount,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
        "user": user,
      };
}
