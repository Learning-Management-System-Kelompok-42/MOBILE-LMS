// import 'package:dio/dio.dart';
// import 'package:lms/model/User_model.dart';

// class ApiClient {
//   Future<Response<UserModel>> login(
//       String email, String password, Type string) async {
//     var _dio = Dio();
//     try {
//       Response response = await _dio.post(
//         'https://example.com/v1/user/login',
//         data: {'email': email, 'passowrd': password},
//       );
//       //returns the successful user data json object
//       return response.data;
//     } on DioError catch (e) {
//       //returns the error object if any
//       return e.response!.data;
//     }
//   }
// }

// void main() async {
//   var dio = Dio();
//   final response = await dio.get('https://example.com/v1/user/register');
//   print(response.data);
// }

// class LoginAPI {
//   Future<List<UserModel>> fetchUser() async{
//     try{
//       Response response = await Dio().post('https://example.com/v1/user/login');
//       if(response.statusCode == 200){
//         return (response.data as List).map((i) => UserModel.fromJson(i)).toList();
//     }
//   }
// }
// }
