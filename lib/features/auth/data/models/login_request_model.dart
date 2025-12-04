import 'package:hungryapp/features/auth/domain/entity/login_request_entity.dart';

class LoginRequestModel {
  final LoginRequestEntity entity;

  LoginRequestModel({required this.entity});

  Map<String, dynamic> toJson() {
    return {'email': entity.email, 'password': entity.password};
  }
}
