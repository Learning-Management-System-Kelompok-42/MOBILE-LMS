import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  bool _displayNewTextField = false;
  bool _displayNewButton = false;
  TextEditingController newTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 340,
            color: Color.fromARGB(255, 0, 92, 74),
            child: Center(
              child: Image.asset('assets/images/landing.png', scale: 8),
            ),
          ),
          Container(
            width: double.infinity,
            height: 470,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Color.fromARGB(255, 255, 102, 36),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 102, 36).withOpacity(1),
                  blurRadius: 0,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: 350,
                  height: 110,
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Tingkatkan Kemampuanmu, Mari Belajar Bersama Kami!',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                Container(
                  width: 350,
                  height: 80,
                  child: const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Perluas pengetahuan dengan pembelajaran yang mencengkram dunia',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Visibility(
                  visible: _displayNewTextField,
                  child: Container(
                    width: 350,
                    child: TextFormField(
                      controller: newTextFieldController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Masukkan link invitaion anda',
                        hintText: 'Masukkan link invitaion anda',
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
                ),
                const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: () async {
                //     setState(() {
                //       _displayNewTextField = true;
                //     });
                //   },
                //   child: const Text("Submit"),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _displayNewTextField = true;
                    });
                    Navigator.pushNamed(context, 'regis');
                  },
                  // onPressed: () {
                  //   Navigator.pushNamed(context, 'regis');
                  // },
                  child: const Text('Mulai'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 92, 74),
                      fixedSize: Size(350, 40)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
