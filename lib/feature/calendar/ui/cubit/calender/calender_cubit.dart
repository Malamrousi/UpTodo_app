import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/feature/calendar/data/repo/calender_repo_impl.dart';

import '../../../../home/data/model/task_model.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit(this.calenderRepoImpl) : super(CalenderInitial());
  final CalenderRepoImpl calenderRepoImpl;

  List<TaskModel> taskListDataByDate = [];
  DateTime? currentDate;

  Future<void> getTaskByDate({required DateTime date}) async {
    emit(CalenderLoading());

    currentDate = date;
    final result = await calenderRepoImpl.getTaskByDate(date: date);
    result.fold(
        (failure) => emit(CalenderFailure(errorMessage: failure.toString())),
        (task) {
      taskListDataByDate = task;

      emit(CalenderSuccess(taskModel: taskListDataByDate));
    });
  }

  Future<void> reFetchTask()async{
  if(currentDate!=null){
    getTaskByDate(date: currentDate!);
  }
  }
}
