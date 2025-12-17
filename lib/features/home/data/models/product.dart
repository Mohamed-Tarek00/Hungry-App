import 'package:hungryapp/features/home/domain/entity/product_entity.dart';

class Product {
  final ProductEntity entity;

  Product({required this.entity});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      entity: ProductEntity(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        image: json['image'],
        rating: double.tryParse(json['rating'].toString()) ?? 0.0,
        price: double.tryParse(json['price'].toString()) ?? 0.0,
      ),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': entity.id,
      'name': entity.name,
      'description': entity.description,
      'image': entity.image,
      'rating': entity.rating,
      'price': entity.price,
    };
  }

  ProductEntity toEntity() => entity;

  factory Product.fromEntity(ProductEntity entity) {
    return Product(entity: entity);
  }
}
