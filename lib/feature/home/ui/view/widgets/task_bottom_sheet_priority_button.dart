import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';
import '../../../../task/ui/view/widgets/task_bottom_sheet_show_priority_dialog.dart';

class TaskBottomSheetPriorityButton extends StatelessWidget {
  const TaskBottomSheetPriorityButton({super.key ,required this.taskPriority});

  final void Function(int) taskPriority;


  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: TaskBottomSheetShowPriorityDialog(
              taskPriority: taskPriority
            ),
          ),
        );
      },
      icon: const Icon(
        Icons.flag_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
