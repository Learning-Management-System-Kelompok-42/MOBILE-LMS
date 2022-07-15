import 'package:flutter/cupertino.dart';
import 'package:lms/model/modul_model.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModulViewModel with ChangeNotifier {
  List<ModulModel> _module = [];
  List<ModulModel> get module => _module;

  getUserModul(var courseid) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = ApiService();
    final f = await a.getModulInCourse(
        sharedPref.get('token'), sharedPref.get('userid'), courseid);
    _module = [f];
    notifyListeners();
  }
}
