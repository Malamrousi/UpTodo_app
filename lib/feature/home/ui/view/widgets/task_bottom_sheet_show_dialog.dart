import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/assets/assets.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';
import '../../../data/model/category_item_model.dart';

class TaskBottomSheetShowDialog extends StatefulWidget {
  const TaskBottomSheetShowDialog({super.key});

  @override
  State<TaskBottomSheetShowDialog> createState() =>
      _TaskBottomSheetShowDialogState();
}

class _TaskBottomSheetShowDialogState extends State<TaskBottomSheetShowDialog> {
  final List<CategoryItemModel> items = [
    CategoryItemModel(
      title: 'Grocery',
      image: ImageAssets.svgsGrocery,
      color: const Color(0xffCCFF80),
    ),
    CategoryItemModel(
      title: 'Work',
      image: ImageAssets.svgsWork,
      color: const Color(0xffFF9680),
    ),
    CategoryItemModel(
      title: 'Sport',
      image: ImageAssets.svgsSport,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      title: 'Design',
      image: ImageAssets.svgsDesign,
      color: const Color(0xff80FFFF),
    ),
    CategoryItemModel(
      title: 'University',
      image: ImageAssets.svgsUniversity,
      color: const Color(0xff809CFF),
    ),
    CategoryItemModel(
      title: 'University',
      image: ImageAssets.svgsSocial,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      title: 'Music',
      image: ImageAssets.svgsMusic,
      color: const Color(0xffFF80EB),
    ),
    CategoryItemModel(
      title: 'Health',
      image: ImageAssets.svgsHealth,
      color: const Color(0xff80FFA3),
    ),
    CategoryItemModel(
      title: 'Movie',
      image: ImageAssets.svgsMovie,
      color: const Color(0xff80D1FF),
    ),
    CategoryItemModel(
      title: 'Home',
      image: ImageAssets.svgsHome,
      color: const Color(0xffFFCC80),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.75.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: ColorsManger.darkGray,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  'Choose Category',
                  style: AppStyles.font20WhiteColorBold,
                ),
                verticalSpacing(10),
                Divider(color: ColorsManger.grayColor, thickness: .6.w),
                verticalSpacing(10),
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 3,
                              crossAxisSpacing: 5),
                      itemBuilder: (context, index) {
                        return Column(children: [
                          Container(
                            width: 64.w,
                            height: 64.h,
                            decoration: BoxDecoration(
                              color: items[index].color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                items[index].image,
                              ),
                            ),
                          ),
                          verticalSpacing(10),
                          Text(
                            items[index].title,
                            style: AppStyles.font14WhiteColorRegular,
                          )
                        ]);
                      }),
                ),
                verticalSpacing(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: AppTextButton(
                    onPressed: () {},
                    buttonText: 'Add Category',
                    backgroundColor: ColorsManger.primaryColor,
                    textStyle: AppStyles.font16WhiteRegular,
                    bottomWidth: double.maxFinite,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
