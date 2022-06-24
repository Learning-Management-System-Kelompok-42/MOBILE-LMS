import 'package:flutter/material.dart';
import 'package:lms/screen/login_screen.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  var name = 'Budi';
  var img = 'assets/images/contoh.png';
  var email = 'budi@company.id';
  var role = 'UI/UX Designer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 10),
          ListTile(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back),
            ),
            title: const Text(
              'Akun Saya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox.fromSize(
                  size: Size.fromRadius(40),
                  child: Image.asset(img, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                children: [
                  Container(
                    width: 120,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 92, 74)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 120,
                    child: Text(
                      role,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 120,
                    child: Text(
                      email,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'edit_profile_screen');
            },
            child: Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: ListTile(
                leading: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'ganti_password_screen');
            },
            child: Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: ListTile(
                leading: const Text(
                  'Ganti Password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '');
            },
            child: Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: ListTile(
                leading: const Text(
                  'Sertifikat',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 139),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'login');
            },
            child: const Text('Keluar'),
            style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 92, 74),
                fixedSize: Size(130, 40)),
          ),
        ],
      ),
    ));
  }
}
