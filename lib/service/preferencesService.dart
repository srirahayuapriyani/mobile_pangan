import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static SharedPreferences? _preferences;

  static const _keyIsLoggedIn = 'isLoggedIn';
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool get isLoggedIn => _preferences?.getBool(_keyIsLoggedIn) ?? false;

  Future<void> setLoggedIn(bool value) async {
    await _preferences?.setBool(_keyIsLoggedIn, value);
  }

  String getUsername() => _preferences?.getString(_keyUsername) ?? '';

  Future<void> setUsername(String value) async {
    await _preferences?.setString(_keyUsername, value);
  }

  String getPassword() => _preferences?.getString(_keyPassword) ?? '';

  Future<void> setPassword(String value) async {
    await _preferences?.setString(_keyPassword, value);
  }
}
