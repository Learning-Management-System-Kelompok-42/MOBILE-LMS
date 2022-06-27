import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<dynamic> login(String email, String password) async {
    final dio = Dio();
    Response response = await dio.post(
        'https://api-lms-42.herokuapp.com/v1/auth/login',
        data: {'email': email, 'password': password});

    return response.data;
  }

  static Future<Response> getUser(String token) async {
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["bearer"] = "token ${token}";
    Response response = await dio.get(
        'https://api-lms-42.herokuapp.com/v1/users/cbac53a6-ecd4-42d4-8b15-555b3aaa9133');
    return response.data;
  }
}
