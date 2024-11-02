//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class IndexScreenTaskCompleted extends StatelessWidget {
  const IndexScreenTaskCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 80.h,
          color: ColorsManger.darkGray,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
                activeColor: ColorsManger.primaryColor,
                checkColor: ColorsManger.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide(
                    color: ColorsManger.whiteColor,
                    width: 1.3,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do Math Homework',
                    style: AppStyles.font16WhiteRegular,
                  ),
                  verticalSpacing(4),
                  Text(
                    'Today At 16:45',
                    style: AppStyles.font14GrayColorRegular,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
