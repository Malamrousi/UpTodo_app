import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';

class TaskScreenButton extends StatelessWidget {
  const TaskScreenButton({super.key,required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppTextButton(
        onPressed: onPressed,
        buttonText: 'Edit Task',
        backgroundColor: ColorsManger.primaryColor,
        textStyle: AppStyles.font16WhiteRegular,
        bottomWidth:MediaQuery.sizeOf(context).width * .9,
        bottomHeight: 48.h,
      ),
    );
  }
}
