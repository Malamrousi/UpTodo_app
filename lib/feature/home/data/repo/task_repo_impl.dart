import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/failures/firestore_failure.dart';
import '../model/task_model.dart';
import 'task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  static final db = FirebaseFirestore.instance;
  static final User firebaseUser = FirebaseAuth.instance.currentUser!;

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

  static CollectionReference<CategoryModel> categoriesCollection() {
    return db
        .collection(AppConstant.userCollection)
        .doc(firebaseUser.uid)
        .collection(AppConstant.categoryCollection)
        .withConverter(
            fromFirestore: (snapShot, _) =>
                CategoryModel.fromJson(snapShot.data()!),
            toFirestore: (categories, _) => categories.toJson());
  }

  @override
  Future<Either<FireStoreFailure, TaskModel>> addTask(
      TaskModel taskModel) async {
    try {
      final String taskId = taskModel.uid ?? tasksCollection().doc().id;
      await tasksCollection().doc(taskId).set(taskModel);
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<FireStoreFailure, TaskModel>> deleteTask(
      TaskModel taskModel) async {
    try {
      await tasksCollection().doc(taskModel.uid).delete();
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<FireStoreFailure, List<CategoryModel>>> getCategory(
      CategoryModel categoryModel) async {
    try {
    final data=await categoriesCollection().get();
    final categories=data.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList();
      return right(categories);
      
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<FireStoreFailure, TaskModel>> updateTask(
      TaskModel taskModel) async {
    try {
      await tasksCollection().doc(taskModel.uid).update(taskModel.toJson());
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
@override
  Future<Either<FireStoreFailure, List<TaskModel>>> getTask(
      String taskId, TaskModel taskModel) async {
    try {
      final querySnapshot =await tasksCollection().get();
      final tasks=querySnapshot.docs.map((doc) => TaskModel.fromJson(doc.data())).toList();
      return right(tasks);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }

  @override
  Future<Either<FireStoreFailure, dynamic>> updateTaskDone(
      TimeOfDay endTime, bool isDone, TaskModel taskModel) async {
    try {
      await tasksCollection().doc(taskModel.uid).update({
        'isDone': isDone,
        'endTime': endTime.toString(),
      });
      return right(taskModel);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }
}
