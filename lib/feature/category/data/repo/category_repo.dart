import 'package:dartz/dartz.dart';
import 'package:uptodo/feature/category/data/model/category_model.dart';

import '../../../../core/failures/firestore_failure.dart';

abstract class CategoryRepo {
  Future<Either<FireStoreFailure, CategoryModel>> getCategories(
     String categoryId,);

  Future<Either<FireStoreFailure, CategoryModel>> addCategory(
      CategoryModel categoryModel);
}
