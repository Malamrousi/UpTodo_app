import 'package:dartz/dartz.dart';
import 'package:uptodo/core/failures/auth_failure.dart';

import '../model/user_model.dart';

abstract class UserRep {
  Future<void> logOut();
  Future<Either<AuthFailure, UserModel>> getCurrentUser( UserModel userModel);
  Future<Either<AuthFailure, void>> changePassword(dynamic password);
}
