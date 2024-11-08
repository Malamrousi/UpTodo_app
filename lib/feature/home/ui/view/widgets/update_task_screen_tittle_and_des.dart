import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';
import 'package:uptodo/core/theming/app_styles.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/colors_manger.dart';

class UpdateTaskScreenTittleAndDes extends StatelessWidget {
  const UpdateTaskScreenTittleAndDes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Checkbox(
        value: false,
        onChanged: (value) {},
        activeColor: ColorsManger.primaryColor,
        checkColor: ColorsManger.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: const BorderSide(
            color: ColorsManger.whiteColor,
            width: 1.3,
          ),
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Do Math Homework',
          style: AppStyles.font20WhiteColorRegular,
        ),
        verticalSpacing(10),
        Text(
          'Do chapter 2 to 5 for next week',
          style: AppStyles.font16GrayColorRegular,
        )
      ]),
      const Spacer(),
      IconButton(
          onPressed: () {}, icon: SvgPicture.asset(ImageAssets.svgRewrite)),

    ]);
  }
}
