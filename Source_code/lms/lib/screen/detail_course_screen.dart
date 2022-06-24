import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailCourse extends StatefulWidget {
  const DetailCourse({Key? key}) : super(key: key);

  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  TextEditingController _ratingController = TextEditingController();
  var _userRating = 4.2;

  var courseTitle = 'ini Judul course';
  var courseDesc = 'ini deskripsi course';
  var img = 'assets/images/landing.png';
  var role = 'UI UX Designer';
  var name = 'Nama Mentor';
  var progress = '5%';
  var pembelajaran = '3';
  bool _isVertical = false;

  IconData? _selectedIcon;

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
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'dashboard_active_screen');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
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
                  height: 600,
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
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.play_circle_outline,
                              color: Colors.black,
                            ),
                            const SizedBox(width: 5),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '$pembelajaran Pembelajaran  :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                          padding: EdgeInsets.all(1),
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, 'kuis_screen');
                              },
                              child: excerCard(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70),
                RatingBarIndicator(
                  rating: _userRating,
                  itemBuilder: (context, index) => Icon(
                    _selectedIcon ?? Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  unratedColor: Colors.amber.withAlpha(50),
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter rating',
                      labelText: 'Enter rating',
                      suffixIcon: MaterialButton(
                        onPressed: () {
                          _userRating = double.parse(_ratingController.text);
                          setState(() {});
                        },
                        child: Text('Rate'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20)
              ],
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
