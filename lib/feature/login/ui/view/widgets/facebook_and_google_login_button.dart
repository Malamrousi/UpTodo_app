import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/spacing.dart';
import '../../cubit/login_cubit/login_cubit.dart';
import 'custom_login_social_auth_button.dart';

class FacebookAndGoogleLoginButton extends StatelessWidget {
  const FacebookAndGoogleLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoginSocialAuthButton(
            onPressed: () {
              context.read<LoginCubit>().loginWithGoogle();
            },
            buttonText: ' Login with Google',
            socialImage: 'assets/svgs/google.svg'),
        verticalSpacing(20),
        CustomLoginSocialAuthButton(
            onPressed: () {
              context.read<LoginCubit>().loginWithFacebook();
            },
            buttonText: 'Login with FaceBook',
            socialImage: 'assets/svgs/facebook.svg'),
      ],
    );
  }
}
