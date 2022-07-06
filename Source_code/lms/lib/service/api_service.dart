import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:lms/model/login_model.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:lms/model/user_list_model.dart';

class ApiService {
  static Future<dynamic> auth(String email, String password) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    Response response = await dio.post('https://54.254.240.107:4001/v1/login',
        data: {'email': email, 'password': password});

    return response.data;
  }

  Future<LoginModel> login(String email, String password) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    Response response = await dio.post('https://54.254.240.107:4001/v1/login',
        data: {'email': email, 'password': password});

    return LoginModel.fromJson(response.data);
  }

  Future<UserListModel> getAllUser(var token, var compid) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio
        .get('https://54.254.240.107:4001/v1/company/$compid/employee');
    print(response.data);
    return UserListModel.fromJson(response.data);
  }

  Future<UserDetailModel> getUserDetail(
      var token, var compid, var userid) async {
    Dio dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio
        .get('https://54.254.240.107:4001/v1/company/$compid/employee/EMP-002');
    print(response.data);
    return UserDetailModel.fromJson(response.data);
  }
}
