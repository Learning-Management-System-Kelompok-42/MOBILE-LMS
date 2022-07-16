import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lms/service/api_service.dart';
import 'package:lms/viewModel/course_detail_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewScreen extends StatefulWidget {
  ReviewScreen({Key? key, required this.id}) : super(key: key);
  var id;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CourseDetailViewModel>(context, listen: false)
        .getUserCourseDetail(widget.id);
  }

  IconData? _selectedIcon;
  bool _isVertical = false;
  TextEditingController _rating = TextEditingController();
  TextEditingController _review = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final detailCourse = Provider.of<CourseDetailViewModel>(context);
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
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'Review Course',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/landing.png'),
                  ),
                ),
                // ============================================================
                // =                    Course Detail Card                    =
                // ============================================================
                Container(
                  width: double.infinity,
                  height: 325,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 325,
                        child: ListView.builder(
                          padding: EdgeInsets.all(1),
                          itemCount: detailCourse.userCourseDetail.length,
                          itemBuilder: (context, index) {
                            var detail =
                                detailCourse.userCourseDetail[index].data;
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/ret.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(height: 7),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        detail.title,
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
                                          detail.description,
                                          maxLines: 20,
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 89,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 53,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('Mentor :',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                Text('        '),
                                                CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                      'assets/images/landing.png'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 110,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text('     '),
                                                Text('     '),
                                                Text('nama',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15)),
                                                Text('role juga hardcode',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13)),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 70,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                const Text('Progress:',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                ProgressIndicatorTheme(
                                                  child: Text(
                                                    'progress',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  data:
                                                      ProgressIndicatorThemeData(),
                                                ),
                                                Container(
                                                  width: 70,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color.fromRGBO(
                                                        242, 100, 64, 1),
                                                  ),
                                                  child: InkWell(
                                                    onTap: () {},
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .check_box_outlined,
                                                          size: 20,
                                                          color: Colors.white,
                                                        ),
                                                        Text('Selesai',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 13)),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Review',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        child: ListView.builder(
                            itemCount: detailCourse.userCourseDetail.length,
                            itemBuilder: (context, index) {
                              var rev = detailCourse.userCourseDetail[index];
                              return Container(
                                  width: double.infinity,
                                  height: 300,
                                  child: ListView.builder(
                                      itemCount: rev.data.ratingReviews.length,
                                      itemBuilder: (context, index) {
                                        var det = rev.data.ratingReviews[index];
                                        return Container(
                                          width: double.infinity,
                                          height: 80,
                                          child: Column(children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: RatingBarIndicator(
                                                rating: det.rating.toDouble(),
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  _selectedIcon ?? Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 20,
                                                unratedColor:
                                                    Colors.amber.withAlpha(50),
                                                direction: _isVertical
                                                    ? Axis.vertical
                                                    : Axis.horizontal,
                                              ),
                                            ),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(
                                                  det.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            const SizedBox(height: 5),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text('ulasan: ')),
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Text(det.reviews)),
                                          ]),
                                        );
                                      }));
                            }),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(224, 224, 224, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _review,
                    maxLines: 100,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      hintText: 'Ketik alasan anda disini.....',
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _rating,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter rating',
                    labelText: 'Enter rating from 0 - 5',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      reset();
                    },
                    child: const Text('Kirim Ulasan'))
              ],
            ),
          ],
        ),
      ),
    );
  }

  validasi() {
    if (_rating.text == '' || _review.text == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Container(
            height: 327,
            width: 383,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/cuate.png",
                ),
                const Text(
                  "Isi Form Dengan Lengkap!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    } else {
      giveRatRev();
    }
  }

  giveRatRev() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = await ApiService().ratingReview(
        sharedPref.get('token'),
        sharedPref.get('userid'),
        widget.id,
        int.parse(_rating.text),
        _review.text);
    return a;
  }

  reset() async {
    await validasi();
    setState(() {
      _rating.text = '';
      _review.text = '';
    });
  }
}
