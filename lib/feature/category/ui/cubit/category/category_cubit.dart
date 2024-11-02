import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../data/model/category_model.dart';
import '../../../data/repo/category_repo_impl.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryRepoImpl) : super(CategoryInitial());
  final CategoryRepoImpl categoryRepoImpl;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController categoryNameController = TextEditingController();

  Future<void> addCategory(CategoryModel categoryModel) async {
    emit(CategoryLoading());

    final addCategory = await categoryRepoImpl.addCategory(categoryModel);
    addCategory.fold((failure) {
      emit(CategoryFailure(errorMessage: failure.errorMessage));
    }, (category) {
      emit(CategorySuccess(categoryModel: category));
    });
  }

 
}