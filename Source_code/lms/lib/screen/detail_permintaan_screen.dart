import 'package:flutter/material.dart';

class DetailPermintaan extends StatefulWidget {
  const DetailPermintaan({Key? key}) : super(key: key);

  @override
  State<DetailPermintaan> createState() => _DetailPermintaanState();
}

class _DetailPermintaanState extends State<DetailPermintaan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(40, 111, 108, 0.699999988079071),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10),
            width: 250,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Detail Permintaan Kursus',
                    style: TextStyle(
                        color: Color.fromRGBO(40, 111, 108, 1), fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Judul Permintaan',
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ini adalah isi dari Judul Permintaan',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Alasan'),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 225,
                  child: Text(
                    'Ini Adalah isi dari alasan',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Kembali'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 92, 74),
                    fixedSize: Size(200, 25),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
