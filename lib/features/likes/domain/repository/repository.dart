import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/failure/failure.dart';

abstract class LikesRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
