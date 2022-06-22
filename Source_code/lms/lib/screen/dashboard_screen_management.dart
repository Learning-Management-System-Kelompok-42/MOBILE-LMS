import 'package:flutter/material.dart';
import 'package:lms/screen/course_screen_management.dart';
import 'package:lms/screen/course_screen_active.dart';
import 'package:lms/screen/dashboard_home_screen.dart';
import 'package:lms/screen/profile_screen_management.dart';
import 'package:lms/screen/regis_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int curIndex = 0;

  final List<Widget> widgetOption = <Widget>[
    const DashBoardHomeScreen(),
    const CourseScreen(),
    const ProfileScreen(),
  ];

  void _selectItem(int index) {
    setState(() {
      curIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool select = false;
    return Scaffold(
      body: widgetOption.elementAt(curIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 255, 102, 36),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/home.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/course.svg'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/profile.svg'),
              label: '',
            ),
          ],
          currentIndex: curIndex,
          selectedItemColor: Color.fromARGB(255, 0, 92, 74),
          onTap: _selectItem,
        ),
      ),
    );
  }
}
