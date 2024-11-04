//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
//core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class IndexScreenTaskNotCompleted extends StatefulWidget {
  const IndexScreenTaskNotCompleted({super.key});

  @override
  State<IndexScreenTaskNotCompleted> createState() =>
      _IndexScreenTaskNotCompletedState();
}

class _IndexScreenTaskNotCompletedState
    extends State<IndexScreenTaskNotCompleted> {
  @override


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: context.read<TaskCubit>().taskList.length,
          itemBuilder: (context, index) {
            final task = context.read<TaskCubit>().taskList[index];

            final taskCategory =
                context.read<TaskCubit>().taskList[index].category;

            return Padding(
              padding: EdgeInsets.only(top: 20.h),
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
                          value: false,
                          onChanged: (value) {},
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
                              task.title,
                              style: AppStyles.font16WhiteRegular,
                            ),
                            verticalSpacing(4),
                            Row(
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  '${task.date.day} /${task.date.month} At ${task.startTime}',
                                  style: AppStyles.font14GrayColorRegular,
                                ),
                                horizontalSpacing(
                                    MediaQuery.sizeOf(context).width * 0.1),
                                Container(
                               
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: Color(
                                      int.parse(taskCategory['color'].toString()),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      showCategoryIcon(taskCategory['icon'] ),
                                  
                                      horizontalSpacing(6),
                                      Text(
                                        overflow: TextOverflow.ellipsis,
                                        taskCategory['name'] ?? 'personal',
                                        style:
                                            AppStyles.font12WhiteColorRegular,
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpacing(6),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      border: Border.all(
                                        color: ColorsManger.primaryColor,
                                      )),

                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.svgsFlag,
                                        width: 14,
                                        height: 14,
                                      ),
                                      Text(
                                        '${task.taskPriority+1} ',
                                        style:
                                            AppStyles.font12WhiteColorRegular,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget showCategoryIcon(String icon , {Color? color}) {
    if (icon.startsWith('assets')) {
      return SvgPicture.asset(
        icon,
        width: 14,
        height: 14,
      );
    } else {
      return Icon(
        color: color ?? ColorsManger.whiteColor,
        size: 21,
        IconData(
        int.parse(icon),
        fontFamily: 'MaterialIcons',
      ));
    }
  }
}
