import 'package:hungryapp/core/utils/api_service.dart';
import 'package:hungryapp/features/home/data/models/category_model.dart';
import 'package:hungryapp/features/home/data/models/product.dart';

abstract class HomeDataSource {
  Future<List<Product>> getAllProducts({String? name, int? categoryId});
  Future<List<CategoryModel>> getCategories();
}

class HomeDataSourceImpl implements HomeDataSource {
  final ApiService _apiService;

  HomeDataSourceImpl(this._apiService);

  @override
  Future<List<Product>> getAllProducts({String? name, int? categoryId}) async {
    String endPoint = "/products";

    List<String> params = [];

    if (name != null && name.isNotEmpty) {
      params.add("name=$name");
    }

    if (categoryId != null) {
      params.add("category_id=$categoryId");
    }

    if (params.isNotEmpty) {
      endPoint += "?${params.join("&")}";
    }

    final data = await _apiService.get(endPoint: endPoint);
    final listOfProducts = data['data'] as List;

    List<Product> products = listOfProducts
        .map((item) => Product.fromJson(item))
        .toList();
    return products;
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final data = await _apiService.get(endPoint: '/categories');
    final listofCategories = data['data'] as List;

    List<CategoryModel> categories = listofCategories
        .map((item) => CategoryModel.fromJson(item))
        .toList();
    return categories;
  }
}
