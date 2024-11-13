//MATERIAL
import 'package:flutter/material.dart';
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
//NumberFoCompletedAndNotCompleted widget
import '../../../../../core/theming/app_styles.dart';
//UserImageAndName widget
import 'custom_text_and_icon.dart';
class UserAppSettingAndUpToDo extends StatelessWidget {
  const UserAppSettingAndUpToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
            verticalSpacing(32),
        Text(
            'Setting',
            style: AppStyles.font14GrayColorRegular,
          ),
                verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.settings_outlined,
            title: 'App Settings',
          ),
          verticalSpacing(32),
          Text(
            'Account',
            style: AppStyles.font14GrayColorRegular,
          ),
              verticalSpacing(32),
          const CustomTextAndIcon(
            icon: Icons.person_2_outlined,
            title: 'Change account name',
          ),
          verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.key_outlined,
            title: 'Change account password',
          ),
          verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.camera_alt_outlined,
            title: 'Change account Image',
          ),
          verticalSpacing(32),
          Text(
            'Uptodo',
            style: AppStyles.font14GrayColorRegular,
          ),
          verticalSpacing(32),
          const CustomTextAndIcon(
            icon: Icons.workspaces_outlined,
            title: 'About US',
          ),
          verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.info_outlined,
            title: 'FAQ',
          ),
          verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.bolt_outlined,
            title: 'Help & Feedback',
          ),
          verticalSpacing(20),
          const CustomTextAndIcon(
            icon: Icons.thumb_up_outlined,
            title: 'Support US',
          ),
      ],
    );
  }
}