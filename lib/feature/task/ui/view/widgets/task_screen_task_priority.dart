import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../home/ui/view/widgets/task_bottom_sheet_show_priority_dialog.dart';

class TaskScreenTaskPriority extends StatefulWidget {
  const TaskScreenTaskPriority({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskScreenTaskPriority> createState() => _TaskScreenTaskPriorityState();
}

class _TaskScreenTaskPriorityState extends State<TaskScreenTaskPriority> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.flag_outlined,
          color: ColorsManger.whiteColor,
          size: 24,
        ),
        Text(
          ' Task Priority :',
          style: AppStyles.font16WhiteRegular,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                      child: TaskBottomSheetShowPriorityDialog(
                    taskPriority: (priority) => {
                      setState(() {
                        widget.taskModel.taskPriority = priority  ;
                      })
                    },
                  ));
                });
          },
          child: Container(
            width: 70,
            height: 37,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorsManger.darkGray),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.svgsFlag),
                horizontalSpacing(4),
                Text(
                '${ widget.taskModel.taskPriority}',
                  style: AppStyles.font12WhiteColorRegular,
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }
}
