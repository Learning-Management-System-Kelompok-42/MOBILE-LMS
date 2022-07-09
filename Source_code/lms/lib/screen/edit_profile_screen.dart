import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController namaAkun = TextEditingController();
  TextEditingController nomerHP = TextEditingController();
  TextEditingController alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  'Edit Profile',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ],
            ),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Nama Akun',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: namaAkun,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nama',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
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
                'No. Handphone',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: nomerHP,
              decoration: const InputDecoration(
                labelText: 'Masukkan No.Handphone',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
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
                'Alamat',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: alamat,
              decoration: const InputDecoration(
                labelText: 'Masukkan Alamat',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
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
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      content: Container(
                        height: 327,
                        width: 383,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/perubahan.png",
                            ),
                            const Text(
                              "Perubahan telah disimpan !",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
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
    );
  }
}
