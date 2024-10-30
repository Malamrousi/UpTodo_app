import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';

class HomeScreenNoDataState extends StatelessWidget {
  const HomeScreenNoDataState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          verticalSpacing(74),
          Image.asset('assets/images/home_screen_no_data.png'),
          verticalSpacing(10),
          Text(
            textAlign: TextAlign.center,
            'What do you want to do today?',
            style: AppStyles.font20WhiteColorRegular
          ),
           verticalSpacing(10),
             Text(
            'Tap + to add your tasks',
            style: AppStyles.font16WhiteRegular,
          ),

        ],
      ),
    );
  }
}