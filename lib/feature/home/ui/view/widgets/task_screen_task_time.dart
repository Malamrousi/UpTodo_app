import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/app_styles.dart';

import '../../../../../core/theming/colors_manger.dart';

class TaskScreenTaskTime extends StatefulWidget {
  const TaskScreenTaskTime({super.key});

  @override
  State<TaskScreenTaskTime> createState() => _TaskScreenTaskTimeState();
}

class _TaskScreenTaskTimeState extends State<TaskScreenTaskTime> {
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();
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
            _showTimePicker(context);
          },
          child: Container(
            width: 102,
            height: 31,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: ColorsManger.darkGray),
            child: Center(
              child: Text(
                'Today At 16:45',
                style: AppStyles.font12WhiteColorRegular,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _showTimePicker(context) async {
    final DateTime? pickDate = await showDatePicker(
      confirmText: 'OK',
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
      confirmText: 'OK',
      cancelText: 'Cancel',
    );

    if (picTime != null) {
      setState(() {
        selectedTime = picTime;
      });
    }
  }
}
