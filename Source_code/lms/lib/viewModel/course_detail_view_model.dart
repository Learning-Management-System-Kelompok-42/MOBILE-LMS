import 'package:flutter/widgets.dart';
import 'package:lms/model/course_detail_model.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailViewModel with ChangeNotifier {
  List<CourseDetailModel> _userCourseDetail = [];
  List<CourseDetailModel> get userCourseDetail => _userCourseDetail;

  getUserCourseDetail(var courseid) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = ApiService();
    final f = await a.getDetailCourse(
        sharedPref.get('token'), sharedPref.get('userid'), courseid);
    _userCourseDetail = [f];
    notifyListeners();
  }
}
