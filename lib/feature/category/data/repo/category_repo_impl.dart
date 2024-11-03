import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptodo/core/failures/firestore_failure.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';
import 'package:uptodo/feature/category/data/repo/category_repo.dart';

import '../../../../core/constant/app_constant.dart';

class CategoryRepoImpl implements CategoryRepo {


  static final db = FirebaseFirestore.instance;
  static final User firebaseUser = FirebaseAuth.instance.currentUser!;

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
  Future<Either<FireStoreFailure, CategoryModel>> addCategory(
      CategoryModel categoryModel) async {
    try {
      await categoriesCollection().doc().set(categoryModel);
      return right(categoryModel);
    } on FirebaseException catch (error) {
      return left(FirestoreExceptionHandler.handleException(error: error));
    } catch (e) {
      return left(UnknownFailure());
    }
  }


}
