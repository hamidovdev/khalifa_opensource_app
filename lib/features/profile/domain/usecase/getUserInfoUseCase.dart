import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/data/repository/repository.dart';

class GetUserInfoUseCase implements UseCase<ProfileModel, NoParams> {
  final ProfileRepositoryImpl _repository;

  GetUserInfoUseCase({required ProfileRepositoryImpl repository})
      : _repository = repository;
  @override
  Future<Either<Failure, ProfileModel>> call(NoParams param) {
    return _repository.getUserInfo();
  }
}
