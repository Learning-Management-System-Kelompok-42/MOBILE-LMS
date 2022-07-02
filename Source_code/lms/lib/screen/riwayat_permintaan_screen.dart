import 'package:flutter/material.dart';

class RiwayatPermintaan extends StatefulWidget {
  const RiwayatPermintaan({Key? key}) : super(key: key);

  @override
  State<RiwayatPermintaan> createState() => _RiwayatPermintaanState();
}

class _RiwayatPermintaanState extends State<RiwayatPermintaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'akun_screen');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  title: Text(
                    'Riwayat Permintaan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'permintaan_screen');
                  },
                  child: const Text(
                    'Permintaan',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 102, 36),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    fixedSize: Size(130, 30),
                    side: BorderSide(
                      color: Color.fromARGB(255, 255, 102, 36),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Riwayat',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 102, 36),
                    fixedSize: Size(130, 30),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return permintaanCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget permintaanCard() {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          Container(child: Row(child)),
        ],
      ),
    );
  }
}
