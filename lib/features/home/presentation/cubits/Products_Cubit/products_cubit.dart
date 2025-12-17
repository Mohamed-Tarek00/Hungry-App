import 'package:bloc/bloc.dart';
import 'package:hungryapp/features/home/domain/entity/product_entity.dart';
import 'package:hungryapp/features/home/domain/usecase/products_usecase.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  final ProductsUsecase homeUsecase;
  ProductCubit(this.homeUsecase) : super(ProductsInitial());

  Future<void> getProducts({String? name, int? categoryId}) async {
    emit(ProductsLoading());

    final result = await homeUsecase.call(name: name, categoryId: categoryId);
    result.fold(
      (failuer) => emit(ProductsFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(ProductsSuccess(response: response)),
    );
  }
}
