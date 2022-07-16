// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lms/service/api_service.dart';

void main() {
  group('Api Test', () {
    test('Find Link Invitation', () async {
      var findLink = await ApiService().findInvitationLink('backend123');
      expect(findLink['data'], isNotEmpty);
    });
    // test('Register Api', () async {
    //   var regis = await ApiService().registerUser('', '', '', '', '', '', '');
    //   expect(regis['data'], isEmpty);
    // });
    test('Login Api', () async {
      var login = await ApiService().login('user1Update@gmail.com', 'user123');
      expect(login['data'], isNotEmpty);
    });
    // test('Get User ', () async {
    //   var getUser = await ApiService().getUserById('', '');
    //   expect(getUser, Error());
    // });
    // test('Get Course ', () async {
    //   var getCourse = await ApiService().getAllCourse('', '', '');
    //   expect(getCourse['code'], 403);
    // });
    // test('Get Detail Course ', () async {
    //   var getDetailCourse = await ApiService().getDetailCourse('', '', '');
    //   expect(getDetailCourse['code'], 403);
    // });
  });
}
