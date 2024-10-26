import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

import '../../../../core/theming/app_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Divider(
          color: ColorsManger.grayColor,
          thickness: .6.w,
        ),
      ),
      horizontalSpacing(2),
      Text(
        'oR',
        style: AppStyles.font16WhiteOpacity66Regular,
      ),
      horizontalSpacing(2),
      Expanded(
        child: Divider(
          color: ColorsManger.grayColor,
          thickness: .6.w,
        ),
      ),
    ]);
  }
}
