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
              height: 400,
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'detail_permintaan');
                    },
                    child: permintaanCard(),
                  );
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
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 125, 216, 213),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_box_outlined,
                      size: 25, color: Color.fromRGBO(40, 111, 108, 1)),
                  Text(
                    'Sudah Selesai',
                    style: TextStyle(color: Color.fromRGBO(40, 111, 108, 1)),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Align(alignment: Alignment.topLeft, child: Text('Title Permintaan')),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'username',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(width: 5),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(163, 163, 163, 1),
                  borderRadius: BorderRadius.all(Radius.elliptical(6, 6)),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '6 jam yang lalu',
                style: TextStyle(color: Colors.black54),
              )
            ],
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Lihat detail',
                  style: TextStyle(color: Color.fromRGBO(40, 111, 108, 1)),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color.fromRGBO(40, 111, 108, 1),
              )
            ],
          )
        ],
      ),
    );
  }
}
