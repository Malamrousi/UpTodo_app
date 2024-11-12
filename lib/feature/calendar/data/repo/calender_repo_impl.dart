import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:uptodo/core/failures/firestore_failure.dart';

import 'package:uptodo/feature/home/data/model/task_model.dart';

import '../../../../core/constant/app_constant.dart';
import 'calender_repo.dart';

class CalenderRepoImpl implements CalenderRepo {
  final User firebaseUser = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  @override
  Future<Either<FireStoreFailure, List<TaskModel>>> getTaskByDate(
      {required DateTime date}) async {
    try {
      final snapShot = await db
          .collection(AppConstant.userCollection)
          .doc(firebaseUser.uid)
          .collection(AppConstant.taskCollection)
          .where('date', isEqualTo: DateTime(date.year, date.month, date.day))
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
}
