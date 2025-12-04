import 'package:hungryapp/core/utils/api_service.dart';
import 'package:hungryapp/features/auth/data/models/login_request_model.dart';
import 'package:hungryapp/features/auth/data/models/register_request_model.dart';
import 'package:hungryapp/features/auth/data/models/user.dart';

abstract class AuthDataSource {
  Future<User> registerRequest({required RegisterRequestModel model});
  Future<User> loginRequest({required LoginRequestModel model});
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiService _apiService;

  AuthDataSourceImpl(this._apiService);

  @override
  Future<User> loginRequest({required LoginRequestModel model}) async {
    final data = model.toJson();
    final response = await _apiService.post(endPoint: '/login', data: data);
    return User.fromJson(response);
  }

  @override
  Future<User> registerRequest({required RegisterRequestModel model}) async {
    final data = model.toJson();
    final response = await _apiService.post(endPoint: '/register', data: data);
    return User.fromJson(response);
  }
}
