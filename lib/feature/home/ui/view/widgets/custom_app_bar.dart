import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon:  Icon(Icons.filter_list,
          color: ColorsManger.whiteColorOpacity66,),
        ),
        Text(
          'Index',
          style: AppStyles.font20WhiteColorRegular,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
            'assets/images/user_image_first.png',
            width: 42.w,
            height: 42.h,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
