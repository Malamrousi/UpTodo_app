import 'package:flutter/material.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/core/widget/app_text_button.dart';

class CustomCategoryButtons extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomCategoryButtons({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppTextButton(
          textStyle: AppStyles.font16WPrimaryColorRegular,
          borderColor: Colors.transparent,
          bottomWidth: MediaQuery.sizeOf(context).width * .35,
          bottomHeight: 48,
          onPressed: onPressed,
          buttonText: 'Cancel',
        ),
        horizontalSpacing(20),
        AppTextButton(
          textStyle: AppStyles.font16WhiteRegular,
          bottomWidth: MediaQuery.sizeOf(context).width * .4,
          bottomHeight: 48,
          onPressed: () {
            context.pop();
          },
          buttonText: 'Create Category',
          backgroundColor: ColorsManger.primaryColor,
        ),
      ],
    );
  }
}
