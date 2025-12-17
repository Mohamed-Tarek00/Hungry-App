import 'package:dartz/dartz.dart';
import 'package:hungryapp/core/error/failure.dart';
import 'package:hungryapp/core/utils/handle_request.dart';
import 'package:hungryapp/features/home/data/data_source/home_data_source.dart';
import 'package:hungryapp/features/home/domain/entity/category_entity.dart';
import 'package:hungryapp/features/home/domain/entity/product_entity.dart';
import 'package:hungryapp/features/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeDataSource homeDataSource;

  HomeRepoImpl(this.homeDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    String? name,
    int? categoryId,
  }) async {
    return handleRequest(
      request: () async {
        final products = await homeDataSource.getAllProducts(
          name: name,
          categoryId: categoryId,
        );
        return products.map((model) => model.toEntity()).toList();
      },
    );
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return handleRequest(
      request: () async {
        final categories = await homeDataSource.getCategories();
        return categories.map((model) => model.toEntity()).toList();
      },
    );
  }
}
