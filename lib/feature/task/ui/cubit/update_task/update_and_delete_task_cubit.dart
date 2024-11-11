import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/feature/task/data/update_task_repo_impl.dart';

import '../../../../home/data/model/task_model.dart';

part 'update_and_delete_task_state.dart';

class UpdateAndDeleteTaskCubit extends Cubit<UpdateAndDeleteTaskState> {
  UpdateAndDeleteTaskCubit(this.updateTaskRepoImpl) : super(UpdateAndDeleteTaskInitial());
  final UpdateTaskRepoImpl updateTaskRepoImpl;

  void updateTask(TaskModel task) async {
    emit(UpdateAndDeleteTaskLoading());
    final updateTaskEither = await updateTaskRepoImpl.updateTask(task);
    updateTaskEither.fold(
        (failure) =>
            emit(UpdateAndDeleteTaskFailure(errorMessage: failure.errorMessage)),
        (task) => emit(UpdateAndDeleteTaskSuccess(taskModel: task)));
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    emit(UpdateAndDeleteTaskLoading());

    final deleteTaskEither = await updateTaskRepoImpl.deleteTask(taskModel);
    deleteTaskEither.fold(
        (failure) =>
            emit(UpdateAndDeleteTaskFailure(errorMessage: failure.errorMessage)),
        (task) => emit(UpdateAndDeleteTaskSuccess(taskModel: task)));
  }
}
