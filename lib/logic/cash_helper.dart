import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPreferences;

  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setTheme({required String key, required dynamic value}) async {
    await sharedPreferences!.setBool(key, value);
  }

  static bool? getThem({required String key}) {
    return sharedPreferences!.getBool(key);
  }

  static bool? contain({required String key}) {
    return sharedPreferences!.containsKey(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);

    return await sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeDatabykey({required String key}) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> logout() async {
    return await sharedPreferences!.remove('login');
  }

  static Future<bool> login(int id) async {
    return await sharedPreferences!.setInt('login', id);
  }

  static Future<int?> getLogin() async {
    if (sharedPreferences!.containsKey('login')) {
      return sharedPreferences!.getInt('login');
    } else {
      return -1;
    }
  }
}
