//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import 'package:uptodo/core/helper/spacing.dart';

//widgets
import 'add_task_form.dart';

class AddAskBottomSheer extends StatelessWidget {
  const AddAskBottomSheer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: double.infinity,
      height: 300.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ask a Task',
            style: AppStyles.font20WhiteColorBold,
          ),
          verticalSpacing(14),
          const AddTaskForm(),
        ],
      ),
    );
  }
}
