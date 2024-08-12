import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/features/profile/data/datasource/datasource.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/domain/repository/repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _dataSource;

  ProfileRepositoryImpl({required ProfileDataSource dataSource})
      : _dataSource = dataSource;
  @override
  Future<Either<Failure, ProfileModel>> getUserInfo() async {
    try {
      final data = await _dataSource.getUserInfo();
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserInfo(ProfileModel user) async {
    try {
      final data = await _dataSource.updateUserInfo(user);
      return Right(data);
    } catch (e) {
      return Left(const ServerFailure());
    }
  }
}
