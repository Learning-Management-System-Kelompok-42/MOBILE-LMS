import 'package:flutter/widgets.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:lms/service/api_service.dart';

class UserDetailViewModel with ChangeNotifier {
  List<UserDetailModel> _userData = [];
  List<UserDetailModel> get userData => _userData;

  var _token;
  var _userid;
  var _compid;

  getUserData() async {
    var a = ApiService();
    final f = await a.getUserDetail(_token, _userid, _compid);
    _userData = f as List<UserDetailModel>;
    notifyListeners();
  }
}
