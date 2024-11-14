//MATERIAL
import 'package:flutter/material.dart';
// Spacing
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/feature/user/data/model/user_model.dart';
//NumberFoCompletedAndNotCompleted widget
import '../../../../../core/theming/app_styles.dart';
//UserImageAndName widget
import 'change_password_widget.dart';
import 'custom_text_and_icon.dart';

class UserAppSettingAndUpToDo extends StatefulWidget {
  const UserAppSettingAndUpToDo({super.key, required this.userModel});
  final UserModel userModel;
  @override
  State<UserAppSettingAndUpToDo> createState() =>
      _UserAppSettingAndUpToDoState();
}

class _UserAppSettingAndUpToDoState extends State<UserAppSettingAndUpToDo> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
      ChangePasswordWidget(userModel: widget.userModel,),
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
