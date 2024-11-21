//MATERIAL
import 'package:flutter/material.dart';
//BLOC
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
//Cubit
import 'package:uptodo/feature/user/presentation/cubit/cubit/user_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class UserLogOutBlocListener extends StatelessWidget {
  const UserLogOutBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listenWhen: (previous, current) =>
          current is UserLogOutSuccess ||
          current is UserFailure ||
          current is UserLoading,
      listener: (context, state) {
        if (state is UserLogOutSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.startScreen);
        } else if (state is UserFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsManger.darkColor,
              content: Text(
                state.errorMessage,
                style: AppStyles.font16WhiteRegular,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
