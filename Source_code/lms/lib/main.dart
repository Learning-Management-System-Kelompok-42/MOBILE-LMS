import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lms/screen/akun_screen.dart';
import 'package:lms/screen/course_screen_management.dart';
import 'package:lms/screen/course_screen_active.dart';
import 'package:lms/screen/course_screen_past.dart';
import 'package:lms/screen/dashboard_screen_management.dart';
import 'package:lms/screen/detail_permintaan_screen.dart';
import 'package:lms/screen/edit_profile_screen.dart';
import 'package:lms/screen/ganti_password_akun_screen.dart';
import 'package:lms/screen/kuis_screen.dart';
import 'package:lms/screen/landing_screen.dart';
import 'package:lms/screen/login_screen.dart';
import 'package:lms/screen/permintaan_screen.dart';
import 'package:lms/screen/profile_screen_management.dart';
import 'package:lms/screen/regis_screen.dart';
import 'package:lms/screen/riwayat_permintaan_screen.dart';
import 'package:lms/screen/slide_screen.dart';
import 'package:lms/screen/video_screen.dart';
import 'package:lms/viewModel/course_detail_view_model.dart';
import 'package:lms/viewModel/course_view_model.dart';
import 'package:lms/viewModel/home_view_model.dart';
import 'package:lms/viewModel/user_detail_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserDetailViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CourseViewModel(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => CourseDetailViewModel(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'landing',
        routes: {
          'landing': (context) => LandingScreen(),
          'regis': (context) => const RegisScreen(),
          'login': (context) => const LoginScreen(),
          'dashboard': (context) => DashboardScreen(),
          'dashboard_active_screen': (context) =>
              const DashBoardCourseActiveScreen(),
          'dashboard_past_screen': (context) =>
              const DashBoardCoursePastScreen(),
          'course_screen': (context) => CourseScreen(),
          'profile_screen': (context) => ProfileScreen(),
          'akun_screen': (context) => AkunScreen(),
          'ganti_password_screen': (context) => GantiPasswordScreen(),
          'edit_profile_screen': (context) => EditProfileScreen(),
          'video_screen': (context) => VideoScreen(),
          'kuis_screen': (context) => KuisScreen(),
          'permintaan_screen': (context) => PermintaanScreen(),
          'riwayat_permintaan': (context) => RiwayatPermintaan(),
          'detail_permintaan': (context) => DetailPermintaan(),
          'slide_screen': (context) => SlideScreen(),
        },
      ),
    ),
  );
}
