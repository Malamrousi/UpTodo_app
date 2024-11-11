part of 'update_time_cubit.dart';

@immutable
sealed class UpdateTimeState {}

final class UpdateTimeInitial extends UpdateTimeState {}

class TaskTimeUpdated extends UpdateTimeState {
  final DateTime date;
  final TimeOfDay time;

  TaskTimeUpdated({required this.date, required this.time});
}
