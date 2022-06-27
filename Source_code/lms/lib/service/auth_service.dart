import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Auth {
  static Future<Response> login(String email, String password) async {
    final dio = Dio();
    Response response = await dio.post(
        'https://api-lms-42.herokuapp.com/v1/auth/login',
        data: jsonEncode({'email': email, 'password': password}));

    return response.data;
  }

  static Future<Response> getUser(String token) async {
    final dio = Dio();
    Response response =
        await dio.get('https://api-lms-42.herokuapp.com/v1/users/');
    return response.data;
  }
}
