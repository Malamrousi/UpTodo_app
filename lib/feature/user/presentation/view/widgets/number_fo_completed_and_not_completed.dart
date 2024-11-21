import 'package:flutter/material.dart';
//Bloc
import 'package:flutter_bloc/flutter_bloc.dart';

// ScreenUtil
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Assets
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
// AppStyles
import '../../../../../core/theming/app_styles.dart';
// Colors
import '../../../../../core/theming/colors_manger.dart';
//TaskCubit
import '../../../../home/presentation/cubit/task/task_cubit.dart';

class NumberFoCompletedAndNotCompleted extends StatelessWidget {
  const NumberFoCompletedAndNotCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildCompletedAndNotCompletedContainer(
            context,
            '${context.read<TaskCubit>().notCompletedTasksList.length}',
            'Task Left'), // todo change to notCompleted'),
        buildCompletedAndNotCompletedContainer(
            context,
            '${context.read<TaskCubit>().completedTasksList.length}',
            ' Task done'),
      ],
    );
  }

  Widget buildCompletedAndNotCompletedContainer(
      BuildContext context, String numberOfTasks, String title) {
    return Container(
        width: 150.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorsManger.darkGray,
        ),
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              numberOfTasks,
              style: AppStyles.font16WhiteRegular,
            ),
            horizontalSpacing(5),
            Text(
              title,
              style: AppStyles.font16WhiteRegular,
            )
          ]),
        ));
  }
}
