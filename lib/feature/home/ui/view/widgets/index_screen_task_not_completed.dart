//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';
//core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';

class IndexScreenTaskNotCompleted extends StatelessWidget {
  const IndexScreenTaskNotCompleted({super.key});

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
                value: false,
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
                  Row(
                    children: [
                      Text(
                        'Today At 16:45',
                        style: AppStyles.font14GrayColorRegular,
                      ),
                      horizontalSpacing(MediaQuery.sizeOf(context).width * 0.1),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: const Color(0xff809CFF)),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.svgsUniversity,
                              width: 21,
                              height: 15,
                            ),
                            horizontalSpacing(2),
                            Text(
                              'University',
                              style: AppStyles.font12WhiteColorRegular,
                            ),
                          ],
                        ),
                      ),
                      horizontalSpacing(8),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            border: Border.all(
                              color: ColorsManger.primaryColor,
                            )),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              ImageAssets.svgsFlag,
                              width: 14,
                              height: 14,
                            ),
                            Text(
                              '2',
                              style: AppStyles.font12WhiteColorRegular,
                            ),
                          ],
                        ),
                      ),
                    ],
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
