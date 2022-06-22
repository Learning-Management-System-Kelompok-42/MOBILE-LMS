import 'package:flutter/material.dart';
import 'package:lms/screen/akun_screen.dart';
import 'package:lms/screen/edit_akun_screen.dart';

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
          if (settings.name == 'edit_akun_screen') {
            body = EditAkunScreen();
          } else if (settings.name == 'login') {
            Navigator.pushNamed(context, 'login');
          }
          return MaterialPageRoute(builder: (context) => body);
        },
      ),
    );
  }
}
