import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailCourse extends StatefulWidget {
  const DetailCourse({Key? key}) : super(key: key);

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  var courseTitle = 'ini Judul course';
  var courseDesc = 'ini deskripsi course';
  var img = 'assets/images/landing.png';
  var role = 'UI UX Designer';
  var name = 'Nama Mentor';
  var progress = '5%';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'dashboard_active_screen');
                },
                icon: Icon(Icons.arrow_back),
              ),
              title: Text(
                'Detail Course',
                style: TextStyle(fontSize: 20),
              ),
              trailing: CircleAvatar(
                backgroundImage: AssetImage('assets/images/landing.png'),
              ),
            ),
            Container(
              width: double.infinity,
              height: 498,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: ListView.builder(
                      padding: EdgeInsets.all(1),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return courseCardDetail();
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
                    height: 165,
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

  Widget courseCardDetail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 306,
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
              height: 70,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  courseDesc,
                  maxLines: 20,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 89,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('mentor: ',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                      Text('                       '),
                      Text('progress: ',
                          style: TextStyle(fontSize: 14, color: Colors.white)),
                    ],
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(img),
                    ),
                    title: Text('Nama Mentor',
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                    subtitle: Text('UI UX Designer',
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 255, 102, 36))),
                    trailing: Text('5%',
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  )
                ],
              ),
            ),
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
