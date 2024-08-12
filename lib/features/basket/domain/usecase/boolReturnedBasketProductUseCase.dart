import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/basket/data/repository/repository.dart';

class BoolReturnedBasketProductUseCase implements UseCase<bool, Param> {
  final BasketetRepositoryImpl _repositoryImpl;

  BoolReturnedBasketProductUseCase({
    required BasketetRepositoryImpl repositoryImpl,
  }) : _repositoryImpl = repositoryImpl;
  @override
  Future<Either<Failure, bool>> call(Param param) async {
    if (param is DeleteProductBasketParam) {
      return await _repositoryImpl.deleteBasketProduct(param.productId);
    } else if (param is AddProductBasketParam) {
      return await _repositoryImpl.addBasketProduct(
          param.productId, param.productAmount);
    } else {
      throw UnimplementedError();
    }
  }
}

abstract class Param {}

class DeleteProductBasketParam extends Param {
  final int productId;

  DeleteProductBasketParam({required this.productId});
}

class AddProductBasketParam extends Param {
  final int productId;
  final int productAmount;

  AddProductBasketParam({required this.productId, required this.productAmount});
}
