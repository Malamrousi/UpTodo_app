part of 'calender_cubit.dart';

sealed class CalenderState {}

final class CalenderInitial extends CalenderState {}

final class CalenderLoading extends CalenderState {}

final class CalenderSuccess extends CalenderState {
  final List<TaskModel> taskModel;

  CalenderSuccess({required this.taskModel});
}

final class CalenderFailure extends CalenderState {
  final String errorMessage;

  CalenderFailure({required this.errorMessage});
}
