import 'package:flutter/material.dart';
import 'package:lms/model/user_model.dart';
import 'package:lms/screen/course_screen_management.dart';
import 'package:lms/viewModel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashBoardHomeScreen extends StatefulWidget {
  const DashBoardHomeScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardHomeScreen> createState() => _DashBoardHomeScreenState();
}

class _DashBoardHomeScreenState extends State<DashBoardHomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<UserViewModel>(context, listen: false).getUserData();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  var nama = 'Budi';
  var courseTitle = 'Course Title';
  var courseDesc = 'Course Description';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserViewModel>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 1),
      child: ListView(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              ListTile(
                title: Text(
                  'Halo, $nama !',
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
                subtitle: Text(
                  'Selamat Datang !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/landing.png'),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    '   Kursus Terakhir',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
              Container(
                width: double.infinity,
                height: 260,
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CourseScreen(),
                          ),
                        );
                      },
                      child: courseCard(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Tugas Mendatang :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Container(
                width: double.infinity,
                height: 190,
                child: ListView.builder(
                    padding: EdgeInsets.all(1),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return excerCard();
                    }),
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 255, 102, 36),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Kontak Kami',
                          style: TextStyle(color: Colors.white),
                        ),
                        SvgPicture.asset(
                          'assets/images/instagram.svg',
                          color: Colors.white,
                        ),
                        SvgPicture.asset('assets/images/facebook.svg',
                            color: Colors.white),
                        SvgPicture.asset('assets/images/telegram.svg',
                            color: Colors.white),
                        SvgPicture.asset('assets/images/youtube.svg',
                            color: Colors.white),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
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
                        borderRadius: BorderRadius.circular(20)),
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
