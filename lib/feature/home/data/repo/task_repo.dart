import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/failures/firestore_failure.dart';

import '../model/task_model.dart';

abstract class TaskRepo {
  Future<Either<FireStoreFailure, TaskModel>> addTask(TaskModel taskModel);

  Future<Either<FireStoreFailure, TaskModel>> deleteTask(TaskModel taskModel);
  Future<Either<FireStoreFailure, List<TaskModel>>> getTaskNotCompleted();
  Future<Either<FireStoreFailure, List<TaskModel>>> getTaskCompleted();

  Future<Either<FireStoreFailure, dynamic>> updateTaskDone(
      {required TimeOfDay endTime,
      required bool isDone,
      required TaskModel taskModel});

    Future<Either<FireStoreFailure, TaskModel>> updateTask(TaskModel taskModel);  
}
