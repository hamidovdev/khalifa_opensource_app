part of 'basket_bloc.dart';

abstract class BasketEvent {}

class GetBasketProducts extends BasketEvent {}

class DeleteBasketProduct extends BasketEvent {
  final int productId;
  final VoidCallback success;
  final VoidCallback failure;
  DeleteBasketProduct({
    required this.productId,
    required this.failure,
    required this.success,
  });
}

class AddBasketProduct extends BasketEvent {
  final int productId;
  final int productAmount;
  final VoidCallback success;
  final VoidCallback failure;

  AddBasketProduct({
    required this.productId,
    required this.productAmount,
    required this.success,
    required this.failure,
  });
}
