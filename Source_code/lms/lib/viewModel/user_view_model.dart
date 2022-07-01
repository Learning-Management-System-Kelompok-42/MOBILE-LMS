import 'package:flutter/widgets.dart';
import 'package:lms/model/user_model.dart';
import 'package:lms/service/auth_service.dart';

class UserViewModel with ChangeNotifier {
  List<UserModel> _userData = [];
  List<UserModel> get userData => _userData;

  var _token;
  var _userid;

  getUserData() async {
    var a = Auth();
    final f = await a.getUser(_token, _userid);
    _userData = f;
    notifyListeners();
  }
}
