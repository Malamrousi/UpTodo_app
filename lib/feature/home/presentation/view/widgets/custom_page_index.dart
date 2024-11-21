import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/home/presentation/cubit/task/task_cubit.dart';
import 'package:uptodo/feature/home/presentation/view/widgets/index_screen_no_data_state.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/loading_widget .dart';
import '../../../../calendar/presentation/view/calendar_screen.dart';
import '../../../../foucs/presentation/view/focus_mode_screen.dart';
import '../../../../user/presentation/view/user_screen.dart';
import 'index_screen_has_data.dart';

class CustomPageIndex {
  static final List<Widget> pages = [
    BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskSuccess) {
          if (state.notCompletedTasks.isEmpty && state.completedTasks.isEmpty) {
            return const IndexScreenNoDataState();
          } else {
            return const IndexScreenHasData();
          }
        } else if (state is TaskFailure) {
          return Center(
            child:
                Text(state.errorMessage, style: AppStyles.font16WhiteRegular),
          );
        } else {
          return const LoadingWidget();
        }
      },
    ),
    // CalendarScreen
    const CalendarScreen(),
    // Focus Screen
    const FocusModeScreen(),
    const UserScreen(),
  ];
}
