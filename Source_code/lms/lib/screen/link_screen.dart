import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LinkScreen extends StatefulWidget {
  const LinkScreen({Key? key}) : super(key: key);

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  TextEditingController linkController = TextEditingController();

  @override
  void dispose() {
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Edemia',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 92, 74),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 250,
                    height: 50,
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Tingkatkan Kemampuanmu, Mari Belajar Bersama Kami!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 250,
                    height: 80,
                    child: const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Perluas pengetahuan dengan pembelajaran yang mencengkram dunia',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 20,
                    child: const Text('Tautan Undangan'),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 250,
                    child: TextFormField(
                      controller: linkController,
                      decoration: InputDecoration(
                        labelText: 'Masukkan Tautan Undangan',
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
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 92, 74),
                      fixedSize: Size(250, 40),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      useLink();
                    },
                    child: const Text('Terapkan'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  validasi() {
    if (linkController.text == '') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Container(
            height: 327,
            width: 383,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/cuate.png",
                ),
                const Text(
                  "Mohon Masukkan Link !",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }
  }

  useLink() async {
    await validasi();
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var a = await ApiService().findInvitationLink(linkController.text);
    if (a['code'] == 200) {
      sharedPref.setString('compid', a['data']['company_id']);
      sharedPref.setString('specid', a['data']['specialization_id']);
      Navigator.pushNamed(context, 'regis');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          content: Container(
            height: 327,
            width: 383,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/cuate.png",
                ),
                const Text(
                  "Maaf Link Tidak Valid !",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      );
    }
  }
}
