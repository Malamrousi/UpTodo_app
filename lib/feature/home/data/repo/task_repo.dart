import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/core/failures/firestore_failure.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';

import '../model/task_model.dart';

abstract class TaskRepo {
  Future<Either<FireStoreFailure, TaskModel>> getTask(
      String taskId, TaskModel taskModel);

  Future<Either<FireStoreFailure, TaskModel>> addTask(TaskModel taskModel);

  Future<Either<FireStoreFailure, TaskModel>> updateTask(TaskModel taskModel);

  Future<Either<FireStoreFailure, TaskModel>> deleteTask(TaskModel taskModel);

  Future<Either<FireStoreFailure, dynamic>> updateTaskDone(
    TimeOfDay endTime, bool isDone, TaskModel taskModel);

  Future<Either<FireStoreFailure, CategoryModel>> getCategory(
      CategoryModel categoryModel);
}
