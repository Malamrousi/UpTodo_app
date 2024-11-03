import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uptodo/feature/home/data/repo/task_repo_impl.dart';

import '../../../../category/data/model/category_model.dart';

part 'get_category_state.dart';

class GetCategoryCubit extends Cubit<GetCategoryState> {
  GetCategoryCubit(this.taskRepoImpl) : super(GetCategoryInitial());

  final TaskRepoImpl taskRepoImpl;

   List<CategoryModel> categoryList = [];

  Future<void> getCategory(CategoryModel categoryModel) async {
    emit(GetCategoryLoading());
    final getCategoryEither = await taskRepoImpl.getCategory(categoryModel);
    getCategoryEither.fold(
        (failure) => emit(GetCategoryFailure(errorMessage: failure.errorMessage)),
        (category) {
      categoryList = category;
      emit(GetCategorySuccess(category: categoryList));
    }
    );
  }
}
