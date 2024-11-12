//packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//core
import 'package:uptodo/core/theming/colors_manger.dart';
//model
import '../../../data/model/bottom_navigation_bar_item_model.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, this.onItemTapped, required this.currentIndex});

  final Function(int)? onItemTapped;
  final int currentIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final List<BottomNavigationBarItemModel> items = [
    BottomNavigationBarItemModel(icon: Icons.home, label: 'Index'),
    BottomNavigationBarItemModel(
        icon: Icons.calendar_month_outlined, label: 'Calendar'),
    BottomNavigationBarItemModel(icon: Icons.access_time_sharp, label: 'Focus'),
    BottomNavigationBarItemModel(icon: Icons.person_outline, label: 'Profile'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: Center(
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          color: ColorsManger.darkGray,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              int index = items.indexOf(item);
              return GestureDetector(
                onTap: () => widget.onItemTapped!(index),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          item.icon,
                          color: widget.currentIndex == index
                              ? ColorsManger.primaryColor
                              : ColorsManger.whiteColor,
                          size: 28.sp,
                        ),
                        Text(
                          item.label,
                          style: TextStyle(
                            color: widget.currentIndex == index
                                ? ColorsManger.whiteColor
                                : ColorsManger.grayColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
