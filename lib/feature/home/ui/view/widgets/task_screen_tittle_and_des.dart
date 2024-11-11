import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/core/assets/assets.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../../core/helper/spacing.dart';
import 'task_screen_show_dialog_text_and_des.dart';

class TaskScreenTittleAndDes extends StatefulWidget {
  const TaskScreenTittleAndDes({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  State<TaskScreenTittleAndDes> createState() => _TaskScreenTittleAndDesState();
}

class _TaskScreenTittleAndDesState extends State<TaskScreenTittleAndDes> {
    TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
       
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.taskModel.title!,
              style: AppStyles.font20WhiteColorRegular,
            ),
            verticalSpacing(10),
            Text(
              widget.taskModel.description!,
              style: AppStyles.font16GrayColorRegular,
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                      child: TaskScreenShowDialogTextAndDes(
                    updateTask: (title, description) {
                      setState(() {
                        widget.taskModel.title = title;
                        widget.taskModel.description = description;
                      });
                    },
                    taskModel: widget.taskModel,
                  ));
                });
          },
          icon: SvgPicture.asset(ImageAssets.svgRewrite),
        ),
      ],
    );
  }
}
