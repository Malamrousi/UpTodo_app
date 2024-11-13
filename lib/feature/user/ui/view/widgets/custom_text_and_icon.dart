//package
import 'package:flutter/material.dart';
//spacing
import '../../../../../core/helper/spacing.dart';
//AppStyles
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class CustomTextAndIcon extends StatelessWidget {
  const CustomTextAndIcon({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorsManger.whiteColor,
        ),
        horizontalSpacing(10),
        Text(
          title,
          style: AppStyles.font16WhiteRegular,
        ),
        const Spacer(),
        const Icon(
          Icons.arrow_forward_ios,
          color: ColorsManger.whiteColor,
        ),
      ],
    );
  }
}
