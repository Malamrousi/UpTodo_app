import 'package:dartz/dartz.dart';

import '../../../../core/failures/firestore_failure.dart';
import '../../../category/data/model/category_model.dart';

abstract class GetCategoryRepo {

  Stream<Either<FireStoreFailure, List<CategoryModel>>> getCategoryStream();
}