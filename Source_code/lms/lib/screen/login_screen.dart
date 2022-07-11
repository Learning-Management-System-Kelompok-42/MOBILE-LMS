import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lms/model/login_model.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:lms/model/user_list_model.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  TextEditingController emailPerusahaan = TextEditingController();
  TextEditingController passwordUser = TextEditingController();
  String userToken = '';

  String emaildummy = 'cobaUbah@gmail.com';
  String passDummy = 'coba123';

  late Future<LoginModel> loginmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text(
                        'Masuk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      // ================================================================================================ //
                      //                FORM EMAIL                                                                        //
                      // ================================================================================================ //
                      TextFormField(
                        controller: emailPerusahaan,
                        decoration: InputDecoration(
                          labelText: emaildummy,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 92, 74)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 92, 74)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('* Gunakan Email Yang Telah Terdaftar')),
                      const SizedBox(height: 10),
                      // ================================================================================================ //
                      //                FORM PASSWORD                                                                     //
                      // ================================================================================================ //
                      TextFormField(
                        controller: passwordUser,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: passDummy,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 92, 74)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 0, 92, 74)),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                passwordUser;
                              });
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ================================================================================================ //
                      //                BUTTON LOGIN                                                                      //
                      // ================================================================================================ //
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 0, 92, 74),
                          fixedSize: Size(300, 40),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          login();
                          getUserDetail();
                        },
                        child: const Text('Masuk'),
                      ),
                      // ================================================================================================ //
                      //                BUTTON BELUM PUNYA AKUN                                                           //
                      // ================================================================================================ //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Belum Punya Akun ?'),
                          const SizedBox(height: 1),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'regis');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 92, 74)),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
                const SizedBox(height: 160),
                // ================================================================================================ //
                //                Kontak kami, Information, FaQ , Tentang Kami                                      //
                // ================================================================================================ //
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(255, 0, 92, 74),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromRGBO(242, 100, 64, 1),
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
                      Container(
                        padding: EdgeInsets.all(8),
                        width: double.infinity,
                        height: 100,
                        child: Column(
                          children: const [
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Informasi',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'FAQ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Tentang Kami',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  login() async {
    dynamic login = await ApiService().login(emaildummy, passDummy);
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    if (login['message'] == 'Success') {
      setState(
        () {
          sharedPref.setString('token', login['data']['token']);
          sharedPref.setString('userid', login['data']['user_id']);
          sharedPref.setString('compid', login['data']['company_id']);
        },
      );
    }
  }

  // getAllUser() async {
  //   SharedPreferences sharedPref = await SharedPreferences.getInstance();
  //   dynamic getAllUser = await ApiService().getAllUser(
  //     sharedPref.get('token'),
  //     sharedPref.get('compid'),
  //   );
  // }

  getUserDetail() async {
    await login();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    dynamic getUserDetail = await ApiService()
        .getUserById(sharedPref.get('token'), sharedPref.get('userid'));
    print('ini adalah result dari method get user detail $getUserDetail');
    if (getUserDetail != null) {
      Navigator.pushNamed(context, 'dashboard');
    }
  }

  // Widget coba() {
  //   return FutureBuilder<LoginModel>(
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         return Text(snapshot.data!.data!.token!);
  //       }
  //       return coba();
  //     },
  //   );
  // }

}
