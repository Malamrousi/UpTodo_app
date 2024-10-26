import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Don\'t have an account? ',
              style: AppStyles.font16WhiteOpacity66Regular),
          TextSpan(
              text: 'Sign Up',
              style: AppStyles.font16WhiteRegular,
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ]));
  }
}
