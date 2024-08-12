import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/features/basket/data/model/model.dart';

abstract class BasketRepository {
  Future<Either<Failure, List<BasketModel>>> getBasketProducts();
  Future<Either<Failure, bool>> deleteBasketProduct(
    int productId,
  );
  Future<Either<Failure, bool>> addBasketProduct(
    int productId,
    int productAmount,
  );
}
