import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../../../home/presentation/view/widgets/task_bottom_sheet_show_category_dialog.dart';

class TaskScreenTaskCategory extends StatefulWidget {
  const TaskScreenTaskCategory({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskScreenTaskCategory> createState() => _TaskScreenTaskCategoryState();
}

class _TaskScreenTaskCategoryState extends State<TaskScreenTaskCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.label_outlined,
          color: ColorsManger.whiteColor,
          size: 24,
        ),
        Text(
          ' Task Category :',
          style: AppStyles.font16WhiteRegular,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: TaskBottomSheetShowCategoryDialog(
                        categorySelected: (data) {
                      setState(() {
                        widget.taskModel.category = data;
                      });
                    }),
                  );
                });
          },
          child: Container(
            width: 118,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorsManger.darkGray),
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                showCategoryIcon(widget.taskModel.category!['icon'],
                    color: ColorsManger.whiteColor),
                horizontalSpacing(10),
                Text(
                  widget.taskModel.category?['name'] ??'personal',
                  style: AppStyles.font12WhiteColorRegular,
                ),
              ],
            )),
          ),
        ),
      ],
    );
  }

  Widget showCategoryIcon(String icon, {Color? color}) {
    if (icon.startsWith('assets')) {
      return SvgPicture.asset(
        icon,
        width: 18,
        height: 18,
      );
    } else {
      return Icon(
          color: color ?? ColorsManger.whiteColor,
          size: 21,
          IconData(
            int.parse(icon),
            fontFamily: 'MaterialIcons',
          ));
    }
  }
}
