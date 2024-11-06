import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/failures/firestore_failure.dart';
import '../model/task_model.dart';
import 'task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  static final db = FirebaseFirestore.instance;
  static final User firebaseUser = FirebaseAuth.instance.currentUser!;

 //tasksCollection
  static CollectionReference<TaskModel> tasksCollection() {
    return db
        .collection(AppConstant.userCollection)
        .doc(firebaseUser.uid)
        .collection(AppConstant.taskCollection)
        .withConverter(
          fromFirestore: (snapShot, _) => TaskModel.fromJson(snapShot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

//add task
  @override
  Future<Either<FireStoreFailure, TaskModel>> addTask(
      TaskModel taskModel) async {
    try {
      final String taskId = taskModel.uid;
      await tasksCollection().doc(taskId).set(taskModel);
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
//delete task
  @override
  Future<Either<FireStoreFailure, TaskModel>> deleteTask(
      TaskModel taskModel) async {
    try {
      await tasksCollection().doc(taskModel.uid).delete();
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }


//update task done and time
  @override
  Future<Either<FireStoreFailure, dynamic>> updateTaskDone(
      {required TimeOfDay endTime,required bool isDone,required TaskModel taskModel}) async {
    try {
      taskModel.isDone = isDone;

      if (isDone) {
        final formattedTime = TaskModel.endTimeOfDayToString(endTime);
        taskModel.endTime = formattedTime;

        await tasksCollection().doc(taskModel.uid).update({
          'isDone': isDone,
          'endTime': formattedTime,
        });
      } else {
        taskModel.endTime = null;
        await tasksCollection().doc(taskModel.uid).update({
          'isDone': isDone,
          'endTime': null,
        });
      }

      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
//fetch not completed tasks

  @override
  Future<Either<FireStoreFailure, List<TaskModel>>>
      getTaskNotCompleted() async {
    try {
      final snapShot = await tasksCollection()
          .where('isDone', isEqualTo: false)
          .get();
      final List<TaskModel> data =
          snapShot.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
      return right(data);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
 //fetch completed tasks
  @override
  Future<Either<FireStoreFailure, List<TaskModel>>> getTaskCompleted() async {
    try {
      final snapShot = await db
          .collection(AppConstant.userCollection)
          .doc(firebaseUser.uid)
          .collection(AppConstant.taskCollection)
          .where('isDone', isEqualTo: true)
          .get();

      final List<TaskModel> data =
          snapShot.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
      return right(data);
    } on FirebaseException catch (error) {
      return left(FireStoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
