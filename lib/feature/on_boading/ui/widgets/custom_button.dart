import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.backgroundColor,
  
      required this.text,
      this.onPressed, this.textStyle});

  final Color? backgroundColor;

  final String text;

  final void Function()? onPressed;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          )),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
