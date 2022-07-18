import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';

class KuisScreen extends StatefulWidget {
  const KuisScreen({Key? key}) : super(key: key);

  @override
  State<KuisScreen> createState() => _KuisScreenState();
}

class _KuisScreenState extends State<KuisScreen> {
  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Detail Course',
                style: TextStyle(fontSize: 20),
              ),
              trailing: CircleAvatar(
                backgroundImage: AssetImage('assets/images/landing.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 300,
              child: const Text('Kuis 1 - blablablablablabla'),
            ),
            Container(
              width: 300,
              child: const Text('(5 soal)'),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 441,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return soalCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkCard() {
    return CheckboxListTileFormField(
      onChanged: _onChanged,
      title: Text('jawaban salah'),
    );
  }

  Widget soalCard() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: 300,
      height: 355,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(216, 247, 235, 1),
            ),
            child: Text(
              '1. coba sebutkan kenapa saya membuat ini ?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            color: Color.fromRGBO(216, 247, 235, 1),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(179, 240, 221, 1),
                  ),
                  child: checkCard(),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(179, 240, 221, 1),
                  ),
                  child: checkCard(),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(179, 240, 221, 1),
                  ),
                  child: checkCard(),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(179, 240, 221, 1),
                  ),
                  child: checkCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
