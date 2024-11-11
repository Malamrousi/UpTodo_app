import 'package:dartz/dartz.dart';
import 'package:uptodo/core/failures/firestore_failure.dart';

import '../../home/data/model/task_model.dart';

abstract class UpdateTaskRepo {

  Future<Either<FireStoreFailure, TaskModel>> deleteTask(TaskModel taskModel);


    Future<Either<FireStoreFailure, TaskModel>> updateTask(TaskModel taskModel);  
}