import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskBottomSheetPriorityButton extends StatelessWidget {
  const TaskBottomSheetPriorityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.flag_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
