import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/model/task_model.dart';
import '../../../data/repo/task_repo_impl.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit(this.taskRepoImpl) : super(UpdateTaskInitial());
  final TaskRepoImpl taskRepoImpl;

  void updateTask(TaskModel task) async {
    emit(UpdateTaskLoading());
    final updateTaskEither = await taskRepoImpl.updateTask(task);
    updateTaskEither.fold(
        (failure) =>
            emit(UpdateTaskFailure(errorMessage: failure.errorMessage)),
        (task) => emit(UpdateTaskSuccess(taskModel: task)));
  }
}
