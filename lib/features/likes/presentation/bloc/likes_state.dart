// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'likes_bloc.dart';

class LikesState {
  final MainStatus mainStatus;
  final List<ProductEntity> products;

  LikesState({
    required this.mainStatus,
    required this.products,
  });

  LikesState copyWith({
    MainStatus? mainStatus,
    List<ProductEntity>? products,
  }) {
    return LikesState(
      mainStatus: mainStatus ?? this.mainStatus,
      products: products ?? this.products,
    );
  }

  @override
  bool operator ==(covariant LikesState other) {
    if (identical(this, other)) return true;

    return other.mainStatus == mainStatus &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode => mainStatus.hashCode ^ products.hashCode;
}
