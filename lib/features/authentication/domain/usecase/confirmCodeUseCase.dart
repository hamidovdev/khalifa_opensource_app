import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/authentication/domain/repository/repository.dart';

class AuthConfirmCodeUseCase implements UseCase<bool, NoParams> {
  final AuthRepository _repository;
  final String email;
  final int confirmationCode;

  AuthConfirmCodeUseCase({
    required AuthRepository repository,
    required this.email,
    required this.confirmationCode,
  }) : _repository = repository;
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _repository.confirmCode(
      email,
      confirmationCode,
    );
  }
}
