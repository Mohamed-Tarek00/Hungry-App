import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _preferences;

  AppPreferences(this._preferences);

  Future<void> saveToken({required String token}) async {
    await _preferences.setString('token', token);
  }

  Future<String?> getToken() async {
    return _preferences.getString('token');
  }

  Future<void> clearData() async {
    _preferences.clear();
  }
}
