import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theming/app_styles.dart';

import '../../../../../core/theming/colors_manger.dart';
import '../../../../home/data/model/task_model.dart';

class TaskScreenTimeDisplayContainer extends StatelessWidget {
  const TaskScreenTimeDisplayContainer(
      {super.key, required this.taskModel, required this.onTap});
  final TaskModel taskModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 31.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: ColorsManger.darkGray,
        ),
        child: Center(
          child: Text(
            '${taskModel.date!.day}/${taskModel.date!.month} At ${taskModel.startTime!}',
            style: AppStyles.font12WhiteColorRegular,
          ),
        ),
      ),
    );
  }
}


