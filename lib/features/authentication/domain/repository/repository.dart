import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthStatus>> getUser();
  Future<Either<Failure, AuthModel>> signUp(String email, String password);
  Future<Either<Failure, AuthEntity>> signIn(String email, String password);
  Future<Either<Failure, bool>> confirmCode(String email, int confirmationCode);
  Future<Either<Failure, AuthEntity>> getToken(String email, String password);
  Future<Either<Failure, bool>> logout();
}
