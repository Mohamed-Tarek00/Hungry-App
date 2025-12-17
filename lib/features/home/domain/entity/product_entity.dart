class ProductEntity {
  final int id;
  final String name;
  final String description;
  final String image;
  final double rating;
  final double price;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
  });
}
