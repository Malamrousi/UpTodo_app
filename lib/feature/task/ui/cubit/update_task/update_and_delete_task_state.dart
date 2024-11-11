part of 'update_and_delete_task_cubit.dart';

sealed class UpdateAndDeleteTaskState {}

final class UpdateAndDeleteTaskInitial extends UpdateAndDeleteTaskState {}
final class UpdateAndDeleteTaskLoading extends UpdateAndDeleteTaskState {}
final class UpdateAndDeleteTaskSuccess extends UpdateAndDeleteTaskState {
  final TaskModel taskModel;
  UpdateAndDeleteTaskSuccess({required this.taskModel});
}
final class UpdateAndDeleteTaskFailure extends UpdateAndDeleteTaskState {
  final String errorMessage;
  UpdateAndDeleteTaskFailure({required this.errorMessage});
}
