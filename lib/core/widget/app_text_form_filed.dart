import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class InputTextFormFiled extends StatelessWidget {
  const InputTextFormFiled(
      {super.key,
      this.hintText,
      this.focusBorder,
      this.enabledBorder,
      this.hintStyle,
      this.inputTextStyle,
      this.obscureText,
      this.controller,
      required this.validator,
      this.keyboardType,
      required this.inputTextType,
      this.suffixIcon});

  final String? hintText;
  final TextInputType? keyboardType;
  final InputBorder? focusBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function(String? value) validator;
  final String inputTextType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputTextType,
          style: AppStyles.font16WhiteRegular,
        ),
        verticalSpacing(8),
        TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: (value) {
            return validator(value);
          },
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: ColorsManger.charcoalGrayColor,
              enabledBorder: enabledBorder ?? inputBorder(),
              focusedBorder: focusBorder ?? inputBorder(),
              errorBorder: errorBorder(),
              focusedErrorBorder: errorBorder(),
              hintText: hintText,
              hintStyle: hintStyle ?? AppStyles.font16smokeGrayColorRegular),
        ),
      ],
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide:
          const BorderSide(color: ColorsManger.stoneGrayColor, width: 1.3),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: const BorderSide(color: Colors.red, width: 1.3),
    );
  }
}
