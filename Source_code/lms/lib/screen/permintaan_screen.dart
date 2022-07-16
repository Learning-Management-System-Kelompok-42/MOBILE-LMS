import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermintaanScreen extends StatefulWidget {
  const PermintaanScreen({Key? key}) : super(key: key);

  @override
  State<PermintaanScreen> createState() => _PermintaanScreenState();
}

class _PermintaanScreenState extends State<PermintaanScreen> {
  String _verticalGroupValue = '';
  List<String> _status = ['Permintaan Kursus', 'Permintaan Konsultasi'];
  TextEditingController _judulController = TextEditingController();
  TextEditingController _alasanController = TextEditingController();

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
                    'Permintaan',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Permintaan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 102, 36),
                          fixedSize: Size(130, 30)),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'riwayat_permintaan');
                      },
                      child: const Text(
                        'Riwayat',
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 102, 36)),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          fixedSize: Size(130, 30),
                          side: BorderSide(
                              color: Color.fromARGB(255, 255, 102, 36))),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    'Jenis Permintaan',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromRGBO(224, 224, 224, 1),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      RadioGroup<String>.builder(
                        groupValue: _verticalGroupValue,
                        onChanged: (value) => setState(
                          () {
                            _verticalGroupValue = value as String;
                          },
                        ),
                        items: _status,
                        itemBuilder: (item) => RadioButtonBuilder(
                          item,
                        ),
                        activeColor: Color.fromARGB(255, 255, 102, 36),
                        spacebetween: 45,
                        textStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Judul Permintaan',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _judulController,
                  decoration: const InputDecoration(
                    hintText: 'Ketik disini...',
                    labelText: 'Judul Permintaan',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(224, 224, 224, 1),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(224, 224, 224, 1)),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _alasanController,
                    maxLines: 100,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      hintText: 'Ketik alasan anda disini.....',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    validasi();
                    reset();
                  },
                  child: const Text('Kirim'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 92, 74),
                      fixedSize: Size(120, 40)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  validasi() {
    if (_verticalGroupValue.toString() == '' ||
        _judulController.text == '' ||
        _alasanController.text == '') {
      const snackBar = SnackBar(
        content: Text('Maaf Ada Form Yang Belum Kamu Isi !!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      request();
    }
  }

  request() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    dynamic req = await ApiService().permintaan(
        sharedPref.get('token'),
        sharedPref.get('userid'),
        sharedPref.get('compid'),
        _verticalGroupValue.toString(),
        _judulController.text,
        _alasanController.text);
    print(req);
  }

  reset() async {
    await validasi();
    setState(() {
      _judulController.text = '';
      _alasanController.text = '';
      _verticalGroupValue = '';
    });
  }
}
