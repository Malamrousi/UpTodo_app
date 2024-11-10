import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskScreenTaskTime extends StatefulWidget {
  const TaskScreenTaskTime({super.key, required this.taskModel});

  final TaskModel taskModel;
  @override
  State<TaskScreenTaskTime> createState() => _TaskScreenTaskTimeState();
}

class _TaskScreenTaskTimeState extends State<TaskScreenTaskTime> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.timer_outlined,
          color: ColorsManger.whiteColor,
          size: 24,
        ),
        Text(
          '  Task Time :',
          style: AppStyles.font16WhiteRegular,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            String? formattedStartTime =
                selectedTime.toString() != '00:00:00.000'
                    ? TaskModel.startTimeOfDayToString(selectedTime)
                    : null;
            _showTimePicker(context, (date, time) {
              setState(() {
                widget.taskModel.date = date;
                widget.taskModel.startTime = formattedStartTime;
              });
            });
          },
          child: Container(
            width: 120,
            height: 31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorsManger.darkGray),
            child: Center(
              child: Text(
                '${widget.taskModel.date!.day}/${widget.taskModel.date!.month} At ${widget.taskModel.startTime!}',
                style: AppStyles.font12WhiteColorRegular,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showTimePicker(
      context, Function(DateTime? date, TimeOfDay? time) timePicker) async {
    final DateTime? pickDate = await showDatePicker(
      confirmText: 'Edit Date',
      cancelText: 'Cancel',
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (pickDate != null) {
      setState(() {
        selectedDate = pickDate;
      });
    }
    final TimeOfDay? picTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      confirmText: 'Edit Time',
      cancelText: 'Cancel',
    );

    if (picTime != null) {
      setState(() {
        selectedTime = picTime;
      });
    }

    timePicker(selectedDate, selectedTime);
  }
}
