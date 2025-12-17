part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> response;

  ProductsSuccess({required this.response});
}

final class ProductsFailuer extends ProductsState {
  final String errMessage;

  ProductsFailuer({required this.errMessage});
}
