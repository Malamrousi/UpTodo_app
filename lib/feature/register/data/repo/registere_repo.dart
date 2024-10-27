import 'package:dartz/dartz.dart';

import '../../../../core/failures/auth_failure.dart';
import '../model/user_info_model.dart';

abstract class RegisterRepo {
  Future<Either<AuthFailure, UserInfoModel>> registerWithEmailAndPassword();
  Future<Either<AuthFailure, UserInfoModel>> registerWithGoogle();
  Future<Either<AuthFailure, UserInfoModel>> registerWithFacebook();
  Future<Either<AuthFailure, UserInfoModel>> signOut();
}
