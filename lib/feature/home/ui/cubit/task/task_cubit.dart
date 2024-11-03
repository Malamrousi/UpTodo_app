import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/feature/home/data/repo/task_repo_impl.dart';

import '../../../../category/data/model/category_model.dart';
import '../../../data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepoImpl) : super(TaskInitial());

  final TaskRepoImpl taskRepoImpl;

  List<TaskModel> taskList = [];
  List<CategoryModel> categoryList = [];

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

  Future<void> getTask(TaskModel taskModel) async {
    emit(TaskLoading());

    final getTaskEither = await taskRepoImpl.getTask(taskModel.uid!, taskModel);
    getTaskEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      taskList = task;
      emit(TaskSuccess(tasks: taskList));
    });
  }

  Future<void> updateTask(TaskModel taskModel) async {
    emit(TaskLoading());  

    final updateTaskEither = await taskRepoImpl.updateTask(taskModel);
    updateTaskEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (task) {
      int index=taskList.indexWhere( (element) => element.uid==taskModel.uid);

      if(index!=-1){
        taskList[index]=task;
        emit(TaskSuccess(tasks: taskList));
      }
    }
    );
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
      int index=taskList.indexWhere( (element) => element.uid==taskModel.uid);

      if(index!=-1){
        taskList[index]=task;
        emit(TaskSuccess(tasks: taskList));
      }
    }
    );
  }

  Future<void> getCategory(CategoryModel categoryModel) async {
    emit(TaskLoading());
    final getCategoryEither = await taskRepoImpl.getCategory(categoryModel);
    getCategoryEither.fold(
        (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
        (category) {
      categoryList = category;
      emit(CategorySuccess(category: categoryList));
    }
    );
  }
}
