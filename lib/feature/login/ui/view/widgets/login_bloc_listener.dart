//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../cubit/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginSuccess ||
          current is LoginFailure ||
          current is LoginLoading,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.homeScreen);
        } else if (state is LoginFailure) {
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
