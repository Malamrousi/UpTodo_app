//packages
import 'package:flutter/material.dart';
//core
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/theming/colors_manger.dart';
//widgets
import '../../../../core/widget/app_text_button.dart';

class AuthNavigationButton extends StatelessWidget {
  const AuthNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          onPressed: () {},
          buttonText: 'LOGIN',
          backgroundColor: ColorsManger.purpleColor,
          textStyle: AppStyles.font16WhiteRegular,
        ),
        verticalSpacing(28),
        AppTextButton(
          onPressed: () {},
          buttonText: 'Create account',
          textStyle: AppStyles.font16WhiteRegular,
        ),
      ],
    );
  }
}
