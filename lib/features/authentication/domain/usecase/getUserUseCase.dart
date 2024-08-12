import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/authentication/domain/repository/repository.dart';

class GetUserUseCase implements UseCase<AuthStatus, NoParams> {
  final AuthRepository _repository;

  GetUserUseCase({required AuthRepository repository})
      : _repository = repository;
  @override
  Future<Either<Failure, AuthStatus>> call(NoParams param) {
    return _repository.getUser();
  }
}
