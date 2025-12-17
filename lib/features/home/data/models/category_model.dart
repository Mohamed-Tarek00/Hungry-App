import 'package:hungryapp/features/home/domain/entity/category_entity.dart';

class CategoryModel {
  final CategoryEntity category;

  const CategoryModel({required this.category});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category: CategoryEntity(
        id: json['id'] as int,
        name: json['name'] as String,
      ),
    );
  }

  CategoryEntity toEntity() => category;
}
