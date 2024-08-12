// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'basket_bloc.dart';

class BasketState {
  final MainStatus mainStatus;
  final PageStatus pageStatus;
  final List<BasketModel> products;
  final int amount;

  BasketState(
      {required this.mainStatus,
      required this.products,
      required this.amount,
      required this.pageStatus});

  BasketState copyWith({
    MainStatus? mainStatus,
    PageStatus? pageStatus,
    List<BasketModel>? products,
    int? amount,
  }) {
    return BasketState(
      mainStatus: mainStatus ?? this.mainStatus,
      pageStatus: pageStatus ?? this.pageStatus,
      products: products ?? this.products,
      amount: amount ?? this.amount,
    );
  }

  @override
  bool operator ==(covariant BasketState other) {
    if (identical(this, other)) return true;

    return other.mainStatus == mainStatus &&
        other.pageStatus == pageStatus &&
        listEquals(other.products, products) &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return mainStatus.hashCode ^
        pageStatus.hashCode ^
        products.hashCode ^
        amount.hashCode;
  }
}
