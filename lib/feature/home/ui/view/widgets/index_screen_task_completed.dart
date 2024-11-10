//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
//core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class IndexScreenTaskCompleted extends StatefulWidget {
  const IndexScreenTaskCompleted({super.key});

  @override
  State<IndexScreenTaskCompleted> createState() =>
      _IndexScreenTaskCompletedState();
}

class _IndexScreenTaskCompletedState extends State<IndexScreenTaskCompleted> {


  TimeOfDay endTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ListView.builder(
        itemCount: context.read<TaskCubit>().completedTasksList.length,
        itemBuilder: (context, index) {
          var task = context.read<TaskCubit>().completedTasksList[index];
          return Padding(
            padding:  EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 80.h,
                  color: ColorsManger.darkGray,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: task.isDone ?? true,
                        onChanged: (value) {
                          context.read<TaskCubit>().updateTaskDone(
                                endTime: endTime,
                                isDone: value ?? true,
                                taskModel: task,
                              );
                        },
                        activeColor: ColorsManger.primaryColor,
                        checkColor: ColorsManger.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          side: const BorderSide(
                            color: ColorsManger.whiteColor,
                            width: 1.3,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            task.title!,
                            style: AppStyles.font16WhiteRegular,
                          ),
                          verticalSpacing(4),
                          Text(
                            '${task.endTime}',
                            style: AppStyles.font14GrayColorRegular,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
