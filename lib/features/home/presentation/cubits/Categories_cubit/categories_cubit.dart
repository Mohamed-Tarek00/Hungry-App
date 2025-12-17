import 'package:bloc/bloc.dart';
import 'package:hungryapp/features/home/domain/entity/category_entity.dart';
import 'package:hungryapp/features/home/domain/usecase/categories_usecase.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesUsecase categoriesUsecase;
  CategoriesCubit(this.categoriesUsecase) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await categoriesUsecase.call();
    result.fold(
      (failuer) => emit(CategoriesFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(CategoriesSuccess(response: response)),
    );
  }
}
