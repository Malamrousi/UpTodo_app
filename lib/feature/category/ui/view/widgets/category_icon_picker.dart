import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/core/helper/extension.dart';
import 'package:uptodo/feature/category/data/all_icon_list.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';

class CategoryIconPicker extends StatefulWidget {
  const CategoryIconPicker({super.key, required this.selectedIcon,});

  final void Function(IconData icon) selectedIcon;


  @override
  State<CategoryIconPicker> createState() => _CategoryIconPickerState();
}

class _CategoryIconPickerState extends State<CategoryIconPicker> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
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
                  Text('Pick an icon', style: AppStyles.font20WhiteColorBold),
                  verticalSpacing(10),
                  Expanded(
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: AllIconList.allIcons.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                mainAxisSpacing: 3,
                                crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Container(
                              width: 64.w,
                              height: 64.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    currentIndex = index;
                                  }),
                                  child: Icon(
                                    AllIconList.allIcons[index],
                                    color: currentIndex == index
                                        ? ColorsManger.primaryColor
                                        : ColorsManger.whiteColor,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                            verticalSpacing(10),
                          ]);
                        }),
                  ),
                  verticalSpacing(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        AppTextButton(
                          bottomWidth: MediaQuery.sizeOf(context).width * .33,
                          bottomHeight: 48,
                          onPressed: () {
                      widget.selectedIcon(AllIconList.allIcons[currentIndex]);
                            context.pop();
                          },
                          buttonText: 'Cancel',
                        ),
                        horizontalSpacing(20),
                        AppTextButton(
                          bottomWidth: MediaQuery.sizeOf(context).width * .33,
                          bottomHeight: 48,
                          onPressed: () {
                           widget.selectedIcon(AllIconList.allIcons[currentIndex]);
                            context.pop();
                          },
                          buttonText: 'Ok',
                          backgroundColor: ColorsManger.primaryColor,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
