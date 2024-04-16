import 'package:dio/dio.dart';
import '../models/user.dart';

class UserClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://reqres.in/api/',
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 10),
  ));

  Future<User?> fetchUserInfo(String userId) async {
    Response response = await _dio.get("users/$userId");

    if (response.statusCode == 200) {
      User user = User.fromJson(response.data);
      return user;
    }
    return null;
  }
}
