part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class ChangeUserImageLoading extends UserState {}
final class UserSuccess extends UserState {
  final UserModel userModel;
  UserSuccess({required this.userModel});

}

final class NameUpdateSuccess extends UserState {}
final class PasswordChangeSuccess extends UserState {}
final class UserImageChangeSuccess extends UserState {}
final class UserLogOutSuccess extends UserState {}

final class UserFailure extends UserState {
  final String errorMessage;
  UserFailure({required this.errorMessage});
}

