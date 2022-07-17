import 'package:flutter/material.dart';
import 'package:lms/model/user_detail_model.dart';
import 'package:lms/viewModel/user_detail_view_model.dart';
import 'package:provider/provider.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserDetailViewModel>(context, listen: false).getUserData();
  }

  var name = 'Budi';
  var img = 'assets/images/contoh.png';
  var email = 'budi@company.id';
  var role = 'UI/UX Designer';

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<UserDetailViewModel>(context);

    Widget detailUser() {
      return Container(
        width: double.infinity,
        height: 90,
        child: ListView.builder(
            padding: EdgeInsets.all(1),
            itemCount: model.userData.length,
            itemBuilder: ((context, index) {
              final user = model.userData[index].data;
              return Row(
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
                        width: 200,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            user.fullName!,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 92, 74)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 200,
                        child: Text(
                          user.specializationName!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: 200,
                        child: Text(
                          user.email!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            })),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            ListTile(
              title: const Text(
                'Akun Saya',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 10),
            detailUser(),
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
                Navigator.pushNamed(context, 'sertifikat_download');
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
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'permintaan_screen');
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black)),
                child: ListTile(
                  leading: const Text(
                    'Permintaan',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              child: const Text('Keluar'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 102, 36),
                  fixedSize: Size(130, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
