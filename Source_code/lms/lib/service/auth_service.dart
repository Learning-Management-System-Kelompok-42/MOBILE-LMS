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

    Map<String, dynamic> userData = (response.data['data'])
        .map((e) => Data(
              id: e['id'],
              companyId: e['company_id'],
              role: e['role'],
              specializationId: e['specialization_id'],
              fullName: e['full_name'],
              email: e['email'],
              password: e['password'],
              phoneNumber: e['phone_number'],
              address: e['address'],
              levelAccess: e['level_access'],
              createdAt: e['created_at'],
              updatedAt: e['updated_at'],
            ))
        .toList();
    return userData;
  }
}
