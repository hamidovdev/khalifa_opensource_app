import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';
import 'package:khalifa/features/authentication/domain/repository/repository.dart';

class AuthSignInUseCase implements UseCase<AuthEntity, NoParams> {
  final AuthRepository _repository;
  final String email;
  final String password;

  AuthSignInUseCase({
    required AuthRepository repository,
    required this.email,
    required this.password,
  }) : _repository = repository;
  @override
  Future<Either<Failure, AuthEntity>> call(NoParams params) {
    return _repository.signIn(
      email,
      password,
    );
  }
}
