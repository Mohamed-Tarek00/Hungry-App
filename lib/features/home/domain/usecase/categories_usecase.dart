import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/home/domain/entity/category_entity.dart';
import 'package:hungryapp/features/home/domain/repo/home_repo.dart';

class CategoriesUsecase {
  final HomeRepo homeRepo;

  CategoriesUsecase(this.homeRepo);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return homeRepo.getCategories();
  }
}
