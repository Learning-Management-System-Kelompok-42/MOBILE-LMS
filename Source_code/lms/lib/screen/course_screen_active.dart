import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:textfield_search/textfield_search.dart';

class DashBoardCourseActiveScreen extends StatefulWidget {
  const DashBoardCourseActiveScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardCourseActiveScreen> createState() =>
      _DashBoardCourseScreenState();
}

class _DashBoardCourseScreenState extends State<DashBoardCourseActiveScreen> {
  TextEditingController _searchController = TextEditingController();

  var cari = 'Cari Kursus';
  List daftar = ['1', '2', '3', '4', '5', '6'];

  var courseTitle = 'Course Title';
  var courseDesc = 'Course Description';

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
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
                const SizedBox(height: 5),
                Form(
                  child: TextFieldSearch(
                    label: cari,
                    controller: _searchController,
                    initialList: daftar,
                    decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Cari Kursus',
                      contentPadding: EdgeInsets.only(left: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Kursus Aktif',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 102, 36),
                          fixedSize: Size(130, 30)),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'dashboard_past_screen');
                      },
                      child: const Text(
                        'Kursus Selesai',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 102, 36)),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(130, 30),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 102, 36))),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(1),
                  width: double.infinity,
                  height: 390,
                  child: ListView.builder(
                    padding: EdgeInsets.all(1),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return courseCard();
                    },
                  ),
                ),
              ],
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
        padding: EdgeInsets.all(10),
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
              height: 90,
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
              width: 170,
              lineHeight: 15,
              backgroundColor: Colors.white,
              percent: 0.5,
              progressColor: Color.fromARGB(255, 255, 102, 36),
              center: Text('Progress 6%'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'detail_course_screen');
                },
                child: Text('Mulai'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 102, 36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    fixedSize: Size(90, 30)),
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
