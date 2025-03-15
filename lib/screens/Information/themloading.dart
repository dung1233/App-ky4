import 'package:app/api/api_service.dart';
import 'package:app/api/dio_client.dart';
import 'package:app/data/local_storage.dart';
import 'package:app/models/user_data.dart';
import 'package:app/screens/trainhome.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ThemLoadingScreen extends StatelessWidget {
  const ThemLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tự động kiểm tra và chuyển hướng khi build
    Future.delayed(Duration(seconds: 10), () async {
      final userDataMap = await LocalStorage.loadUserData();
      final userData = UserData.fromJson(userDataMap);

      if (kDebugMode) {
        print('Dữ liệu đọc được: ${userData.toJson()}');
      }

      final apiService = ApiService(DioClient.dio);
      await apiService.sendUserData(userData);

      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Trainhome(
              userData: userData.toJson(),
            ),
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/img/Animation_1740914934240.json"),
            ),
            Text('Đang chuẩn bị bài tập...'),
          ],
        ),
      ),
    );
  }
}
