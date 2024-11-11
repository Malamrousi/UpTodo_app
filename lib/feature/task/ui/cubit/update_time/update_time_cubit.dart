import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/feature/home/data/model/task_model.dart';

part 'update_time_state.dart';

class UpdateTimeCubit extends Cubit<UpdateTimeState> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  UpdateTimeCubit() : super(UpdateTimeInitial());

  void updateTime(DateTime? date, TimeOfDay? time, TaskModel taskModel) {
    if (date != null) selectedDate = date;
    if (time != null) selectedTime = time;

    String? formattedTime =
        time != null ? TaskModel.startTimeOfDayToString(time) : null;

    taskModel.date = date ?? taskModel.date;
    taskModel.startTime = formattedTime;

    emit(TaskTimeUpdated(date: selectedDate, time: selectedTime));
  }
}
