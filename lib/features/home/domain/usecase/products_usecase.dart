import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/home/domain/entity/product_entity.dart';
import 'package:hungryapp/features/home/domain/repo/home_repo.dart';

class ProductsUsecase {
  final HomeRepo homeRepo;

  ProductsUsecase(this.homeRepo);

  Future<Either<Failure, List<ProductEntity>>> call({
    String? name,
    int? categoryId,
  }) {
    return homeRepo.getProducts(name: name, categoryId: categoryId);
  }
}
