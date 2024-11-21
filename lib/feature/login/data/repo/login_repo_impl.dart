import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uptodo/core/constant/app_constant.dart';
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
    print("Attempting login with email: $email");
    
    final UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      print("User credential is null");
      return Left(UnknownFailure());
    }

    print("User logged in successfully with UID: ${userCredential.user!.uid}");
    
    final userDoc =
        await db.collection(AppConstant.userCollection).doc(userCredential.user!.uid).get();

    if (!userDoc.exists) {
      print("Creating new user document");
      final newUser = LoginUserInfoModel(
        email: userCredential.user?.email,
        uid: userCredential.user!.uid,
        displayName: userCredential.user?.displayName ?? 'No Name',
      );

      await db
          .collection(AppConstant.userCollection)
          .doc(userCredential.user!.uid)
          .set(newUser.toJson());

      return right(newUser);
    }

    print("User document found in Firestore");
    final userData =
        LoginUserInfoModel.fromJson(userDoc.data() as Map<String, dynamic>);
    return right(userData);
    
  } on FirebaseAuthException catch (error) {
    print('FirebaseAuthException code: ${error.code}');
    print('FirebaseAuthException message: ${error.message}');
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
Future<void> getUser(LoginUserInfoModel loginUserInfoModel, User fireBaseUser) async {
  try {
    final userDoc = await db.collection(AppConstant.userCollection).doc(fireBaseUser.uid).get();

    if (!userDoc.exists) {
      print("Creating new user document");
      await db
          .collection(AppConstant.userCollection)
          .doc(fireBaseUser.uid)
          .set(loginUserInfoModel.toJson());
    } else {
      print("User document already exists");
    }
  } catch (e) {
    print("Error in getUser: $e");
  }
}
  @override
  void signOut() async {
    await firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }
}
