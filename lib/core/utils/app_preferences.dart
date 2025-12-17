import 'package:hungryapp/features/auth/domain/entity/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  Future<void> saveToken({required String token}) async {
    await _preferences.setString('token', token);
  }

  Future<void> saveUserData({required UserEntity user}) async {
    await _preferences.setString('token', user.token);
    await _preferences.setString('name', user.name);
    await _preferences.setString('email', user.email);
    await _preferences.setString('image', user.image!);
  }

  Future<UserEntity?> getUserData() async {
    final token = _preferences.getString('token');
    final name = _preferences.getString('name');
    final email = _preferences.getString('email');
    final image = _preferences.getString('image');

    if (token != null && name != null && email != null) {
      return UserEntity(token: token, name: name, email: email, image: image);
    }
    return null;
  }

  Future<String?> getToken() async {
    return _preferences.getString('token');
  }

  Future<void> clearData() async {
    _preferences.clear();
  }
}
