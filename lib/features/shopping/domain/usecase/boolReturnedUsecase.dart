// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/exception/exception.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/shopping/data/repository/repositoryImpl.dart';

class BoolReturnedUseCase implements UseCase<bool, Params> {
  final ShoppingRepositoryImpl _repository;

  BoolReturnedUseCase({
    required ShoppingRepositoryImpl repository,
  }) : _repository = repository;
  @override
  Future<Either<Failure, bool>> call(Params param) async {
    if (param is ClickLikeBtnParam) {
      return await _repository.clickLikeBtn(param.productId);
    } else if (param is AddProductToBasketParam) {
      return await _repository.addProductToBasket(
        param.productId,
        param.productAmount,
      );
    } else if (param is ClickDisLikeBtnParam) {
      return await _repository.clickDisLikeBtn(param.productId);
    } else {
      return throw ServerException(
        errorMessage: "Shopping usecase da xatolik ",
        errorCode: "333",
      );
    }
  }
}

abstract class Params {}

class ClickLikeBtnParam extends Params {
  final int productId;

  ClickLikeBtnParam({
    required this.productId,
  });
}

class ClickDisLikeBtnParam extends Params {
  final int productId;

  ClickDisLikeBtnParam({
    required this.productId,
  });
}

class AddProductToBasketParam extends Params {
  final int productId;
  final int productAmount;
  AddProductToBasketParam({
    required this.productId,
    required this.productAmount,
  });
}
