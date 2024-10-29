import 'package:firebase_auth/firebase_auth.dart';

// Base Abstract Class - لا تغيير
abstract class AuthFailure {
  final dynamic errorMessage;
  AuthFailure({
    required this.errorMessage,
  });
}

// Authentication Failures
class InvalidEmailFailure extends AuthFailure {
  InvalidEmailFailure()
      : super(errorMessage: "Your email address appears to be malformed.");
}

class WrongPasswordFailure extends AuthFailure {
  WrongPasswordFailure() : super(errorMessage: "Your password is wrong.");
}

class UserNotFoundFailure extends AuthFailure {
  UserNotFoundFailure()
      : super(errorMessage: "User with this email doesn't exist.");
}

class UserDisabledFailure extends AuthFailure {
  UserDisabledFailure()
      : super(errorMessage: "User with this email has been disabled.");
}

class TooManyRequestsFailure extends AuthFailure {
  TooManyRequestsFailure()
      : super(errorMessage: "Too many requests. Try again later.");
}

class OperationNotAllowedFailure extends AuthFailure {
  OperationNotAllowedFailure()
      : super(
            errorMessage: "Signing in with Email and Password is not enabled.");
}

class EmailAlreadyExistsFailure extends AuthFailure {
  EmailAlreadyExistsFailure()
      : super(
            errorMessage:
                "The email has already been registered. Please login or reset your password.");
}

class NoInternetFailure extends AuthFailure {
  NoInternetFailure()
      : super(
            errorMessage:
                "No internet connection. Please check your connection and try again.");
}

class WeakPasswordFailure extends AuthFailure {
  WeakPasswordFailure()
      : super(errorMessage: "The password provided is too weak.");
}

class InvalidCredentialFailure extends AuthFailure {
  InvalidCredentialFailure()
      : super(
            errorMessage:
                "Invalid credentials. Please check your email and password.");
}

class UnknownFailure extends AuthFailure {
  UnknownFailure() : super(errorMessage: "An undefined error happened.");
}

class AuthExceptionHandler {
  static AuthFailure handleException({required FirebaseAuthException error}) {
    print('Firebase Error Code: ${error.code}'); 
    print('Firebase Error Message: ${error.message}');

    switch (error.code) {
      case "invalid-email":
        return InvalidEmailFailure();

      case "wrong-password":
        return WrongPasswordFailure();

      case "user-not-found":
        return UserNotFoundFailure();

      case "user-disabled":
        return UserDisabledFailure();

      case "too-many-requests":
        return TooManyRequestsFailure();

      case "operation-not-allowed":
        return OperationNotAllowedFailure();

      case "email-already-in-use":
        return EmailAlreadyExistsFailure();

      case "network-request-failed":
        return NoInternetFailure();

      case "weak-password":
        return WeakPasswordFailure();

      case "invalid-credential":
        return InvalidCredentialFailure();

      default:
        print('***************UnknownFailure*****${error.message}');
        return UnknownFailure();
    }
  }
}
