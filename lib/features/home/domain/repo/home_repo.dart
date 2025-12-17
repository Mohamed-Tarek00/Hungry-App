import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/features/home/domain/entity/category_entity.dart';
import 'package:hungryapp/features/home/domain/entity/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    String? name,
    int? categoryId,
  });
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
