import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lms/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  static Future<dynamic> login(String email, String password) async {
    final dio = Dio();
    Response response = await dio.post('http://54.254.240.107:4001/v1/login',
        data: {'email': email, 'password': password});

    return response.data;
  }

  Future<dynamic> getUser(var token, var userid) async {
    final dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response =
        await dio.get('http://54.254.240.107:4001/v1/users/$userid');
    return UserModel.fromJson(response.data);
  }
}
