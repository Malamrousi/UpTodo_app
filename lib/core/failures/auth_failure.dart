enum AuthResultStatus {
  invalidEmail,
  wrongPassword,
  userNotFound,
  userDisabled,
  tooManyRequests,
  operationNotAllowed,
  emailAlreadyExists,
  undefined,
}

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

class UnknownFailure extends AuthFailure {
  UnknownFailure() : super(errorMessage: "An undefined error happened.");
}

class AuthExceptionHandler {
  static AuthFailure handleException(e) {
    print(e.code);
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        return InvalidEmailFailure();
      case "ERROR_WRONG_PASSWORD":
        return WrongPasswordFailure();
      case "ERROR_USER_NOT_FOUND":
        return UserNotFoundFailure();
      case "ERROR_USER_DISABLED":
        return UserDisabledFailure();
      case "ERROR_TOO_MANY_REQUESTS":
        return TooManyRequestsFailure();
      case "ERROR_OPERATION_NOT_ALLOWED":
        return OperationNotAllowedFailure();
      case "ERROR_EMAIL_ALREADY_IN_USE":
        return EmailAlreadyExistsFailure();
      default:
        return UnknownFailure();
    }
  }
}
