//packages  
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/extension.dart';

//cubit
import 'package:uptodo/feature/register/ui/cubit/register_cubit/register_cubit.dart';
//Core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';
//Widgets
import 'widgets/aleardy_have_an_account.dart';
import 'widgets/register_bloc_listener.dart';
import 'widgets/register_form.dart';
import 'package:uptodo/core/widget/build_app_bar.dart';
import 'package:uptodo/feature/register/ui/view/widgets/custom_divider.dart';
import 'package:uptodo/feature/register/ui/view/widgets/custom_register_social_auth_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                'Register',
                style: AppStyles.font32WhiteBold,
              ),
              verticalSpacing(53),
              const RegisterForm(),
              verticalSpacing(69),
              AppTextButton(
                backgroundColor: ColorsManger.primaryColor,
                buttonText: 'Register',
                textStyle: AppStyles.font16WhiteRegular,
                onPressed: () {
                  registerWidthEmailAndPassword(context);
                },
              ),
              verticalSpacing(45),
              const CustomDivider(),
              verticalSpacing(29),
               CustomRegisterSocialAuthButton(
                onPressed: () {
                  context.read<RegisterCubit>().registerWithGoogle();
                },
                  buttonText: ' Register with Google',
                  socialImage: 'assets/svgs/google.svg'),
                       verticalSpacing(20),
               CustomRegisterSocialAuthButton(
                onPressed: () {
                    context.read<RegisterCubit>().registerWithFacebook();
                },
                  buttonText: 'Register with Facebook',
                  socialImage: 'assets/svgs/facebook.svg'),
              verticalSpacing(46),
              const Align(
                  alignment: Alignment.center, child: AlreadyHaveAnAccount()),
                  const RegisterBlocListener(),
            ],
          ),
        )),
      ),
    );
  }
  void registerWidthEmailAndPassword(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().registerWidthEmailAndPassword();
    }
  }
}
