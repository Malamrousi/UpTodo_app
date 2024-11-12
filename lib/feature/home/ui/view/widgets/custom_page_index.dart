import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
import 'package:uptodo/feature/home/ui/view/widgets/index_screen_no_data_state.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/loading_widget .dart';
import '../../../../calendar/ui/view/calendar_screen.dart';
import 'index_screen_has_data.dart';

class CustomPageIndex {
  static final List<Widget> pages = [
    BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskSuccess) {
          if(state.notCompletedTasks.isEmpty && state.completedTasks.isEmpty){ 
            return const IndexScreenNoDataState();
          }
          else {
            return const IndexScreenHasData();
          }
        } else if(state is TaskFailure) {
         return Center(child: Text(state.errorMessage , style: AppStyles.font16WhiteRegular),);
        }else{
          return const LoadingWidget();
        }
      },
    ),
    // CalendarScreen
    const CalendarScreen(),
    const Center(
        child: Text(
      'Focus Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      'Profile Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
  ];
}