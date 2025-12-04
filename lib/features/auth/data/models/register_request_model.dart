import 'package:hungryapp/features/auth/domain/entity/register_request_entity.dart';

class RegisterRequestModel {
  final RegisterRequestEntity entity;

  RegisterRequestModel({required this.entity});

  Map<String, dynamic> toJson() {
    return {
      'name': entity.name,
      'email': entity.email,
      'phone': entity.phone,
      'password': entity.password,
    };
  }
}
