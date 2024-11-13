part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}
final class UserLoading extends UserState {}
final class UserSuccess extends UserState {
  final LoginUserInfoModel loginUserInfoModel;
  UserSuccess({required this.loginUserInfoModel});

}
final class PasswordChangeSuccess extends UserState {}
final class UserLogOutSuccess extends UserState {}

final class UserFailure extends UserState {
  final String errorMessage;
  UserFailure({required this.errorMessage});
}

