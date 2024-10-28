import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/feature/login/data/repo/login_repo_impl.dart';

import '../../../data/model/login_user_info_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepoImpl) : super(LoginInitial());

  final LoginRepoImpl loginRepoImpl;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> loginWithEmailAndPassword() async {
    emit(LoginLoading());
    final login = await loginRepoImpl.loginWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    login.fold((failure) {
      emit(LoginFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(LoginSuccess(loginUserInfoModel: user));
    });
  }

  Future<void> loginWithFacebook() async {
    emit(LoginLoading());
    final login = await loginRepoImpl.loginWithFacebook();
    login.fold((failure) {
      emit(LoginFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(LoginSuccess(loginUserInfoModel: user));
    });
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final login = await loginRepoImpl.loginWithGoogle();
    login.fold((failure) {
      emit(LoginFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(LoginSuccess(loginUserInfoModel: user));
    });
  }
}
