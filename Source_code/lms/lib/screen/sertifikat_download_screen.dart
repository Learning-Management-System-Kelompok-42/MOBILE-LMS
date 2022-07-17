import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class SertifikatDownloadScreen extends StatefulWidget {
  const SertifikatDownloadScreen({Key? key}) : super(key: key);

  @override
  State<SertifikatDownloadScreen> createState() =>
      _SertifikatDownloadScreenState();
}

class _SertifikatDownloadScreenState extends State<SertifikatDownloadScreen> {
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
                    'Sertifikat',
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
                  onPressed: () {},
                  child: const Text(
                    'Download',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 102, 36),
                    fixedSize: Size(130, 30),
                  ),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'sertifikat_riwayat');
                  },
                  child: const Text(
                    'Riwayat',
                    style: TextStyle(color: Color.fromARGB(255, 255, 102, 36)),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: Size(130, 30),
                      side:
                          BorderSide(color: Color.fromARGB(255, 255, 102, 36))),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GFAccordion(
              titleBorder:
                  Border.all(color: Color.fromARGB(255, 255, 255, 255)),
              titleChild: Row(
                children: [
                  Icon(Icons.assignment,
                      color: Color.fromRGBO(242, 100, 64, 1)),
                  const SizedBox(width: 10),
                  Text('Judul Spesialisasi')
                ],
              ),
              contentBackgroundColor: Color.fromRGBO(216, 247, 235, 1),
              contentChild: InkWell(
                onTap: () {},
                child: const Text('Download Sertifikat Spesialisasi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
