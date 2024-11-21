//packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/home/presentation/cubit/task/task_cubit.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/loading_widget .dart';
import 'index_screen_task_not_completed_widget.dart';

class IndexScreenTaskNotCompletedState extends StatelessWidget {
  const IndexScreenTaskNotCompletedState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(child: LoadingWidget());
        }

        if (state is TaskSuccess) {
          if (state.notCompletedTasks.isEmpty) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('No tasks to do Add your first task',
                  style: AppStyles.font16WhiteRegular),
            ));
          } else {
            return const IndexScreenTaskNotCompletedWidget();
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
