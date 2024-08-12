// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:khalifa/core/model/models.dart';

class ShoppingEntity {
  final int id;
  final String name;
  final int productOwner;
  final List<PhotosOrVideo> photosOrVideos;
  final int category;
  final String price;
  final String productComment;
  final bool isLiked;
  final int productAmount;

  ShoppingEntity({
    required this.id,
    required this.name,
    required this.productOwner,
    required this.photosOrVideos,
    required this.category,
    required this.price,
    required this.productComment,
    required this.isLiked,
    required this.productAmount,
  });

  ShoppingEntity copyWith({
    int? id,
    String? name,
    int? productOwner,
    List<PhotosOrVideo>? photosOrVideos,
    int? category,
    String? price,
    String? productComment,
    bool? isLiked,
    bool? isInBasket,
    int? productAmount,
  }) {
    return ShoppingEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      productOwner: productOwner ?? this.productOwner,
      photosOrVideos: photosOrVideos ?? this.photosOrVideos,
      category: category ?? this.category,
      price: price ?? this.price,
      productComment: productComment ?? this.productComment,
      isLiked: isLiked ?? this.isLiked,
      productAmount: productAmount ?? this.productAmount,
    );
  }

  @override
  String toString() {
    return 'ShoppingEntity(id: $id, name: $name, productOwner: $productOwner, photosOrVideos: $photosOrVideos, category: $category, price: $price, productComment: $productComment, isLiked: $isLiked, productAmount: $productAmount)';
  }

  @override
  bool operator ==(covariant ShoppingEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.productOwner == productOwner &&
        listEquals(other.photosOrVideos, photosOrVideos) &&
        other.category == category &&
        other.price == price &&
        other.productComment == productComment &&
        other.isLiked == isLiked &&
        other.productAmount == productAmount;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        productOwner.hashCode ^
        photosOrVideos.hashCode ^
        category.hashCode ^
        price.hashCode ^
        productComment.hashCode ^
        isLiked.hashCode ^
        productAmount.hashCode;
  }
}
