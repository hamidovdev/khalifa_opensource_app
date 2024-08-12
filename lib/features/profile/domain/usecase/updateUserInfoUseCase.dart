import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/data/repository/repository.dart';

class UpdateUserInfoUseCase implements UseCase<bool, NoParams> {
  final ProfileModel user;
  final ProfileRepositoryImpl _repository;

  UpdateUserInfoUseCase(
      {required ProfileRepositoryImpl repository, required this.user})
      : _repository = repository;
  @override
  Future<Either<Failure, bool>> call(NoParams param) {
    return _repository.updateUserInfo(user);
  }
}
