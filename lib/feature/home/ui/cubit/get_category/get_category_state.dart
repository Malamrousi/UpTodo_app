part of 'get_category_cubit.dart';

sealed class GetCategoryState {}

final class GetCategoryInitial extends GetCategoryState {} 
final class GetCategoryLoading extends GetCategoryState {} 

final class GetCategorySuccess extends GetCategoryState {
  final List<CategoryModel> category;

  GetCategorySuccess({required this.category});
} 
final class GetCategoryFailure extends GetCategoryState {
  final String errorMessage;

  GetCategoryFailure({required this.errorMessage});
} 