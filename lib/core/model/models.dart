import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  final int id;
  final String name;
  final int productOwner;
  final List<PhotosOrVideo> photosOrVideos;
  final int category;
  final String price;
  final String productComment;
  final bool isLiked;
  final int productAmount;
  final String? exOwnerNumber;
  final String? exOwnerTgUsername;
  ProductModel({
    required this.id,
    required this.name,
    required this.productOwner,
    required this.photosOrVideos,
    required this.category,
    required this.price,
    required this.productComment,
    required this.isLiked,
    required this.productAmount,
    this.exOwnerNumber,
    this.exOwnerTgUsername,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json, bool isLiked) =>
      ProductModel(
        id: json["id"],
        name: json["name"],
        productOwner: json["product_owner"],
        photosOrVideos: List<PhotosOrVideo>.from(
            json["photos_or_videos"].map((x) => PhotosOrVideo.fromJson(x))),
        category: json["category"],
        price: json["price"],
        productComment: json["product_comment"],
        isLiked: isLiked,
        productAmount: 1,
        exOwnerNumber: json["ex_owner_number"],
        exOwnerTgUsername: json["ex_owner_tg_username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "product_owner": productOwner,
        "photos_or_videos":
            List<dynamic>.from(photosOrVideos.map((x) => x.toJson())),
        "category": category,
        "price": price,
        "product_comment": productComment,
        "ex_owner_number": exOwnerNumber,
        "ex_owner_tg_username": exOwnerTgUsername,
      };

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.productOwner == productOwner &&
        listEquals(other.photosOrVideos, photosOrVideos) &&
        other.category == category &&
        other.price == price &&
        other.productComment == productComment &&
        other.isLiked == isLiked &&
        other.productAmount == productAmount &&
        other.exOwnerNumber == exOwnerNumber &&
        other.exOwnerTgUsername == exOwnerTgUsername;
  }

  ProductModel copyWith({
    int? id,
    String? name,
    int? productOwner,
    List<PhotosOrVideo>? photosOrVideos,
    int? category,
    String? price,
    String? productComment,
    bool? isLiked,
    int? productAmount,
    String? exOwnerNumber,
    String? exOwnerTgUsername,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      productOwner: productOwner ?? this.productOwner,
      photosOrVideos: photosOrVideos ?? this.photosOrVideos,
      category: category ?? this.category,
      price: price ?? this.price,
      productComment: productComment ?? this.productComment,
      isLiked: isLiked ?? this.isLiked,
      productAmount: productAmount ?? this.productAmount,
      exOwnerNumber: exOwnerNumber ?? this.exOwnerNumber,
      exOwnerTgUsername: exOwnerTgUsername ?? this.exOwnerTgUsername,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, productOwner: $productOwner, photosOrVideos: $photosOrVideos, category: $category, price: $price, productComment: $productComment, isLiked: $isLiked, productAmount: $productAmount, exOwnerNumber: $exOwnerNumber, exOwnerTgUsername: $exOwnerTgUsername)';
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
        productAmount.hashCode ^
        exOwnerNumber.hashCode ^
        exOwnerTgUsername.hashCode;
  }
}

class PhotosOrVideo {
  final int id;
  final String file;
  final bool isHome;

  PhotosOrVideo({
    required this.id,
    required this.file,
    required this.isHome,
  });

  factory PhotosOrVideo.fromJson(Map<String, dynamic> json) => PhotosOrVideo(
        id: json["id"],
        file: json["file"],
        isHome: json["is_home"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "file": file,
        "is_home": isHome,
      };

  @override
  bool operator ==(covariant PhotosOrVideo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.file == file && other.isHome == isHome;
  }

  @override
  int get hashCode => id.hashCode ^ file.hashCode ^ isHome.hashCode;

  @override
  String toString() => 'PhotosOrVideo(id: $id, file: $file, isHome: $isHome)';

  PhotosOrVideo copyWith({
    int? id,
    String? file,
    bool? isHome,
  }) {
    return PhotosOrVideo(
      id: id ?? this.id,
      file: file ?? this.file,
      isHome: isHome ?? this.isHome,
    );
  }
}
