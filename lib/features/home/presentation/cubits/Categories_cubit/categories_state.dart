part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesFailuer extends CategoriesState {
  final String errMessage;

  CategoriesFailuer({required this.errMessage});
}

final class CategoriesSuccess extends CategoriesState {
  final List<CategoryEntity> response;

  CategoriesSuccess({required this.response});
}
