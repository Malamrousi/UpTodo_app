//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import '../../../../core/theming/colors_manger.dart';

AppBar buildAppBar({void Function()? onPressed}) {
  
  return AppBar(
    leading: IconButton(
        onPressed:onPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorsManger.whiteColor,
          size: 22.sp,
        )),
  );
}
