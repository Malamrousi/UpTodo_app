import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/theming/colors_manger.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 350.h,
      left: MediaQuery.sizeOf(context).width * 0.35.w,
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        effect: const ScaleEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 26,
            dotHeight: 4,
            paintStyle: PaintingStyle.fill,
            dotColor: ColorsManger.grayColor,
            strokeWidth: 1,
            activeDotColor: ColorsManger.purpleColor),
      ),
    );
  }
}
