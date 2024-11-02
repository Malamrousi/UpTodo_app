//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/core/routing/routes.dart';
//widgets
import 'package:uptodo/feature/home/ui/view/widgets/custom_category_item_index.dart';
//core
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';

class TaskBottomSheetShowCategoryDialog extends StatefulWidget {
  const TaskBottomSheetShowCategoryDialog({super.key});

  @override
  State<TaskBottomSheetShowCategoryDialog> createState() =>
      _TaskBottomSheetShowCategoryDialogState();
}

class _TaskBottomSheetShowCategoryDialogState
    extends State<TaskBottomSheetShowCategoryDialog> {
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
                      itemCount: CustomCategoryItemIndex.items.length,
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
                              color: CustomCategoryItemIndex.items[index].color,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                CustomCategoryItemIndex.items[index].image,
                              ),
                            ),
                          ),
                          verticalSpacing(10),
                          Text(
                            CustomCategoryItemIndex.items[index].title,
                            style: AppStyles.font14WhiteColorRegular,
                          )
                        ]);
                      }),
                ),
                verticalSpacing(10),
                AppTextButton(
                  onPressed: () {
               context.pushNamed(Routes.categoryScreen);
                  },
                  buttonText: 'Add Category',
                  backgroundColor: ColorsManger.primaryColor,
                  textStyle: AppStyles.font16WhiteRegular,
                  bottomWidth: MediaQuery.sizeOf(context).width * 0.7.w,
                  bottomHeight: 48.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
