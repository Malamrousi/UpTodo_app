//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/feature/home/ui/view/widgets/task_bottom_sheet_priority_button.dart';
import 'package:uptodo/feature/home/ui/view/widgets/task_bottom_sheet_send_button_.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import 'package:uptodo/core/helper/spacing.dart';

//widgets
import 'add_task_form.dart';
import 'task_bottom_sheet_category_button.dart';
import 'task_bottom_sheet_show_time_picker.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 320.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Task',
            style: AppStyles.font20WhiteColorBold,
          ),
          verticalSpacing(14),
          const AddTaskForm(),
    verticalSpacing(20),
          const Expanded(
            child: Row(
              children: [
                TaskBottomSheetShowTimePicker(),
                TaskBottomSheetCategoryButton(),
                TaskBottomSheetPriorityButton(),
                Spacer(),
                TaskBottomSheetSendButton(),
              ],
            ),
          ),
     
        ],
      ),
    );
  }
}
