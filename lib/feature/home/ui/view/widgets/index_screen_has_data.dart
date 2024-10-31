import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/helper/spacing.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
import 'package:uptodo/feature/home/ui/view/widgets/custom_app_bar.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widget/app_text_form_filed.dart';

class IndexScreenHasData extends StatelessWidget {
  const IndexScreenHasData({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          InputTextFormFiled(
      
            keyboardType: TextInputType.text,
            validator: (value) {},
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for your task...',
            inputTextType: '',
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
                   physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    width: double.infinity,
                    height: 80.h,
                    color: ColorsManger.darkGray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          activeColor: ColorsManger.purpleColor,
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
                                horizontalSpacing(
                                    MediaQuery.sizeOf(context).width * 0.1),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      color: const Color(0xff809CFF)),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/svgs/university.svg'),
                                      horizontalSpacing(4),
                                      Text(
                                        'University',
                                        style:
                                            AppStyles.font12WhiteColorRegular,
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
                                        color: ColorsManger.purpleColor,
                                      )),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/svgs/flag.svg'),
                                      Text(
                                        '2',
                                        style:
                                            AppStyles.font12WhiteColorRegular,
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
                );
              },
            ),
          ),
          verticalSpacing(20),
          Container(
            width: 102,
            height: 31,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: ColorsManger.darkGray
            ),
            child: Center(
              child: Text(
                'Completed',
                style: AppStyles.font16WhiteRegular,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: Container(
                    width: double.infinity,
                    height: 80.h,
                    color: ColorsManger.darkGray,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: ColorsManger.purpleColor,
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
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
