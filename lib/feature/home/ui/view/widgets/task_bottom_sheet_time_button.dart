import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskBottomSheetTimeButton extends StatelessWidget {
  const TaskBottomSheetTimeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon:const Icon(
        Icons.timer_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
