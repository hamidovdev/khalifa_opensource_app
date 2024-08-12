part of 'shopping_bloc.dart';

abstract class ShoppingEvent {}

class GetProducts extends ShoppingEvent {
  final bool isRefresh;
  final bool isLoading;
  final VoidCallback success;
  final VoidCallback failure;
  GetProducts(
      {required this.isRefresh,
      required this.isLoading,
      required this.failure,
      required this.success});
}

class GetCategories extends ShoppingEvent {
  final VoidCallback success;

  GetCategories({required this.success});
}

class GetProductById extends ShoppingEvent {
  final int productId;

  GetProductById({required this.productId});
}

class ClearDataInBloc extends ShoppingEvent {}

class ClickLikeBtn extends ShoppingEvent {
  final int productId;
  final VoidCallback success;
  final VoidCallback failure;

  ClickLikeBtn({
    required this.productId,
    required this.success,
    required this.failure,
  });
}

class ClickDisLikeBtn extends ShoppingEvent {
  final int productId;
  final VoidCallback success;
  final VoidCallback failure;

  ClickDisLikeBtn({
    required this.productId,
    required this.success,
    required this.failure,
  });
}

class AddProductToBasket extends ShoppingEvent {
  final int productId;
  final int productAmount;
  final VoidCallback failure;
  final VoidCallback success;
  AddProductToBasket({
    required this.productId,
    required this.failure,
    required this.success,
    required this.productAmount,
  });
}

class GetProductsSorted extends ShoppingEvent {
  final int categoryId;
  final bool isRefresh;
  final bool isLoading;
  final VoidCallback success;
  final VoidCallback failure;

  GetProductsSorted({
    required this.categoryId,
    required this.isLoading,
    required this.isRefresh,
    required this.failure,
    required this.success,
  });
}
