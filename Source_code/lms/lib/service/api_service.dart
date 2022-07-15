import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lms/model/course_detail_model.dart';
import 'package:lms/model/course_model.dart';
import 'package:lms/model/modul_model.dart';
import 'package:lms/model/user_detail_model.dart';

class ApiService {
  Future<dynamic> login(String email, String password) async {
    Dio dio = Dio();
    Response response = await dio.post('https://api.rubick.tech/v1/login',
        data: {'email': email, 'password': password});

    return response.data;
  }

  Future<UserDetailModel> getUserById(var token, var userid) async {
    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response =
        await dio.get('https://api.rubick.tech/v1/employee/$userid');

    return UserDetailModel.fromJson(response.data);
  }

  Future<dynamic> findInvitationLink(var link) async {
    Dio dio = Dio();
    Response response = await dio.get('https://api.rubick.tech/v1/invitation',
        queryParameters: {'link': link});
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

  Future<dynamic> permintaan(var token, var userid, var compid, var reqType,
      var title, var reason) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio
        .post('https://api.rubick.tech/v1/employee/$userid/request', data: {
      "company_id": compid,
      "request_type": reqType,
      "title": title,
      "reason": reason
    });
    return response.data;
  }

  Future<dynamic> getAllCourse(var token, var userid, var specid) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(
      'https://api.rubick.tech/v1/employee/$userid/course/$specid',
    );

    return CourseModel.fromJson(response.data);
  }

  Future<dynamic> getDetailCourse(var token, var userid, var courseid) async {
    Dio dio = Dio();

    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(
      'https://api.rubick.tech/v1/employee/$userid/course/$courseid/details',
    );
    return CourseDetailModel.fromJson(response.data);
  }

  Future<dynamic> getModulInCourse(var token, var userid, var courseid) async {
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(
      'https://api.rubick.tech/v1/employee/$userid/course/$courseid/modules',
    );
    print(response.data);
    return ModulModel.fromJson(response.data);
  }
}
