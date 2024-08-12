// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'shopping_bloc.dart';

class ShoppingState {
  final MainStatus mainStatus;
  final List<ProductModel> products;
  final ProductModel? product;
  final List<CategoryModel> categories;
  final int productPageNumber;
  final int? activeCategoryId;
  final PageStatus pageStatus;

  ShoppingState({
    required this.mainStatus,
    required this.products,
    this.product,
    required this.categories,
    required this.productPageNumber,
    this.activeCategoryId,
    required this.pageStatus,
  });

  ShoppingState copyWith({
    MainStatus? mainStatus,
    List<ProductModel>? products,
    ProductModel? product,
    List<CategoryModel>? categories,
    int? productPageNumber,
    int? activeCategoryId,
    PageStatus? pageStatus,
    bool? isRefreshing,
    bool? isLoading,
  }) {
    return ShoppingState(
      mainStatus: mainStatus ?? this.mainStatus,
      products: products ?? this.products,
      product: product ?? this.product,
      categories: categories ?? this.categories,
      productPageNumber: productPageNumber ?? this.productPageNumber,
      activeCategoryId: activeCategoryId ?? this.activeCategoryId,
      pageStatus: pageStatus ?? this.pageStatus,
    );
  }

  @override
  bool operator ==(covariant ShoppingState other) {
    if (identical(this, other)) return true;

    return other.mainStatus == mainStatus &&
        listEquals(other.products, products) &&
        other.product == product &&
        listEquals(other.categories, categories) &&
        other.productPageNumber == productPageNumber &&
        other.activeCategoryId == activeCategoryId &&
        other.pageStatus == pageStatus;
  }

  @override
  int get hashCode {
    return mainStatus.hashCode ^
        products.hashCode ^
        product.hashCode ^
        categories.hashCode ^
        productPageNumber.hashCode ^
        activeCategoryId.hashCode ^
        pageStatus.hashCode;
  }
}
