import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveUserData({
    String? gender, //gioi tinh

    int? age, // tuoi
    int? height, //chieu cao
    int? weight, // can nang
    // ignore: non_constant_identifier_names
    String? activity_level, //muc do hoat dong
    // ignore: non_constant_identifier_names
    String? fitness_goal, // muc tieu chinh
    // ignore: non_constant_identifier_names
    String? medical_conditions, //tinh trang suc khoe
    String? level, //level chon
    // String? diet, //che don an chay hoac bth
  }) async {
    final prefs = await SharedPreferences.getInstance();

    // Lấy dữ liệu cũ nếu có
    final existingData = await loadUserData();

    // Cập nhật dữ liệu mới mà không làm mất dữ liệu cũ
    final newData = {
      "gender": gender ??
          existingData["gender"], // Giữ giá trị cũ nếu không có giá trị mới
      "age": age ?? existingData["age"],
      "height": height ?? existingData["height"],
      "weight": weight ?? existingData["weight"],
      "activity_level": activity_level ?? existingData["activity_level"],
      "fitness_goal": fitness_goal ?? existingData["fitness_goal"],
      "medical_conditions":
          medical_conditions ?? existingData["medical_conditions"],
      "level": level ?? existingData["level"],
      // "diet": diet ?? existingData["diet"],
    };

    await prefs.setString("userData", jsonEncode(newData));
  }

  static Future<Map<String, dynamic>> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("userData");

    if (data != null) {
      return jsonDecode(data);
    }
    return {}; // Trả về map rỗng nếu chưa có dữ liệu
  }
}
