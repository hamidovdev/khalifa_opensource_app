import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/entity/entity.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/likes/data/repository/repository.dart';

class LikesUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final LikesRepositoryImpl _repository;

  LikesUseCase({required LikesRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams param) async {
    return await _repository.getProducts();
  }
}
