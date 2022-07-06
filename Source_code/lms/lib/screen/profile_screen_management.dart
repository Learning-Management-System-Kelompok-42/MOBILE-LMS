import 'package:flutter/material.dart';
import 'package:lms/screen/akun_screen.dart';
import 'package:lms/screen/detail_permintaan_screen.dart';
import 'package:lms/screen/edit_profile_screen.dart';
import 'package:lms/screen/ganti_password_akun_screen.dart';
import 'package:lms/screen/permintaan_screen.dart';
import 'package:lms/screen/riwayat_permintaan_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        onGenerateRoute: (settings) {
          Widget body = AkunScreen();
          if (settings.name == 'ganti_password_screen') {
            body = GantiPasswordScreen();
          } else if (settings.name == 'login') {
            Navigator.pushNamed(context, 'login');
          } else if (settings.name == 'akun_screen') {
            body = AkunScreen();
          } else if (settings.name == 'edit_profile_screen') {
            body = EditProfileScreen();
          } else if (settings.name == 'permintaan_screen') {
            body = PermintaanScreen();
          } else if (settings.name == 'riwayat_permintaan') {
            body = RiwayatPermintaan();
          } else if (settings.name == 'detail_permintaan') {
            body = DetailPermintaan();
          }
          return MaterialPageRoute(builder: (context) => body);
        },
      ),
    );
  }
}
