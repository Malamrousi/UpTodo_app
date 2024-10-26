import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRegisterSocialAuthButton extends StatelessWidget {
  const CustomRegisterSocialAuthButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      required this.buttonText,
      this.textStyle,
      this.onPressed,
      this.bottomHeight,
      this.bottomWidth,
      required this.socialImage});

  final double? borderRadius;
  final Color? backgroundColor;

  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? bottomHeight;
  final double? bottomWidth;
  final String socialImage;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll<Size>(
            Size(bottomWidth?.w ?? double.maxFinite, bottomHeight ?? 48.h)),
        backgroundColor: WidgetStatePropertyAll<Color>(
            backgroundColor ?? Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4.r),
            side: const BorderSide(color: ColorsManger.purpleColor),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SvgPicture.asset(socialImage),
          Text(
            buttonText,
            style: AppStyles.font16WhiteRegular,
          ),
         
        ],
      ),
    );
  }
}
