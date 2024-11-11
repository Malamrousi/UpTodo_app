import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/failures/firestore_failure.dart';
import '../../home/data/model/task_model.dart';
import 'update_task_repo.dart';

class UpdateTaskRepoImpl implements UpdateTaskRepo {
  static final db = FirebaseFirestore.instance;
  static final User firebaseUser = FirebaseAuth.instance.currentUser!;

  @override
  Future<Either<FireStoreFailure, TaskModel>> updateTask(
      TaskModel taskModel) async {
    try {
      await db
          .collection(AppConstant.userCollection)
          .doc(firebaseUser.uid)
          .collection(AppConstant.taskCollection)
          .doc(taskModel.uid)
          .update(taskModel.toJson());
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<FireStoreFailure, TaskModel>> deleteTask(
      TaskModel taskModel) async {
    try {
      await db
          .collection(AppConstant.userCollection)
          .doc(firebaseUser.uid)
          .collection(AppConstant.taskCollection).doc(taskModel.uid).delete();
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
