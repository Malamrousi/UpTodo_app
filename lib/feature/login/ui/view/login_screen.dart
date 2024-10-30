import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/core/widget/app_text_button.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/build_app_bar.dart';
import '../cubit/login_cubit/login_cubit.dart';
import 'widgets/custom_divider.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/facebook_and_google_login_button.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/login_form.dart';

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
      appBar: buildAppBar(onPressed: (){
      context.pop();
      }),
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
              const LoginForm(),
              verticalSpacing(69),
              AppTextButton(
                onPressed: () {
                  loginWithEmailAndPassword(context);
                },
                backgroundColor: ColorsManger.purpleColor,
                buttonText: 'login',
                textStyle: AppStyles.font16WhiteRegular,
              ),
              verticalSpacing(45),
              const CustomDivider(),
              verticalSpacing(29),
              const FacebookAndGoogleLoginButton(),
              verticalSpacing(46),
              const Align(
                alignment: Alignment.center,
                child: DontHaveAccountText(),
              ),
              const LoginBlocListener()
            ],
          ),
        )),
      ),
    );
  }

  void loginWithEmailAndPassword(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().loginWithEmailAndPassword();
    }
  }
}
