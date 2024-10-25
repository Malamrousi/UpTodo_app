import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_styles.dart';

class BuildPage extends StatelessWidget {
  const BuildPage({super.key, required this.image, required this.title, required this.subTitle});

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4.h,
          child: Image.asset(
            image,
            fit: BoxFit.contain,
          ),
        ),
        verticalSpacing(80),
        Text(
         title,
          style: AppStyles.font32WhiteBold,
        ),
        verticalSpacing(42),
        Text(
         subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.font16WhiteRegular,
        ),
      ],
    );
  }
}
