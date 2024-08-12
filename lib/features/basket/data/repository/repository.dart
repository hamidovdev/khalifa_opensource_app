import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/features/basket/data/datasource/datasource.dart';
import 'package:khalifa/features/basket/data/model/model.dart';
import 'package:khalifa/features/basket/domain/repository/repository.dart';

class BasketetRepositoryImpl implements BasketRepository {
  final BasketDataSource _dataSource;

  BasketetRepositoryImpl({required BasketDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, bool>> deleteBasketProduct(int productId) async {
    try {
      final data = await _dataSource.deleteBasketProducts(productId);
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BasketModel>>> getBasketProducts() async {
    try {
      final data = await _dataSource.getBasketProducts();
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addBasketProduct(
      int productId, int productAmount) async {
    try {
      final data = await _dataSource.addBasketProduct(productId, productAmount);
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
