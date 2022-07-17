import 'package:flutter/widgets.dart';
import 'package:lms/model/course_model.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseViewModel with ChangeNotifier {
  List<CourseModel> _userCourse = [];
  List<CourseModel> get userCourse => _userCourse;

  getUserCourse() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = ApiService();
    final f = await a.getAllCourse(sharedPref.get('token'),
        sharedPref.get('userid'), sharedPref.get('specid'));
    _userCourse = [f];
    notifyListeners();
  }

  enRoll(var courseid) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var b = ApiService()
        .enroll(sharedPref.get('token'), sharedPref.get('userid'), courseid);
  }
}
