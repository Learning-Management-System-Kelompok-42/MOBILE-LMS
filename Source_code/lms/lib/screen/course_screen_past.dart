import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:textfield_search/textfield_search.dart';

class DashBoardCoursePastScreen extends StatefulWidget {
  const DashBoardCoursePastScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardCoursePastScreen> createState() =>
      _DashBoardCourseScreenState();
}

class _DashBoardCourseScreenState extends State<DashBoardCoursePastScreen> {
  var courseTitle = 'Course Title';
  var courseDesc = 'Course Description';

  TextEditingController _searchController = TextEditingController();
  var cari = 'Cari Kursus';
  List daftar = ['1', '2', '3', '4', '5', '6'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
                      onPressed: () {
                        Navigator.pushNamed(context, 'dashboard_active_screen');
                      },
                      child: const Text(
                        'Kursus Aktif',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 102, 36),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: Size(130, 30),
                        side: BorderSide(
                          color: Color.fromARGB(255, 255, 102, 36),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Kursus Selesai',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 102, 36),
                          fixedSize: Size(130, 30)),
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
                        height: 450,
                        child: ListView.builder(
                          padding: EdgeInsets.all(1),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return courseCard();
                          },
                        ),
                      ),
                    ],
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
              percent: 1,
              progressColor: Color.fromARGB(255, 255, 102, 36),
              center: Text('Progress 100%'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'detail_course_screen');
                },
                child: Text('Lihat'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 102, 36),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(90, 30)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
