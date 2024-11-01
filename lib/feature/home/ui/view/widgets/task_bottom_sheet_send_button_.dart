import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskBottomSheetSendButton extends StatelessWidget {
  const TaskBottomSheetSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: () {},
      icon:const Icon(
        Icons.send_rounded,
        color: ColorsManger.primaryColor,
        size: 26,
      ),
    );
  }
}