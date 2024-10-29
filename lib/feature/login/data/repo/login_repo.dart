import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/failures/auth_failure.dart';
import '../model/login_user_info_model.dart';

abstract class LoginRepo {
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithGoogle();
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithFacebook();
  void getUser(LoginUserInfoModel loginUserInfoModel, User fireBaseUser);
  void signOut();
}
