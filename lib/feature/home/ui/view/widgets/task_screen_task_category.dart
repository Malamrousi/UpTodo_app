import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/theming/colors_manger.dart';
import '../../cubit/get_category/get_category_cubit.dart';
import 'task_bottom_sheet_show_category_dialog.dart';

class TaskScreenTaskCategory extends StatefulWidget {
  const TaskScreenTaskCategory({super.key});

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
              child: BlocProvider.value(
                value: RepositoryProvider.of<GetCategoryCubit>(context),
                child: TaskBottomSheetShowCategoryDialog(
                  categorySelected: 
                (data){}
                ),
              ),
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
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset( ImageAssets.svgsUniversity),
                  horizontalSpacing(4),
                  Text(
                    ' University',
                    style: AppStyles.font12WhiteColorRegular,
                  ),
                ],
              )
            ),
          ),
        ),
      ],
    );
  }
}
