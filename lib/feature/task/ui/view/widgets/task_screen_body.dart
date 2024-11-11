import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';
import 'package:uptodo/feature/task/ui/view/widgets/task_screen_app_bar.dart';
import 'package:uptodo/feature/task/ui/view/widgets/task_screen_bloc_listener.dart';
import 'package:uptodo/feature/task/ui/view/widgets/task_screen_task_priority.dart';
import 'package:uptodo/feature/task/ui/view/widgets/task_screen_task_time.dart';

import '../../../../../core/helper/spacing.dart';
import '../../cubit/update_task/update_and_delete_task_cubit.dart';
import 'task_screen_delete_task.dart';
import 'task_screen_edit_task_button.dart';
import 'task_screen_task_category.dart';
import 'task_screen_tittle_and_des.dart';

class TaskScreenBody extends StatelessWidget {
  final TaskModel taskModel;

  const TaskScreenBody({
    super.key,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TaskScreenAppBar(),
              verticalSpacing(30),
              TaskScreenTittleAndDes(taskModel: taskModel),
              verticalSpacing(84),
              TaskScreenTaskTime(taskModel: taskModel),
              verticalSpacing(30),
              TaskScreenTaskCategory(taskModel: taskModel),
              verticalSpacing(30),
              TaskScreenTaskPriority(taskModel: taskModel),
              verticalSpacing(30),
              TaskScreenDeleteTask(taskModel: taskModel),
              verticalSpacing(MediaQuery.of(context).size.height * 0.3),
              const TaskScreenBlocListener(),
              TaskScreenButton(
                onPressed: () => context
                    .read<UpdateAndDeleteTaskCubit>()
                    .updateTask(taskModel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}