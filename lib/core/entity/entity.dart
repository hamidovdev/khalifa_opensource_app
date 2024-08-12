import 'package:khalifa/core/model/models.dart';

class ProductEntity {
  final int id;
  final String name;
  final int productOwner;
  final List<PhotosOrVideo> photosOrVideos;
  final int category;
  final String price;
  final String productComment;

  ProductEntity({
    required this.id,
    required this.name,
    required this.productOwner,
    required this.photosOrVideos,
    required this.category,
    required this.price,
    required this.productComment,
  });

  ProductEntity copyWith({
    int? id,
    String? name,
    int? productOwner,
    List<PhotosOrVideo>? photosOrVideos,
    int? category,
    String? price,
    String? productComment,
  }) =>
      ProductEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        productOwner: productOwner ?? this.productOwner,
        photosOrVideos: photosOrVideos ?? this.photosOrVideos,
        category: category ?? this.category,
        price: price ?? this.price,
        productComment: productComment ?? this.productComment,
      );

  factory ProductEntity.fromJson(Map<String, dynamic> json) => ProductEntity(
        id: json["id"],
        name: json["name"],
        productOwner: json["product_owner"],
        photosOrVideos: List<PhotosOrVideo>.from(
            json["photos_or_videos"].map((x) => PhotosOrVideo.fromJson(x))),
        category: json["category"],
        price: json["price"],
        productComment: json["product_comment"],
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
      };
}
