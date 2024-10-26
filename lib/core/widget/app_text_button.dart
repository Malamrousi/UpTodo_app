import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      this.borderRadius,
      this.backgroundColor,
      required this.buttonText,
      this.textStyle,
      this.onPressed,
      this.bottomHeight,
      this.bottomWidth});

  final double? borderRadius;
  final Color? backgroundColor;

  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? bottomHeight;
  final double? bottomWidth;

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
        child: Text(
          buttonText,
          style: textStyle,
        ));
  }
}
