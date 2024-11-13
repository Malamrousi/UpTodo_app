//MATERIAL
import 'package:flutter/material.dart';
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
//NumberFoCompletedAndNotCompleted widget
import 'number_fo_completed_and_not_completed.dart';
//UserImageAndName widget
import 'user_app_setting_and_up_to_do.dart';
//UserImageAndName widget
import 'user_image_and_name.dart';
//UserLogOut Widget
import 'user_log_out.dart';

class UserScreenBody extends StatelessWidget {
  const UserScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const UserImageAndName(),
          verticalSpacing(20),
          const NumberFoCompletedAndNotCompleted(),
          verticalSpacing(32),
          const UserAppSettingAndUpToDo(),
          verticalSpacing(20),
          const UserLogOut(),
        ],
      ),
    ));
  }
}
