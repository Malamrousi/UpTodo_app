import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/feature/home/data/repo/task_repo_impl.dart';

import '../../../../category/data/model/category_model.dart';
import '../../../data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepoImpl) : super(TaskInitial());

  final TaskRepoImpl taskRepoImpl;

  List<TaskModel> taskList = [];
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addTask(TaskModel taskModel) async {
    emit(TaskLoading());

    final addTaskEither = await taskRepoImpl.addTask(taskModel);
    addTaskEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      taskList.add(task);
      emit(TaskSuccess(tasks: taskList));
    });
  }

  void getTask(String id) {
    emit(TaskLoading());
    taskRepoImpl.getTask(id).listen((event) {
      event.fold((failure) {
        emit(TaskFailure(errorMessage: failure.errorMessage));
      }, (task) {
        task = taskList;
        emit(TaskSuccess(tasks: task));
      });
    });
  }

  Future<void> updateTask(TaskModel taskModel) async {
    emit(TaskLoading());

    final updateTaskEither = await taskRepoImpl.updateTask(taskModel);
    updateTaskEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      int index =
          taskList.indexWhere((element) => element.uid == taskModel.uid);

      if (index != -1) {
        taskList[index] = task;
        emit(TaskSuccess(tasks: taskList));
      }
    });
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    emit(TaskLoading());

    final deleteTaskEither = await taskRepoImpl.deleteTask(taskModel);
    deleteTaskEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      taskList.removeWhere((element) => element.uid == taskModel.uid);
      emit(TaskSuccess(tasks: taskList));
    });
  }

  Future<void> updateTaskDone(
      TimeOfDay endTime, bool isDone, TaskModel taskModel) async {
    emit(TaskLoading());

    final updateTaskDoneEither =
        await taskRepoImpl.updateTaskDone(endTime, isDone, taskModel);
    updateTaskDoneEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      int index =
          taskList.indexWhere((element) => element.uid == taskModel.uid);

      if (index != -1) {
        taskList[index] = task;
        emit(TaskSuccess(tasks: taskList));
      }
    });
  }
}
