import 'package:flutter/widgets.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDetailViewModel with ChangeNotifier {
  List<UserDetailModel> _userData = [];
  List<UserDetailModel> get userData => _userData;

  getUserData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = ApiService();
    final f =
        await a.getUserById(sharedPref.get('token'), sharedPref.get('userid'));
    _userData = [f];
    notifyListeners();
  }
}
