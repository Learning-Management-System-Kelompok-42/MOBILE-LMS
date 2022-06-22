import 'package:flutter/material.dart';
import 'package:lms/model/profile_model.dart';
import 'package:provider/provider.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    _searchController.addListener(() {
      setState(() {});
    });
  }

  var nama = 'Budi';
  var courseTitle = 'Course Title';
  var courseDesc = 'Course Description';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
            title: Text(
              'Halo, $nama !',
              style: TextStyle(
                  fontSize: 13, color: Color.fromARGB(255, 0, 92, 74)),
            ),
            subtitle: Text(
              'Welcome Back !',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 92, 74)),
            ),
            trailing: CircleAvatar(
              backgroundImage: AssetImage('assets/images/landing.png'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 472,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'dashboard_active_screen');
                    },
                    child: courseCard(),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget courseCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 0, 92, 74),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
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
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                courseDesc,
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
