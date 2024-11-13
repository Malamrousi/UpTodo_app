import 'package:dartz/dartz.dart';
import 'package:uptodo/core/failures/auth_failure.dart';
import 'package:uptodo/feature/login/data/model/login_user_info_model.dart';

abstract class UserRep {
  Future<void> logOut();
  Future<Either<AuthFailure, LoginUserInfoModel>> getCurrentUser( LoginUserInfoModel loginUserInfoModel);
  Future<Either<AuthFailure, void>> changePassword(dynamic password);
}
