import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:app/models/user_data.dart';

part 'api_service.g.dart'; // ✅ Kết nối với file sinh tự động

@RestApi(baseUrl: "https://your-api-url.com")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST("/send-user-data")
  Future<void> sendUserData(@Body() UserData userData);
}
