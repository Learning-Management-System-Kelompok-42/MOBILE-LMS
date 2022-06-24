import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashBoardCourseActiveScreen extends StatefulWidget {
  const DashBoardCourseActiveScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardCourseActiveScreen> createState() =>
      _DashBoardCourseScreenState();
}

class _DashBoardCourseScreenState extends State<DashBoardCourseActiveScreen> {
  var courseTitle = 'Course Title';
  var courseDesc = 'Course Description';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: Text(
                'Your Courses',
                style: TextStyle(fontSize: 20),
              ),
              trailing: CircleAvatar(
                backgroundImage: AssetImage('assets/images/landing.png'),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Active Courses',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromARGB(255, 255, 102, 36),
                      decorationThickness: 3,
                    ),
                  ),
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'dashboard_past_screen');
                  },
                  child: const Text(
                    'Past Courses',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 450,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return courseCard();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Tugas Mendatang :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 167,
                    child: ListView.builder(
                        padding: EdgeInsets.all(1),
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return excerCard();
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget courseCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 92, 74),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/ret.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 7),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                courseTitle,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 7),
            Container(
              width: double.infinity,
              height: 55,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  courseDesc,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
            LinearPercentIndicator(
              width: 150,
              lineHeight: 15,
              backgroundColor: Colors.white,
              percent: 0.5,
              progressColor: Color.fromARGB(255, 255, 102, 36),
              center: Text('Progress 6%'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'detail_course_screen');
                },
                child: Text('Resume'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 102, 36),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget excerCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 92, 74),
        ),
        width: double.infinity,
        height: 82,
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(5),
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/ret.png'),
              ),
              title: Text(
                'Exercise Title',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              subtitle: Text(
                'Exercise Description',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}