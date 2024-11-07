import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreFailure {
  final dynamic errorMessage;
  FireStoreFailure({
    required this.errorMessage,
  });
}

class PermissionDeniedFailure extends FireStoreFailure {
  PermissionDeniedFailure()
      : super(errorMessage: "You don't have permission to access this data.");
}

class DocumentNotFoundFailure extends FireStoreFailure {
  DocumentNotFoundFailure()
      : super(errorMessage: "The requested document doesn't exist in the database.");
}

class DocumentAlreadyExistsFailure extends FireStoreFailure {
  DocumentAlreadyExistsFailure()
      : super(errorMessage: "The document already exists in the database.");
}

class DataLimitExceededFailure extends FireStoreFailure {
  DataLimitExceededFailure()
      : super(errorMessage: "Maximum allowed data size has been exceeded.");
}

class DeadlineExceededFailure extends FireStoreFailure {
  DeadlineExceededFailure()
      : super(errorMessage: "Operation timeout. Please try again.");
}

class NoInternetFailure extends FireStoreFailure {
  NoInternetFailure()
      : super(
            errorMessage:
                "No internet connection. Please check your connection and try again.");
}

class InvalidQueryFailure extends FireStoreFailure {
  InvalidQueryFailure()
      : super(errorMessage: "Invalid query. Please check your search criteria.");
}

class CancelledOperationFailure extends FireStoreFailure {
  CancelledOperationFailure()
      : super(errorMessage: "The operation was cancelled.");
}

class ServerFailure extends FireStoreFailure {
  ServerFailure()
      : super(errorMessage: "Server error occurred. Please try again later.");
}

class UnknownFailure extends FireStoreFailure {
  UnknownFailure() : super(errorMessage: "An unknown error occurred.");
}

class FireStoreExceptionHandler {
  static FireStoreFailure handleException({required FirebaseException error}) {
    switch (error.code) {
      case "permission-denied":
        return PermissionDeniedFailure();

      case "not-found":
        return DocumentNotFoundFailure();

      case "already-exists":
        return DocumentAlreadyExistsFailure();

      case "resource-exhausted":
        return DataLimitExceededFailure();

      case "deadline-exceeded":
        return DeadlineExceededFailure();

      case "unavailable":
        return NoInternetFailure();

      case "invalid-argument":
        return InvalidQueryFailure();

      case "cancelled":
        return CancelledOperationFailure();

      case "internal":
        return ServerFailure();

      default:
        return UnknownFailure();
    }
  }
}