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
                  height: 20,
                ),
                Container(
                  width: 250,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'regis');
                  },
                  child: const Text('Mulai'),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 92, 74),
                      fixedSize: Size(120, 40)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
