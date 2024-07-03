import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final PreferencesService _instance = PreferencesService._internal();
  SharedPreferences? _preferences;

  factory PreferencesService() {
    return _instance;
  }

  PreferencesService._internal();

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setLoggedIn(bool value) async {
    await _preferences?.setBool('isLoggedIn', value);
  }

  bool get isLoggedIn {
    return _preferences?.getBool('isLoggedIn') ?? false;
  }
}
