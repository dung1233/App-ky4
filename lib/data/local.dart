import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUserData(
      String gender, int age, String name, String level) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', gender);
    await prefs.setInt('age', age);
    await prefs.setString('name', name);
    await prefs.setString('level', level);
  }

  static Future<Map<String, dynamic>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "gender": prefs.getString('gender') ?? '',
      "age": prefs.getInt('age') ?? 0,
      "name": prefs.getString('name') ?? '',
      "level": prefs.getString('level') ?? '',
    };
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
