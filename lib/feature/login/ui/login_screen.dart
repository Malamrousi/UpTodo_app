import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/app_regx.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/core/widget/app_text_button.dart';
import 'package:uptodo/feature/login/ui/widgets/custom_social_auth_button.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/widget/app_text_form_filed.dart';
import '../../../core/widget/build_app_bar.dart';
import 'widgets/custom_divider.dart';
import 'widgets/dont_have_account_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureTextIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 33.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20),
              Text(
                'Login',
                style: AppStyles.font32WhiteBold,
              ),
              verticalSpacing(53),
              InputTextFormFiled(
                keyboardType: TextInputType.emailAddress,
                inputTextType: 'Email',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter valid email';
                  }
                },
                hintText: 'Enter your Email',
              ),
              verticalSpacing(25),
              InputTextFormFiled(
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscureTextIcon,
                inputTextType: 'Password',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isPasswordValid(value)) {
                    return 'Please enter valid Password';
                  }
                },
                hintText: 'Enter your Email',
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureTextIcon = !obscureTextIcon;
                    });
                  },
                  child: Icon(
                    obscureTextIcon ? Icons.visibility : Icons.visibility_off,
                    color: ColorsManger.purpleColor,
                    size: 22.sp,
                  ),
                ),
              ),
              verticalSpacing(69),
              AppTextButton(
                backgroundColor: ColorsManger.purpleColor,
                buttonText: 'login',
                textStyle: AppStyles.font16WhiteRegular,
              ),
              verticalSpacing(45),
              const CustomDivider(),
              verticalSpacing(29),
              const CustomSocialAuthButton(
                  buttonText: ' Login with Google',
                  socialImage: 'assets/svgs/google.svg'),
              verticalSpacing(20),
              const CustomSocialAuthButton(
                  buttonText: 'Login with FaceBook',
                  socialImage: 'assets/svgs/facebook.svg'),
              verticalSpacing(46),
             const Align(
                  alignment: Alignment.center,
                  child:  DontHaveAccountText()),
            ],
          ),
        )),
      ),
    );
  }
}
