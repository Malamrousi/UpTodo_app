

abstract class AuthFailure {
  final String errorMessage;
  AuthFailure({
    required this.errorMessage,
  });
}

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
      : super(errorMessage: "No internet connection. Please check your connection and try again.");
}


class UnknownFailure extends AuthFailure {
  UnknownFailure() : super(errorMessage: "An undefined error happened.");
}

class AuthExceptionHandler {
  static AuthFailure handleException({errorMessage}) {
    print(errorMessage.toString());
    switch (errorMessage.code) {
       case "ERROR_INVALID_EMAIL":
       case "invalid-email":
        return InvalidEmailFailure();
     
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return WrongPasswordFailure();
          
       case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return UserNotFoundFailure();
          
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return UserDisabledFailure();
        
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return TooManyRequestsFailure();
       
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return EmailAlreadyExistsFailure();

         case "network-request-failed":
        return NoInternetFailure();
        
      default:
        return UnknownFailure();
    }
  }
}
