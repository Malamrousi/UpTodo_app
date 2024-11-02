import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';
import 'task_bottom_sheet_show_priority_dialog.dart';

class TaskBottomSheetPriorityButton extends StatelessWidget {
  const TaskBottomSheetPriorityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: TaskBottomSheetShowPriorityDialog(),
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
