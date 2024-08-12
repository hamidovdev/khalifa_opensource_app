import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/features/likes/data/datasource/datasource.dart';
import 'package:khalifa/features/likes/domain/repository/repository.dart';

class LikesRepositoryImpl implements LikesRepository {
  final LikesDataSource _dataSource;

  LikesRepositoryImpl({required LikesDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final products = await _dataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(
        const ServerFailure(),
      );
    }
  }
}
