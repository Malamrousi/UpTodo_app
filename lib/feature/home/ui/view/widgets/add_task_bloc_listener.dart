import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class AddTaskBlocListener extends StatelessWidget {
  const AddTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TaskState>(
      listenWhen: (previous, current) =>
          current is TaskFailure ||
          current is TaskSuccess ||
          current is TaskLoading,
      listener: (context, state) {
        if (state is TaskLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TaskFailure) {
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
        } else if (state is TaskSuccess) {
          context.pop();
          context.pop();

        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
