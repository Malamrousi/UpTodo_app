//package
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/core/theming/font_weight_helper.dart';

class AppStyles {
  static TextStyle font32WhiteBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManger.whiteColor);

  static TextStyle font28WhiteBold = TextStyle(
      fontSize: 28.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManger.whiteColor);

  static TextStyle font16WhiteRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColor);
  static TextStyle font16WhiteOpacity44Regular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColorOpacity44);
  static TextStyle font16WhiteOpacity66Regular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColorOpacity66);
  static TextStyle font16smokeGrayColorRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.smokeGrayColor);
  static TextStyle font20WhiteColorRegular = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColor);
  static TextStyle font20WhiteColorBold = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManger.whiteColor);

  static TextStyle font14GrayColorRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.grayColor);
      
  static TextStyle font16GrayColorRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.grayColor);
  static TextStyle font12WhiteColorRegular = TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColor);
  static TextStyle font14WhiteColorRegular = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.whiteColor);
  static TextStyle font16WPrimaryColorRegular = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManger.primaryColor);
}
