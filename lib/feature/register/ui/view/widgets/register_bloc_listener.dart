//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//core
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
//cubit
import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) =>
          current is RegisterSuccess ||
          current is RegisterFailure ||
          current is RegisterLoading,
      listener: (context, state) {
        if (state is RegisterLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RegisterSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.homeScreen);
        } else if (state is RegisterFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsManger.primaryColor,
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
