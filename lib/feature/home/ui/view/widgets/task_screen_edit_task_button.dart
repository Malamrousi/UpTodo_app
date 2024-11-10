import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';

class TaskScreenButton extends StatelessWidget {
  const TaskScreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: AppTextButton(
        onPressed: () {
          context.pushNamedAndRemoveUntil(Routes.homeScreen);
        },
        buttonText: 'Edit Task',
        backgroundColor: ColorsManger.primaryColor,
        textStyle: AppStyles.font16WhiteRegular,
        bottomWidth:MediaQuery.sizeOf(context).width * .9,
        bottomHeight: 48.h,
      ),
    );
  }
}
