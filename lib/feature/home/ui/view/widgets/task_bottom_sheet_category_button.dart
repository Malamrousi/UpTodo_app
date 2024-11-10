import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_manger.dart';
import 'task_bottom_sheet_show_category_dialog.dart';

class TaskBottomSheetCategoryButton extends StatelessWidget {
  const TaskBottomSheetCategoryButton(
      {super.key, required this.selectCategory});
  final void Function(Map<String, dynamic> category) selectCategory;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: TaskBottomSheetShowCategoryDialog(
                    categorySelected: selectCategory),
              );
            });
      },
      icon: const Icon(
        Icons.label_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
