import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/home/ui/cubit/update_task/update_task_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class TaskScreenBlocListener extends StatelessWidget {
  const TaskScreenBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateTaskCubit, UpdateTaskState>(
      listenWhen: (previous, current) =>
          current is UpdateTaskSuccess ||
          current is UpdateTaskFailure ||
          current is UpdateTaskLoading,
      listener: (context, state) {
        if (state is UpdateTaskSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(Routes.homeScreen);
        } else if (state is UpdateTaskFailure) {
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
        } else {
          showDialog(
              context: context,
              builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ));
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
