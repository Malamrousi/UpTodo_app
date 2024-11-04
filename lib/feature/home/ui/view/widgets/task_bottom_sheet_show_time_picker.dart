import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/colors_manger.dart';

class TaskBottomSheetShowTimePicker extends StatefulWidget {
  const TaskBottomSheetShowTimePicker({super.key, required this.showTimePicker});

  final void Function(DateTime date ,TimeOfDay time) showTimePicker;

  @override
  State<TaskBottomSheetShowTimePicker> createState() =>
      _TaskBottomSheetShowTimePickerState();
}

class _TaskBottomSheetShowTimePickerState
    extends State<TaskBottomSheetShowTimePicker> {
  DateTime? selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

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

    widget.showTimePicker(selectedDate!, selectedTime!);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showTimePicker(context),
      icon: const Icon(
        Icons.timer_outlined,
        color: ColorsManger.whiteColor,
        size: 26,
      ),
    );
  }
}
