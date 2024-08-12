import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/shopping/data/repository/repositoryImpl.dart';

class GetProductByIdUsecase implements UseCase<ProductModel, NoParams> {
  final int productId;
  final ShoppingRepositoryImpl _repository;

  GetProductByIdUsecase({
    required ShoppingRepositoryImpl repository,
    required this.productId,
  }) : _repository = repository;
  @override
  Future<Either<Failure, ProductModel>> call(NoParams param) async {
    return await _repository.getProductById(productId);
  }
}
