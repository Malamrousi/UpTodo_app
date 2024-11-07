part of 'add_category_cubit.dart';

@immutable
sealed class AddCategoryState {}

final class AddCategoryInitial extends AddCategoryState {}
final class AddCategoryLoading extends AddCategoryState {}
final class AddCategorySuccess extends AddCategoryState {
  final CategoryModel categoryModel;
  AddCategorySuccess({required this.categoryModel});
}
final class AddCategoryFailure extends AddCategoryState {
  final String errorMessage;
  AddCategoryFailure({required this.errorMessage});
}
