import 'package:flutter/material.dart';

class EditAkunScreen extends StatefulWidget {
  const EditAkunScreen({Key? key}) : super(key: key);

  @override
  State<EditAkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<EditAkunScreen> {
  var img = 'assets/images/landing.png';
  var name = 'Nama';
  var email = 'Email';
  var role = 'UI UX Designer';

  TextEditingController passLamaControler = TextEditingController();
  TextEditingController passBaruControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 80,
            ),
            const SizedBox(height: 50),
            Text(
              name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              role,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passLamaControler,
              decoration: const InputDecoration(
                labelText: 'Password',
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
            TextFormField(
              controller: passBaruControler,
              decoration: const InputDecoration(
                labelText: 'Password Baru',
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
                onPressed: () {},
                child: const Text('Simpan'),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 92, 74),
                    fixedSize: Size(100, 30)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
