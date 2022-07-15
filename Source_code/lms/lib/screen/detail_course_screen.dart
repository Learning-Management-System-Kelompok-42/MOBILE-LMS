import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:lms/screen/video_screen.dart';
import 'package:lms/viewModel/course_detail_view_model.dart';
import 'package:lms/viewModel/modul_view_model.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:getwidget/getwidget.dart';

class DetailCourse extends StatefulWidget {
  DetailCourse({Key? key, required this.id}) : super(key: key);

  var id;
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
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    Provider.of<CourseDetailViewModel>(context, listen: false)
        .getUserCourseDetail(widget.id);
    print(widget.id);
    Provider.of<ModulViewModel>(context, listen: false).getUserModul(widget.id);
    print(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detailCourse = Provider.of<CourseDetailViewModel>(context);
    final modul = Provider.of<ModulViewModel>(context);
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
                // ============================================================
                // =                    Course Detail Card                    =
                // ============================================================
                Container(
                  width: double.infinity,
                  height: 925,
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
                                                Text(name,
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
                                                          Icons.lock,
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
                      // ============================================================
                      // =                    Modul Kursus                          =
                      // ============================================================
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 8, top: 2, bottom: 2),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Modul Kursus',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 400,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(
                            padding: EdgeInsets.all(1),
                            itemCount: modul.module.length,
                            itemBuilder: (context, index) {
                              var moduls = modul.module[index].data;
                              return Container(
                                width: double.infinity,
                                height: 400,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(1),
                                  itemCount: moduls.length,
                                  itemBuilder: ((context, index) {
                                    var mod = moduls[index];
                                    return GFAccordion(
                                      titleBorder: Border.all(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      title: mod.Title,
                                      content: 'haloooo',
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
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

  // Widget courseCardDetail() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       padding: EdgeInsets.all(20),
  //       width: double.infinity,
  //       height: 306,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(10),
  //         color: Color.fromARGB(255, 0, 92, 74),
  //       ),
  //       child: Column(
  //         children: [
  //           Container(
  //             width: double.infinity,
  //             height: 70,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(10),
  //                 image: DecorationImage(
  //                     image: AssetImage('assets/images/ret.png'),
  //                     fit: BoxFit.cover)),
  //           ),
  //           const SizedBox(height: 7),
  //           Align(
  //             alignment: Alignment.topLeft,
  //             child: Text(
  //               courseTitle,
  //               style: const TextStyle(
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white),
  //             ),
  //           ),
  //           const SizedBox(height: 7),
  //           Container(
  //             width: double.infinity,
  //             height: 70,
  //             child: Align(
  //               alignment: Alignment.topLeft,
  //               child: Text(
  //                 courseDesc,
  //                 maxLines: 20,
  //                 style: TextStyle(fontSize: 13, color: Colors.white),
  //               ),
  //             ),
  //           ),
  //           Container(
  //             width: double.infinity,
  //             height: 89,
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Text('Mentor :',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold)),
  //                     Text('        '),
  //                     CircleAvatar(
  //                       backgroundImage:
  //                           AssetImage('assets/images/landing.png'),
  //                     ),
  //                   ],
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     Text('     '),
  //                     Text('     '),
  //                     Text(name,
  //                         style: TextStyle(color: Colors.white, fontSize: 15)),
  //                     Text(role,
  //                         style: TextStyle(color: Colors.white, fontSize: 13)),
  //                   ],
  //                 ),
  //                 Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                   children: [
  //                     const Text('Progress:',
  //                         style: TextStyle(
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold)),
  //                     ProgressIndicatorTheme(
  //                       child: Text(
  //                         progress,
  //                         style: TextStyle(color: Colors.white),
  //                       ),
  //                       data: ProgressIndicatorThemeData(),
  //                     ),
  //                     Container(
  //                       width: 70,
  //                       height: 30,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         color: Color.fromRGBO(242, 100, 64, 1),
  //                       ),
  //                       child: InkWell(
  //                         onTap: () {},
  //                         child: Row(
  //                           children: [
  //                             Icon(
  //                               Icons.lock,
  //                               size: 20,
  //                               color: Colors.white,
  //                             ),
  //                             Text('Selesai',
  //                                 style: TextStyle(
  //                                     color: Colors.white, fontSize: 13)),
  //                           ],
  //                         ),
  //                       ),
  //                     )
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

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

  Widget modulKursus() {
    return Accordion(
      maxOpenSections: 1,
      scaleWhenAnimating: true,
      openAndCloseAnimation: true,
      sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
      sectionClosingHapticFeedback: SectionHapticFeedback.light,
      children: [
        AccordionSection(
          headerBackgroundColor: Colors.white,
          headerBackgroundColorOpened: Colors.white,
          rightIcon: Icon(Icons.keyboard_arrow_down_sharp),
          contentBorderColor: Colors.white,
          isOpen: true,
          leftIcon: const Icon(Icons.task, color: Colors.red),
          header: Text('Pengenalan'),
          content: Column(
            children: [
              Container(
                color: Color.fromRGBO(179, 240, 221, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'video_screen');
                  },
                  child: ListTile(
                      leading: Icon(Icons.slow_motion_video),
                      title: Text('Video Materi'),
                      trailing: Icon(Icons.check_box)),
                ),
              ),
              Container(
                color: Color.fromRGBO(179, 240, 221, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'kuis_screen');
                  },
                  child: ListTile(
                      leading: Icon(Icons.task),
                      title: Text('Kuis'),
                      trailing: Icon(Icons.check_box)),
                ),
              ),
              Container(
                color: Color.fromRGBO(179, 240, 221, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'slide_screen');
                  },
                  child: ListTile(
                      leading: Icon(Icons.task),
                      title: Text('PPT'),
                      trailing: Icon(Icons.check_box)),
                ),
              ),
            ],
          ),
        ),
        AccordionSection(
          headerBackgroundColor: Colors.white,
          headerBackgroundColorOpened: Colors.white,
          rightIcon: Icon(Icons.keyboard_arrow_down_sharp),
          contentBorderColor: Colors.white,
          isOpen: true,
          leftIcon: const Icon(Icons.task, color: Colors.red),
          header: Text('Pengenalan'),
          content: Column(
            children: [
              Container(
                color: Color.fromRGBO(179, 240, 221, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'video_screen');
                  },
                  child: ListTile(
                      leading: Icon(Icons.slow_motion_video),
                      title: Text('Video Materi'),
                      trailing: Icon(Icons.check_box)),
                ),
              ),
              Container(
                color: Color.fromRGBO(179, 240, 221, 1),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'kuis_screen');
                  },
                  child: ListTile(
                      leading: Icon(Icons.task),
                      title: Text('Kuis'),
                      trailing: Icon(Icons.check_box)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
