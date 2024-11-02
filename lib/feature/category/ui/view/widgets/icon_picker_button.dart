import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import 'category_icon_picker.dart';

class IconPickerButton extends StatefulWidget {
  const IconPickerButton({super.key});

  @override
  State<IconPickerButton> createState() => _IconPickerButtonState();
}

class _IconPickerButtonState extends State<IconPickerButton> {
  IconData? categoryIcon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return Center(
                child: CategoryIconPicker(
                  selectedIcon: (icon) {
                    setState(() {
                      categoryIcon = icon;
                    });
                  },
                ),
              );
            });
      },
      child: Container(
        width: categoryIcon == null ? 154.w : 48,
        height: categoryIcon == null ? 42.h : 48.h,
        decoration: BoxDecoration(
          color: ColorsManger.darkGray,
          borderRadius: BorderRadius.circular(4),
        ),
        child: categoryIcon == null
            ? Center(
                child: Text('Choose icon from library',
                    style: AppStyles.font12WhiteColorRegular),
              )
            : Icon(
                categoryIcon!,
                color: ColorsManger.whiteColor,
              ),
      ),
    );
  }
}
