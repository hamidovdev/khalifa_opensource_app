import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/basket/data/model/model.dart';
import 'package:khalifa/features/basket/data/repository/repository.dart';

class GetBasketProductsUseCase implements UseCase<List<BasketModel>, NoParams> {
  final BasketetRepositoryImpl _basketetRepository;

  GetBasketProductsUseCase({required BasketetRepositoryImpl basketetRepository})
      : _basketetRepository = basketetRepository;
  @override
  Future<Either<Failure, List<BasketModel>>> call(NoParams param) async {
    return await _basketetRepository.getBasketProducts();
  }
}
