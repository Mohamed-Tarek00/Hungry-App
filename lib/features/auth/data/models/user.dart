import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';

class User {
  final UserEntity entity;

  User({required this.entity});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      entity: UserEntity(
        token: json['token'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        image: json['image'] ?? '',
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': entity.token,
      'name': entity.name,
      'email': entity.email,
      'image': entity.image,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      token: entity.token,
      name: entity.name,
      email: entity.email,
      image: entity.image,
    );
  }
}
