import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have an account ',
              style: AppStyles.font16WhiteOpacity66Regular),
          TextSpan(
              text: 'Login',
              style: AppStyles.font16WhiteRegular,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(Routes.loginScreen);
                }),
        ]));
  }
}
