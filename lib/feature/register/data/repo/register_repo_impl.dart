//packages
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:uptodo/feature/register/data/model/user_info_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//repo
import '../../../../core/failures/auth_failure.dart';
import 'registere_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<Either<AuthFailure, UserInfoModel>> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      //create user
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //store user info
      UserInfoModel userInfoModel = UserInfoModel(
        email: userCredential.user!.email!,
        displayName: name,
        uid: userCredential.user!.uid,
      );
      return right(userInfoModel);
    } on FirebaseAuthException catch (error) {
      return left(
          AuthExceptionHandler.handleException(errorMessage: error.toString()));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserInfoModel>> registerWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();
      //if user cancelled login
      if (loginResult.status != LoginStatus.success) {
        return Left(UnknownFailure());
      }
      // Create a credential from the access token

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
// Once signed in, return the UserCredential
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
//get user data
      final userData = await FacebookAuth.instance.getUserData();
      //store user info
      UserInfoModel userInfoModel = UserInfoModel(
        email: userCredential.user?.email ?? userData['email'] ?? 'No Email',
        uid: userCredential.user!.uid,
        displayName:
            userCredential.user?.displayName ?? userData['name'] ?? 'No Name',
      );

      return right(userInfoModel);
    } on FirebaseAuthException catch (error) {
      return left(
          AuthExceptionHandler.handleException(errorMessage: error.toString()));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserInfoModel>> registerWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      if (googleUser == null) {
        return Left(UnknownFailure());
      }
      // Create a new credential
      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      //store user info
      UserInfoModel userInfoModel = UserInfoModel(
        email: userCredential.user?.email ?? 'No Email',
        displayName: userCredential.user?.displayName ?? 'No Name',
        uid: userCredential.user!.uid,
      );
      return right(userInfoModel);
    } on FirebaseAuthException catch (error) {
      return left(
          AuthExceptionHandler.handleException(errorMessage: error.toString()));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }


}
