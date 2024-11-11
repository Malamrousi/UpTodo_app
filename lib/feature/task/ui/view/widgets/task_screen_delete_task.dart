import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';
import 'package:uptodo/feature/task/ui/cubit/update_task/update_and_delete_task_cubit.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';

class TaskScreenDeleteTask extends StatelessWidget {
  const TaskScreenDeleteTask({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
                title: const Text('Are you sure?'),
                content:
                    const Text('You will not be able to undo this action!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<UpdateAndDeleteTaskCubit>()
                          .deleteTask(taskModel);
                      context.pushNamedAndRemoveUntil(Routes.homeScreen);
                    },
                  
                    child: const Text('Delete'),
                  )
                ]
                );
          },
        );
      },
      child: Row(
        children: [
          const Icon(
            Icons.delete_outline_rounded,
            color: Colors.red,
          ),
          horizontalSpacing(10),
          Text(
            'Delete Task',
            style: AppStyles.font16RedColorRegular,
          )
        ],
      ),
    );
  }
}
