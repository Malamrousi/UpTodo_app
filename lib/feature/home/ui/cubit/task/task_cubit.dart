import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/feature/home/data/repo/task_repo_impl.dart';

import '../../../../category/data/model/category_model.dart';
import '../../../data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(this.taskRepoImpl) : super(TaskInitial());
  // task repo
  final TaskRepoImpl taskRepoImpl;
// list for not completedTasks
  List<TaskModel> completedTasksList = [];
  // list for  completedTasks

  List<TaskModel> notCompletedTasksList = [];
  // titleController
  final TextEditingController titleController = TextEditingController();
  // descriptionController
  final TextEditingController descriptionController = TextEditingController();
  // formKey
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// add Task
  Future<void> addTask(TaskModel taskModel) async {
    emit(TaskLoading());

    try {
      final addTaskEither = await taskRepoImpl.addTask(taskModel);
      addTaskEither.fold(
          (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
          (task) {
        if (task.isDone ?? false) {
          // add completed task
          completedTasksList.add(task);
        } else {
          // add not completed task
          notCompletedTasksList.add(task);
        }
        emit(TaskSuccess(
            notCompletedTasks: notCompletedTasksList,
            completedTasks: completedTasksList));
      });
    } catch (error) {
      emit(TaskFailure(errorMessage: error.toString()));
    }
  }

  Future<void> deleteTask(TaskModel taskModel) async {
    emit(TaskLoading());

    try {
      final deleteTaskEither = await taskRepoImpl.deleteTask(taskModel);
      deleteTaskEither.fold(
          (failure) => emit(TaskFailure(errorMessage: failure.errorMessage)),
          (task) {
        completedTasksList.removeWhere((task) => task.uid == taskModel.uid);
        notCompletedTasksList.removeWhere((task) => task.uid == taskModel.uid);
        emit(TaskSuccess(
            notCompletedTasks: notCompletedTasksList,
            completedTasks: completedTasksList));
      });
    } catch (error) {
      emit(TaskFailure(errorMessage: error.toString()));
    }
  }

  Future<void> updateTaskDone(
      {required TimeOfDay endTime,
      required bool isDone,
      required TaskModel taskModel}) async {
    emit(TaskLoading());
    try {
      final result = await taskRepoImpl.updateTaskDone(
          endTime: endTime, isDone: isDone, taskModel: taskModel);
      result.fold((failure) {
        emit(TaskFailure(errorMessage: failure.errorMessage));
      }, (updateTask) {
        if (isDone) {
          notCompletedTasksList
              .removeWhere((task) => task.uid == taskModel.uid);
          completedTasksList.add(updateTask);
        } else {
          completedTasksList.removeWhere((task) => task.uid == taskModel.uid);
          notCompletedTasksList.add(updateTask);
        }

        emit(TaskSuccess(
            notCompletedTasks: notCompletedTasksList,
            completedTasks: completedTasksList));
      });
    } catch (error) {
      emit(TaskFailure(errorMessage: error.toString()));
    }
  }

  Future<void> getTasksByStatus() async {
    emit(TaskLoading());
    Future.delayed(const Duration(milliseconds: 300));

    try {
      final taskResultState = await Future.wait([
        taskRepoImpl.getTaskNotCompleted(),
        taskRepoImpl.getTaskCompleted(),
      ]);
     final  notCompletedTasks=taskResultState[0];
     final  completedTasks=taskResultState[1];

      notCompletedTasks.fold(
        (failure) {
          emit(TaskFailure(errorMessage: failure.errorMessage));
        },
        (tasks) => notCompletedTasksList = tasks,
      );

      completedTasks.fold(
        (failure) {
          emit(TaskFailure(errorMessage: failure.errorMessage));
        },
        (tasks) => completedTasksList = tasks,
      );
      emit(TaskSuccess(
          notCompletedTasks: notCompletedTasksList,
          completedTasks: completedTasksList));
    } catch (error) {
      emit(TaskFailure(errorMessage: error.toString()));
    }
  }
}
