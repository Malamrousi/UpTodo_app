import 'package:dartz/dartz.dart';

import '../../../../core/failures/firestore_failure.dart';
import '../../../home/data/model/task_model.dart';

abstract class CalenderRepo {
  Future<Either<FireStoreFailure, List<TaskModel>>> getTaskByDate(
      {required DateTime date});
}
