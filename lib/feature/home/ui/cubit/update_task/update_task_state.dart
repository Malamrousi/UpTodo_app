part of 'update_task_cubit.dart';

@immutable
sealed class UpdateTaskState {}

final class UpdateTaskInitial extends UpdateTaskState {}
final class UpdateTaskLoading extends UpdateTaskState {}
final class UpdateTaskSuccess extends UpdateTaskState {
  final TaskModel taskModel;
  UpdateTaskSuccess({required this.taskModel});
}
final class UpdateTaskFailure extends UpdateTaskState {
  final String errorMessage;
  UpdateTaskFailure({required this.errorMessage});
}
