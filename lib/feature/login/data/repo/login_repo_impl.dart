import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uptodo/core/failures/auth_failure.dart';
import 'package:uptodo/feature/login/data/model/login_user_info_model.dart';
import 'package:uptodo/feature/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      // 1. تسجيل الدخول باستخدام Firebase Auth
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        return Left(UnknownFailure());
      }

      final userDoc =
          await db.collection('users').doc(userCredential.user!.uid).get();

      if (!userDoc.exists) {
        final newUser = LoginUserInfoModel(
          email: userCredential.user?.email ?? 'No Email',
          uid: userCredential.user!.uid,
          displayName: userCredential.user?.displayName ?? 'No Name',
        );

        await db
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(newUser.toJson());

        return right(newUser);
      }

      final userData =
          LoginUserInfoModel.fromJson(userDoc.data() as Map<String, dynamic>);
      return right(userData);
    } on FirebaseAuthException catch (error) {
      print('FirebaseAuthException: ${error.message}');
      return left(AuthExceptionHandler.handleException(error: error));
    } catch (error) {
      print('Unknown error: $error');
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithFacebook() async {
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
    
             LoginUserInfoModel userInfoModel = LoginUserInfoModel(
        email: userCredential.user?.email ?? userData['email'] ?? 'No Email',
        displayName: userCredential.user?.displayName ?? userData['name'] ?? 'No Name',
        uid: userCredential.user!.uid,
      );
      getUser(userInfoModel, userCredential.user!);
      return right(userInfoModel);
    } on FirebaseAuthException catch (error) {
      return left(AuthExceptionHandler.handleException(error: error));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

    @override
  Future<Either<AuthFailure, LoginUserInfoModel>> loginWithGoogle() async {
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
             LoginUserInfoModel userInfoModel = LoginUserInfoModel(
        email: userCredential.user?.email ?? 'No Email',
        displayName: userCredential.user?.displayName ?? 'No Name',
        uid: userCredential.user!.uid,
      );
      getUser(userInfoModel, userCredential.user!);
      return right(userInfoModel);
    } on FirebaseAuthException catch (error) {
      return left(AuthExceptionHandler.handleException(error: error));
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<void> getUser(
      LoginUserInfoModel loginUserInfoModel, User fireBaseUser) async {
    try {
      final userDoc = await db.collection('users').doc(fireBaseUser.uid).get();

      if (!userDoc.exists) {
        await db
            .collection('users')
            .doc(fireBaseUser.uid)
            .set(loginUserInfoModel.toJson());
      }
    } catch (e) {
      print('Error getting/creating user: $e');
    }
  }

  @override
  void signOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }
}
