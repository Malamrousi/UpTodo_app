import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/category_model.dart';
import '../../../data/repo/category_repo_impl.dart';

part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  AddCategoryCubit(this.categoryRepoImpl) : super(AddCategoryInitial());
  final AddCategoryRepoImpl categoryRepoImpl;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();

  Future<void> addCategory(CategoryModel categoryModel) async {
    emit(AddCategoryLoading());

    final addCategory = await categoryRepoImpl.addCategory(categoryModel);
    addCategory.fold((failure) {
      emit(AddCategoryFailure(errorMessage: failure.errorMessage));
    }, (category) {
      emit(AddCategorySuccess(categoryModel: category));
    });
  }

 
}