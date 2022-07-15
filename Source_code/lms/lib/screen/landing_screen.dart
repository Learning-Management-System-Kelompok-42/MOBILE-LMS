import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

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
            height: 300,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 0,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
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
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'link_screen');
                  },
                  child: const Text('Daftar Sekarang'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(242, 100, 64, 1),
                      fixedSize: Size(250, 40)),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  child: const Text(
                    'Masuk',
                    style: TextStyle(color: Color.fromRGBO(242, 100, 64, 1)),
                  ),
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Color.fromRGBO(242, 100, 64, 1)),
                      primary: Colors.white,
                      fixedSize: Size(250, 40)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
