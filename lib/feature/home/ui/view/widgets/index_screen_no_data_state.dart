//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/feature/home/ui/view/widgets/custom_app_bar.dart';

class IndexScreenNoDataState extends StatelessWidget {
  const IndexScreenNoDataState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w , vertical: 30.h),
      child: Column(
        
        children: [
          const CustomAppBar(),
          verticalSpacing(74),
          Image.asset('assets/images/home_screen_no_data.png'),
          verticalSpacing(10),
          Text(
              textAlign: TextAlign.center,
              'What do you want to do today?',
              style: AppStyles.font20WhiteColorRegular),
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