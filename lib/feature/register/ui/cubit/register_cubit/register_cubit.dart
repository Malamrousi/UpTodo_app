import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/feature/register/data/repo/register_repo_impl.dart';

import '../../../data/model/user_info_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepoImpl) : super(RegisterInitial());

  final RegisterRepoImpl registerRepoImpl;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> registerWidthEmailAndPassword() async {
    emit(RegisterLoading());

    final register = await registerRepoImpl.registerWithEmailAndPassword(
        email: emailController.text.trim(),
        password: emailController.text.trim(),
        name: nameController.text);

    register.fold((failure) {
      emit(RegisterFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(RegisterSuccess(userInfoModel: user));
    });
  }


  Future<void> registerWithFacebook() async {
    emit(RegisterLoading());
    final register = await registerRepoImpl.registerWithFacebook();
    register.fold((failure) {
      emit(RegisterFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(RegisterSuccess(userInfoModel: user));
    });
  }
  Future<void> registerWithGoogle() async {
    emit(RegisterLoading());
    final register = await registerRepoImpl.registerWithGoogle();
    register.fold((failure) {
      emit(RegisterFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(RegisterSuccess(userInfoModel: user));
    });
  }
}
