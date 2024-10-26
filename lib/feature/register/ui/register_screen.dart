import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/widget/build_app_bar.dart';
import 'package:uptodo/feature/register/ui/widgets/custom_divider.dart';

import '../../../core/helper/app_regx.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/theming/colors_manger.dart';
import '../../../core/widget/app_text_button.dart';
import '../../../core/widget/app_text_form_filed.dart';
import 'widgets/aleardy_have_an_account.dart';
import 'widgets/custom_register_social_auth_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureTextIcon = true;
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
                'Register',
                style: AppStyles.font32WhiteBold,
              ),
              verticalSpacing(53),
              InputTextFormFiled(
                keyboardType: TextInputType.emailAddress,
                inputTextType: 'Username',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isNameValid(value)) {
                    return 'Please enter valid Name';
                  }
                },
                hintText: 'Enter your Email',
              ),
              InputTextFormFiled(
                keyboardType: TextInputType.emailAddress,
                inputTextType: 'Email',
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return 'Please enter valid Email';
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
                buttonText: 'Register',
                textStyle: AppStyles.font16WhiteRegular,
              ),
              verticalSpacing(45),
             const CustomDivider(),
              verticalSpacing(29),
              const CustomRegisterSocialAuthButton(
                  buttonText: ' Register with Google',
                  socialImage: 'assets/svgs/google.svg'),
              const CustomRegisterSocialAuthButton(
                  buttonText: 'Register with Facebook',
                  socialImage: 'assets/svgs/facebook.svg'),
                         verticalSpacing(46),
                            const Align(
                    alignment: Alignment.center,
                    child:  AlreadyHaveAnAccount()),
            ],
          ),
        )),
      ),
    );
  }
}
