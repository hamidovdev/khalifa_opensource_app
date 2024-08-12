import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/features/authentication/data/datasource/datasource.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';
import 'package:khalifa/features/authentication/domain/repository/repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl({required AuthDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, AuthStatus>> getUser() async {
    try {
      final status = await _dataSource.getUser();
      return Right(status);
    } catch (e) {
      return Left(ServerFailure(code: 400, message: "Userni topib bo'lmadi"));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> signIn(
      String email, String password) async {
    try {
      final user = await _dataSource.signIn(email, password);
      return Right(user);
    } catch (e) {
      return Left(const ServerFailure(message: "", code: 1));
    }
  }

  @override
  Future<Either<Failure, AuthModel>> signUp(
      String email, String password) async {
    try {
      final user = await _dataSource.signUp(email, password);
      return Right(user);
    } catch (e) {
      return Left(const ServerFailure(code: 330, message: ""));
    }
  }

  @override
  Future<Either<Failure, bool>> confirmCode(
      String email, int confirmationCode) async {
    try {
      final code = await _dataSource.confirmCode(email, confirmationCode);
      return Right(code);
    } catch (e) {
      return Left(const ServerFailure(code: 330, message: ""));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getToken(
      String email, String password) async {
    try {
      final token = await _dataSource.getToken(email, password);
      return Right(token);
    } catch (e) {
      return Left(const ServerFailure(code: 330, message: ""));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
