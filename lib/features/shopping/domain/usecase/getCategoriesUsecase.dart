import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/shopping/data/model/model.dart';
import 'package:khalifa/features/shopping/data/repository/repositoryImpl.dart';

class CategoriesUsecase implements UseCase<List<CategoryModel>, NoParams> {
  final ShoppingRepositoryImpl _repository;

  CategoriesUsecase({required ShoppingRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<Either<Failure, List<CategoryModel>>> call(NoParams param) async {
    return await _repository.getCategories();
  }
}
