import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uptodo/core/constant/app_constant.dart';

import 'package:uptodo/core/failures/firestore_failure.dart';

import 'package:uptodo/feature/category/data/model/category_model.dart';

import 'get_category_repo.dart';

class GetCategoryRepoImpl implements GetCategoryRepo {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final User firebaseUser = FirebaseAuth.instance.currentUser!;

 

  @override
  Stream<Either<FireStoreFailure, List<CategoryModel>>> getCategoryStream() {
    return db
        .collection(AppConstant.userCollection)
        .doc(firebaseUser.uid)
        .collection(AppConstant.categoryCollection)
        .snapshots()
        .map((data) => right(data.docs
            .map((doc) => CategoryModel.fromJson(doc.data()))
            .toList()));
  }
}
