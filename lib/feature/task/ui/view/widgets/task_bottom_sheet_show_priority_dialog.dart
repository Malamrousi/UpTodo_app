import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';
import 'package:uptodo/core/helper/extension.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../../core/widget/app_text_button.dart';

class TaskBottomSheetShowPriorityDialog extends StatefulWidget {
  const TaskBottomSheetShowPriorityDialog(
      {super.key, required this.taskPriority});
  final void Function(int ) taskPriority;

  @override
  State<TaskBottomSheetShowPriorityDialog> createState() =>
      _TaskBottomSheetShowPriorityDialogState();
}

class _TaskBottomSheetShowPriorityDialogState
    extends State<TaskBottomSheetShowPriorityDialog> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.57.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          color: ColorsManger.darkGray,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Text(
                  'Task Priority',
                  style: AppStyles.font20WhiteColorBold,
                ),
                verticalSpacing(10),
                Divider(color: ColorsManger.grayColor, thickness: .6.w),
                verticalSpacing(10),
                Expanded(
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                  child: Container(
                                    width: 64.w,
                                    height: 64.h,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? ColorsManger.primaryColor
                                          : ColorsManger.darkerGrayColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(ImageAssets.svgsFlag),
                                        Text(
                                          '${index + 1}',
                                          style: AppStyles.font16WhiteRegular,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        );
                      }),
                ),
                verticalSpacing(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      AppTextButton(
                        textStyle: AppStyles.font16WPrimaryColorRegular,
                        borderColor: Colors.transparent,
                        bottomWidth: MediaQuery.sizeOf(context).width * .33,
                        bottomHeight: 48,
                        onPressed: () {
                          context.pop();
                        },
                        buttonText: 'Cancel',
                      ),
                      horizontalSpacing(20),
                      AppTextButton(
                        textStyle: AppStyles.font16WhiteRegular,
                        bottomWidth: MediaQuery.sizeOf(context).width * .33,
                        bottomHeight: 48,
                        onPressed: () {
                          widget.taskPriority(currentIndex);
                          context.pop();
                        },
                        buttonText: 'Save',
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
    );
  }
}
