import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uptodo/core/constant/app_constant.dart';
import 'package:uptodo/core/failures/auth_failure.dart';
import 'package:uptodo/feature/user/data/repo/user_rep.dart';

import '../model/user_model.dart';

class UserRepoImpl implements UserRep {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Either<AuthFailure, void>> changePassword(dynamic password) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) {
        return Left(UnknownFailure());
      }

      final updatePassword = await user.updatePassword(password);

      return right(updatePassword);
    } on FirebaseAuthException catch (error) {
      return left(AuthExceptionHandler.handleException(error: error));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>> getCurrentUser(
      UserModel userModel) async {
    try {
      final user = await db
          .collection(AppConstant.userCollection)
          .doc(firebaseAuth.currentUser!.uid)
          .get();

      final data = user.data();
      userModel = UserModel.fromJson(data!);
      return right(userModel);
    } on FirebaseAuthException catch (error) {
      return left(AuthExceptionHandler.handleException(error: error));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }
}
