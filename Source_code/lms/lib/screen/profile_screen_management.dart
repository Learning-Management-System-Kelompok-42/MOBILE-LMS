import 'package:flutter/material.dart';
import 'package:lms/screen/akun_screen.dart';
import 'package:lms/screen/edit_profile_screen.dart';
import 'package:lms/screen/ganti_password_akun_screen.dart';

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
          }
          return MaterialPageRoute(builder: (context) => body);
        },
      ),
    );
  }
}
