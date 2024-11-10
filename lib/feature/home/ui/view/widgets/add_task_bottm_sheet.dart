//packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uptodo/feature/home/data/model/task_model.dart';
import 'package:uptodo/feature/home/ui/cubit/task/task_cubit.dart';
import 'package:uptodo/feature/home/ui/view/widgets/task_bottom_sheet_priority_button.dart';
import 'package:uptodo/feature/home/ui/view/widgets/task_bottom_sheet_send_button_.dart';
//core
import '../../../../../core/theming/app_styles.dart';
import 'package:uptodo/core/helper/spacing.dart';

//widgets
import '../../../../../core/theming/colors_manger.dart';
import 'add_task_bloc_listener.dart';
import 'add_task_form.dart';
import 'task_bottom_sheet_category_button.dart';
import 'task_bottom_sheet_show_time_picker.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  int? taskPriority;
  Map<String, dynamic>? taskCategory;
  DateTime dateOfTask = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      height: 320.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Task',
            style: AppStyles.font20WhiteColorBold,
          ),
          verticalSpacing(14),
          const AddTaskForm(),
          verticalSpacing(20),
          Expanded(
            child: Row(
              children: [
                TaskBottomSheetShowTimePicker(
                 
                  showTimePicker: (date, time) {
                    setState(() {
                      dateOfTask = date;
                      startTime = time;
                    });
                  },
                ),
                TaskBottomSheetCategoryButton(
                  selectCategory: (category) {
                    setState(() {
                      taskCategory = category;
                    });
                  },
                ),
                TaskBottomSheetPriorityButton(
                  taskPriority: (priority) {
                    setState(() {
                      taskPriority = priority;
                    });
                  },
                ),
                const Spacer(),
                TaskBottomSheetSendButton(
                  onPressed: () {
                    String? formattedStartTime =
                        startTime.toString() != '00:00:00.000'
                            ? TaskModel.startTimeOfDayToString(startTime)
                            : null;
                    TaskModel taskModel = TaskModel(
                      uid: DateTime.now().toString(),
                      title: context.read<TaskCubit>().titleController.text,
                      description:
                          context.read<TaskCubit>().descriptionController.text,
                      isDone: false,
                      taskPriority: taskPriority ?? 1,
                      category: taskCategory ??
                          {
                            'title': 'Personal',
                            'color': ColorsManger.primaryColor.value.toString(),
                            'icon': '0xeb93'
                          },
                      date: dateOfTask,
                      startTime: formattedStartTime!,
                    );
                    addTask(taskModel);
                  },
                ),
                const AddTaskBlocListener()
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addTask(TaskModel taskModel) {
    if (context.read<TaskCubit>().formKey.currentState!.validate()) {
      context.read<TaskCubit>().addTask(taskModel);
    }
  }
}
