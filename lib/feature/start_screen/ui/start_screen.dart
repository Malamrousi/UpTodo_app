//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//Core
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';
//widgets
import 'widgets/auth_navigation_button.dart';
import 'widgets/custom_app_bar.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //custom app bar
      appBar: customAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome to UpTodo',
                  style: AppStyles.font32WhiteBold,
                ),
                verticalSpacing(26),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Please login to your account or create new account to continue',
                    style: AppStyles.font16WhiteOpacity66Regular,
                  ),
                ),
                const Expanded(child: SizedBox()),
                const AuthNavigationButton(),
                verticalSpacing(37),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
