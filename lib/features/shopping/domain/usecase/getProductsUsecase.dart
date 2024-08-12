import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/model/models.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/shopping/data/repository/repositoryImpl.dart';

class ProductsUsecase implements UseCase<List<ProductModel>, Params> {
  final ShoppingRepositoryImpl _repository;

  ProductsUsecase({
    required ShoppingRepositoryImpl repository,
  }) : _repository = repository;
  @override
  Future<Either<Failure, List<ProductModel>>> call(Params param) async {
    if (param is GetProductsParam) {
      return await _repository.getProducts(param.pageNumber);
    } else if (param is GetProductsSortedParam) {
      return await _repository.getProductsSorted(
          param.pageNumber, param.categoryId);
    } else {
      return throw UnimplementedError();
    }
  }
}

abstract class Params {}

class GetProductsParam extends Params {
  final int pageNumber;

  GetProductsParam({
    required this.pageNumber,
  });
}

class GetProductsSortedParam extends Params {
  final int pageNumber;
  final int categoryId;

  GetProductsSortedParam({
    required this.pageNumber,
    required this.categoryId,
  });
}
