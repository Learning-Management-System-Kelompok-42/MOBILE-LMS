import 'package:dio/dio.dart';

class Auth {
  static Future<Response> login(String email, String password) async {
    String baseUrl = 'https://api-lms-42.herokuapp.com/';
    final dio = Dio();
    Response response = await dio.post('${baseUrl}/v1/user/login',
        data: {'email': email, 'password': password});
    var token = response.data['data']['token'];
    var userID = response.data['data']['user_id'];
    var allData = token + userID;
    return allData;
  }

  static Future<Response> getUser(String token) async {
    final dio = Dio();
    Response response =
        await dio.get('https://api-lms-42.herokuapp.com/v1/users/');
    return response.data;
  }
}
