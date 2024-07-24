import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _instance;

  static void clearAll() {
    _instance.clear();
  }

  static bool? getBool(String key) => _instance.getBool(key);
  static String? getString(String key) => _instance.getString(key);

  static Future<SharedPreferences> init() async =>
      _instance = await SharedPreferences.getInstance();

  static Future<bool> setString(String key, String value) =>
      _instance.setString(key, value);
}
