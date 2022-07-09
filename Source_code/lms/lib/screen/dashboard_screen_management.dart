import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lms/screen/course_screen_management.dart';
import 'package:lms/screen/course_screen_active.dart';
import 'package:lms/screen/dashboard_home_screen.dart';
import 'package:lms/screen/profile_screen_management.dart';
import 'package:lms/screen/regis_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lms/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

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
    // setState(() {
    //   curIndex = index;
    // });
    Provider.of<HomeViewModel>(context, listen: false).changeIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    curIndex = Provider.of<HomeViewModel>(context).index;
    bool select = false;
    return WillPopScope(
      onWillPop: () => showExitPopup(context),
      child: Scaffold(
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
            backgroundColor: const Color.fromARGB(255, 255, 102, 36),
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
            selectedItemColor: const Color.fromARGB(255, 0, 92, 74),
            onTap: _selectItem,
          ),
        ),
      ),
    );
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            content: Container(
              height: 320,
              width: 382,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/cuate.png",
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    "Anda yakin ingin keluar ?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            print('no selected');
                            Navigator.of(context).pop();
                          },
                          child: const Text("Kembali",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 102, 36))),
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(130, 42),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: Color.fromARGB(255, 255, 102, 36))),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                        onPressed: () {
                          print('yes selected');
                          exit(0);
                        },
                        child: const Text("Keluar"),
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(130, 42),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          primary: Colors.red.shade800,
                        ),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
