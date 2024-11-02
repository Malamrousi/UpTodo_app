import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uptodo/feature/category/data/category_all_color_list.dart';

import '../../../../../core/theming/colors_manger.dart';

class CustomCategoryIconColorPicker extends StatefulWidget {
  const CustomCategoryIconColorPicker(
      {super.key, required this.onColorSelected});

  final void Function(Color) onColorSelected;

  @override
  State<CustomCategoryIconColorPicker> createState() =>
      _CustomCategoryIconColorPickerState();
}

class _CustomCategoryIconColorPickerState
    extends State<CustomCategoryIconColorPicker> {
  int selectedColorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      height: 40.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: CategoryAllColorList.categoryColor.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = index;
                  widget.onColorSelected(CategoryAllColorList.categoryColor[index]);
                });
              },
              child: Container(
                width: 36.w,
                height: 36.h,
                margin: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 1.3,
                    color: selectedColorIndex == index
                        ? ColorsManger.whiteColor
                        : Colors.transparent,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: CategoryAllColorList.categoryColor[index],
                ),
              ),
            );
          }
          ),
    );
  }
}
