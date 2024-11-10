import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/home/ui/cubit/update_task/update_task_cubit.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/routing/routes.dart';
import '../../../data/model/task_model.dart';
import '../widgets/task_screen_app_bar.dart';
import '../widgets/task_screen_delete_task.dart';
import '../widgets/task_screen_edit_task_button.dart';
import '../widgets/task_screen_task_category.dart';
import '../widgets/task_screen_task_priority.dart';
import '../widgets/task_screen_task_time.dart';
import '../widgets/task_screen_tittle_and_des.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
    required this.taskModel,
  });

  final TaskModel taskModel;

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TaskScreenAppBar(),
                verticalSpacing(30),
                 TaskScreenTittleAndDes(
                  taskModel: widget.taskModel,
                ),
                verticalSpacing(84),
                 TaskScreenTaskTime(
                  taskModel: widget.taskModel,
                 ),
                verticalSpacing(30),
                 TaskScreenTaskCategory(
                  taskModel: widget.taskModel,
                ),
                verticalSpacing(30),
                 TaskScreenTaskPriority(
                  taskModel:widget.taskModel,
                ),
                verticalSpacing(30),
                TaskScreenDeleteTask(
                  taskModel: widget.taskModel,
                ),
                verticalSpacing(MediaQuery.sizeOf(context).height * 0.3),
               TaskScreenButton(
                onPressed: () {
                  context.read<UpdateTaskCubit>().updateTask( widget.taskModel);
                  context.pushNamedAndRemoveUntil( Routes.homeScreen);
                },
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
