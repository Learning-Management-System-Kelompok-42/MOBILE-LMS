import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:lms/model/user_model.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<dynamic> login(String email, String password) async {
    final dio = Dio();
    Response response = await dio.post('http://54.254.240.107:4001/v1/login',
        data: {'email': email, 'password': password});
    return response.data;
  }

  Future<dynamic> getUser(var token, var compID, var userid) async {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["vary"] = "Origin";
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio
        .get('http://54.254.240.107:4001/v1/company/$compID/employee/EMP-002');
    print(response.data);
    return UserModel.fromJson(response.data);
  }
}
