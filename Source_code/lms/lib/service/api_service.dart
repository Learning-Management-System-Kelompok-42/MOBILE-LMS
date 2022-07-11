import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lms/model/user_detail_model.dart';

import 'package:lms/model/user_list_model.dart';

class ApiService {
  Future<dynamic> login(String email, String password) async {
    Dio dio = Dio();
    Response response = await dio.post('https://api.rubick.tech/v1/login',
        data: {'email': email, 'password': password});

    return response.data;
  }

  // Future<UserListModel> getAllUser(var token, var compid) async {
  //   Dio dio = Dio();
  //   (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
  //       (HttpClient client) {
  //     client.badCertificateCallback =
  //         (X509Certificate cert, String host, int port) => true;
  //     return client;
  //   };
  //   dio.options.headers['Content-Type'] = 'application/json';
  //   dio.options.headers["Authorization"] = "Bearer $token";
  //   Response response = await dio
  //       .get('https://54.254.240.107:4001/v1/company/$compid/employee');
  //   print(response.data);
  //   return UserListModel.fromJson(response.data);
  // }

  Future<UserDetailModel> getUserById(var token, var userid) async {
    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response =
        await dio.get('https://api.rubick.tech/v1/employee/$userid');

    return UserDetailModel.fromJson(response.data);
  }

  Future<dynamic> findInvitationLink() async {
    Dio dio = Dio();
    Response response = await dio.get(
        'https://api.rubick.tech/v1/invitation?link=1f567412cdc64309808c9950c58167b5');
    print(response.data);
    return response.data;
  }

  Future<dynamic> registerUser(
    dynamic compid,
    dynamic specid,
    dynamic name,
    dynamic email,
    dynamic password,
    dynamic phonenum,
    dynamic address,
  ) async {
    Dio dio = Dio();
    Response response =
        await dio.post('https://api.rubick.tech/v1/user/register', data: {
      'company_id': compid,
      'specialization_id': specid,
      'full_name': name,
      'email': email,
      'password': password,
      'phone_number': phonenum,
      'address': address
    });

    return response.data;
  }

  Future<dynamic> updateProfileUser(var token, var compid, var userid, var nama,
      var email, var nohp, var alamat) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.put(
        'https://api.rubick.tech/v1/company/$compid/employee/$userid/profile',
        data: {
          "full_name": nama,
          "email": email,
          "phone_number": nohp,
          "address": alamat
        });

    return response.data;
  }

  Future<dynamic> changePasswordUser(
      var token, var compid, var userid, var oldPass, var newPass) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.put(
        'https://api.rubick.tech/v1/company/$compid/employee/$userid/password',
        data: {"old_password": oldPass, "new_password": newPass});

    return response.data;
  }
}
