import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/core/di/dependency_injection.dart';
import 'package:uptodo/core/theming/app_styles.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../../core/theming/colors_manger.dart';
import '../../cubit/update_time/update_time_cubit.dart';
import 'task_screen_time_display_container.dart';

class TaskScreenTaskTime extends StatelessWidget {
  final TaskModel taskModel;

  const TaskScreenTaskTime({
    super.key,
    required this.taskModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<UpdateTimeCubit>(),
      child: BlocBuilder<UpdateTimeCubit, UpdateTimeState>(
        builder: (context, state) {
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
              TaskScreenTimeDisplayContainer(
                taskModel: taskModel,
                onTap: () => _showDateTimePicker(context),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _showDateTimePicker(BuildContext context) async {
    final cubit = context.read<UpdateTimeCubit>();

    final DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
      confirmText: 'Edit Date',
      cancelText: 'Cancel',
    );

    if (context.mounted) {
      final TimeOfDay? pickTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        confirmText: 'Edit Time',
        cancelText: 'Cancel',
      );
      cubit.updateTime(pickDate, pickTime, taskModel);
    }
  }
}
