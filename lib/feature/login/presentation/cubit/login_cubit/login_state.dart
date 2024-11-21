part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {

}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {

  final LoginUserInfoModel loginUserInfoModel;

  LoginSuccess({required this.loginUserInfoModel});

}
final class LoginFailure extends LoginState {

  final String errorMessage;

  LoginFailure({required this.errorMessage});
}
