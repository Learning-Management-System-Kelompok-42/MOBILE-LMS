import 'package:flutter/material.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GantiPasswordScreen extends StatefulWidget {
  const GantiPasswordScreen({Key? key}) : super(key: key);

  @override
  State<GantiPasswordScreen> createState() => _GantiPasswordScreenState();
}

class _GantiPasswordScreenState extends State<GantiPasswordScreen> {
  var img = 'assets/images/landing.png';
  var name = 'Nama';
  var email = 'Email';
  var role = 'UI UX Designer';

  TextEditingController passLamaControler = TextEditingController();
  TextEditingController passBaruControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'akun_screen');
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      'Ganti Password',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Password Lama',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passLamaControler,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan Password Lama',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Password Baru',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passBaruControler,
                  decoration: const InputDecoration(
                    labelText: 'Masukkan Password Baru',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      validasi();
                      setState(() {
                        GantiPasswordScreen;
                      });
                    },
                    child: const Text('Simpan Perubahan'),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 92, 74),
                        fixedSize: Size(160, 30)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  validasi() async {
    if (passLamaControler.text == '' && passBaruControler.text == '') {
      const snackBar = SnackBar(
        content: Text('Masukkan Password Anda !!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      updateUser();
    }
  }

  updateUser() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    dynamic update = await ApiService().changePasswordUser(
      sharedPref.get('token'),
      sharedPref.get('compid'),
      sharedPref.get('userid'),
      passLamaControler.text,
      passBaruControler.text,
    );
    if (update["message"].toString() == "wrong password") {
      const snackBar = SnackBar(
        content: Text('Masukkan Password Anda !!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return update['code'].toString();
  }
}
