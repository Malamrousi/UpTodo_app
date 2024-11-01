import 'package:flutter/material.dart';
import 'package:uptodo/feature/home/ui/view/widgets/task_bottom_sheet_show_time_picker.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskBottomSheetTimeButton extends StatelessWidget {
  const TaskBottomSheetTimeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        const TaskBottomSheetShowTimePicker();
      },
      icon: const Icon(
        Icons.timer_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
