import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/user_model.dart';
import '../../../data/repo/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepoImpl) : super(UserInitial());

  final UserRepoImpl userRepoImpl;

  void getCurrentUser(UserModel userModel) async {
    final user = await userRepoImpl.getCurrentUser(userModel);
    user.fold((failure) {
      emit(UserFailure(errorMessage: failure.errorMessage));
    }, (user) {
      emit(UserSuccess(userModel: user));
    });
  }

  void changePassword(dynamic password) async {
    final user = await userRepoImpl.changePassword(password);
    user.fold((failure) {
      emit(UserFailure(errorMessage: failure.errorMessage));
    }, (_) {
      emit(PasswordChangeSuccess());
    });
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
