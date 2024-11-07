import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../category/data/model/category_model.dart';
import '../../../data/repo/get_category_repo_impl.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this.getCategoryRepoImpl) : super(GetCategoryInitial());

  final GetCategoryRepoImpl getCategoryRepoImpl;

   List<CategoryModel> categoryList = [];



  void listenToCategoryStream() {
    getCategoryRepoImpl.getCategoryStream().listen((event) {
      event.fold(
          (failure) => emit(GetCategoryFailure(errorMessage: failure.errorMessage)),
          (category) {
        categoryList = category;
        emit(GetCategorySuccess(category: categoryList));
      });
    });
  }
}
