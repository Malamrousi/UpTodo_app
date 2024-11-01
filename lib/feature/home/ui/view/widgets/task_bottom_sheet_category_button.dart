import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskBottomSheetCategoryButton extends StatelessWidget {
  const TaskBottomSheetCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: () {},
      icon:const Icon(
        Icons.label_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}