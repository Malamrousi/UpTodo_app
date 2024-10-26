//packages
import 'package:flutter/material.dart';
//core
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/theming/colors_manger.dart';
import 'package:uptodo/core/routing/routes.dart';
import 'package:uptodo/core/helper/extension.dart';

//widgets
import '../../../../core/widget/app_text_button.dart';

class AuthNavigationButton extends StatelessWidget {
  const AuthNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          buttonText: 'LOGIN',
          backgroundColor: ColorsManger.purpleColor,
          textStyle: AppStyles.font16WhiteRegular,
        ),
        verticalSpacing(28),
        AppTextButton(
          onPressed: () {
            context.pushNamed(Routes.registerScreen);
          },
          buttonText: 'Create account',
          textStyle: AppStyles.font16WhiteRegular,
        ),
      ],
    );
  }
}
