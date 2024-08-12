import 'package:khalifa/core/either/either.dart';
import 'package:khalifa/core/failure/failure.dart';
import 'package:khalifa/features/profile/data/model/model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileModel>> getUserInfo();
  Future<Either<Failure, bool>> updateUserInfo(ProfileModel user);
}
