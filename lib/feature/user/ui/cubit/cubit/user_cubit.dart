
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repo/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepoImpl) : super(UserInitial());

  UserModel? currentUser;
  final UserRepoImpl userRepoImpl;
  final ImagePicker picker = ImagePicker();

  TextEditingController nameController = TextEditingController();

  void getCurrentUser(UserModel userModel) async {
    emit(UserLoading());
    final result = await userRepoImpl.getCurrentUser(userModel);
    result.fold(
      (failure) => emit(UserFailure(errorMessage: failure.errorMessage)),
      (user) {
        currentUser = user;
        emit(UserSuccess(userModel: user));
      },
    );
  }

  void changePassword(dynamic password) async {
    final user = await userRepoImpl.changePassword(password);
    user.fold((failure) {
      emit(UserFailure(errorMessage: failure.errorMessage));
    }, (_) {
      emit(PasswordChangeSuccess());
    });
  }

  Future<void> updateUserName(UserModel userModel, String name) async {
    emit(UserLoading());
    final result = await userRepoImpl.updateUserName(userModel, name);
    result.fold(
      (failure) {
        emit(UserFailure(errorMessage: failure.errorMessage));
      },
      (_) {
        emit(NameUpdateSuccess());
        getCurrentUser(userModel);
      },
    );
  }

  void logOut() async {
    try {
      await userRepoImpl.logOut();

      emit(UserLogOutSuccess());
    } catch (e) {
      emit(UserFailure(errorMessage: e.toString()));
    }
  }
}
