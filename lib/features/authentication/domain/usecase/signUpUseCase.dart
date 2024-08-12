import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/domain/repository/repository.dart';

class AuthSignUpUseCase implements UseCase<AuthModel, NoParams> {
  final AuthRepository _repository;
  final String email;
  final String password;

  AuthSignUpUseCase({
    required AuthRepository repository,
    required this.email,
    required this.password,
  }) : _repository = repository;
  @override
  Future<Either<Failure, AuthModel>> call(NoParams params) {
    return _repository.signUp(
      email,
      password,
    );
  }
}
