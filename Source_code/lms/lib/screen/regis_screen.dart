import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:checkbox_formfield/checkbox_formfield.dart';
import 'package:lms/service/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({Key? key}) : super(key: key);

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

TextEditingController _namaLengkap = TextEditingController();
TextEditingController _nohp = TextEditingController();
TextEditingController _alamat = TextEditingController();
TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _validatorpassword = TextEditingController();

class _RegisScreenState extends State<RegisScreen> {
  @override
  void dispose() {
    super.dispose();
    _namaLengkap.dispose();
    _nohp.dispose();
    _alamat.dispose();
    _email.dispose();
    _password.dispose();
    _validatorpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isobscure = true;
    bool _notChecked = false;
    bool _checked = true;
    void _onChanged(dynamic val) => debugPrint(val.toString());

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Daftar Akun',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    // ================================================================================================ //
                    //                FORM NAMA LENGKAP                                                                 //
                    // ================================================================================================ //
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Nama Lengkap'),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _namaLengkap,
                      decoration: const InputDecoration(
                        labelText: 'Masukan Nama Lengkap',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM NO HANDPHONE                                                                 //
                    // ================================================================================================ //
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Nomor Handphone'),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _nohp,
                      decoration: const InputDecoration(
                        labelText: 'Masukan Nomor Handphone',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM ALAMAT                                                                       //
                    // ================================================================================================ //
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Alamat Lengkap'),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _alamat,
                      obscureText: isobscure,
                      decoration: const InputDecoration(
                        labelText: 'Masukan Alamat Lengkap',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM EMAIL                                                                        //
                    // ================================================================================================ //
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Alamat Email'),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _email,
                      obscureText: isobscure,
                      decoration: const InputDecoration(
                        labelText: 'Masukan Alamat Email',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM PASSWORD                                                                     //
                    // ================================================================================================ //
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text('Kata Sandi'),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _password,
                      obscureText: isobscure,
                      decoration: const InputDecoration(
                        labelText: 'Masukan Kata Sandi',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM VALIDATOR PASSWORD                                                           //
                    // ================================================================================================ //
                    TextFormField(
                      controller: _validatorpassword,
                      obscureText: isobscure,
                      decoration: const InputDecoration(
                        labelText: 'Ulangi Kata Sandi',
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
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                BUTTON CHECK BOX                                                                  //
                    // ================================================================================================ //
                    Row(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Checkbox(
                              value: _notChecked,
                              onChanged: _onChanged,
                              checkColor: Colors.black,
                            )),
                        Container(
                          width: 232,
                          height: 40,
                          child: const Text(
                              'Saya setuju dengan syarat dan ketentuan yang berlaku'),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),

                    // ================================================================================================ //
                    //                BUTTON DAFTAR AKUN                                                                //
                    // ================================================================================================ //
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 92, 74),
                            fixedSize: Size(300, 40)),
                        onPressed: () {
                          checkIsi();
                        },
                        child: const Text('Daftar Akun')),
                    const SizedBox(height: 20),
                    // ================================================================================================ //
                    //                BUTTON SUDAH PUNYA AKUN                                                           //
                    // ================================================================================================ //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Sudah Punya Akun ?'),
                        const SizedBox(height: 1),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 92, 74)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.infinity,
                color: Color.fromARGB(255, 0, 92, 74),
                child: Column(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 255, 102, 36),
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Kontak Kami',
                            style: TextStyle(color: Colors.white),
                          ),
                          SvgPicture.asset(
                            'assets/images/instagram.svg',
                            color: Colors.white,
                          ),
                          SvgPicture.asset('assets/images/facebook.svg',
                              color: Colors.white),
                          SvgPicture.asset('assets/images/telegram.svg',
                              color: Colors.white),
                          SvgPicture.asset('assets/images/youtube.svg',
                              color: Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: double.infinity,
                      height: 100,
                      child: Column(
                        children: const [
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Informasi',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'FAQ',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Tentang Kami',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  regis() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var regis = await ApiService().registerUser(
        sharedPref.get('compid'),
        sharedPref.get('specid'),
        _namaLengkap.text,
        _email.text,
        _password.text,
        _nohp.text,
        _alamat.text);
  }

  checkIsi() {
    if (_namaLengkap.text == '' &&
        _email.text == '' &&
        _password.text == '' &&
        _nohp.text == '' &&
        _alamat.text == '') {
      const snackBar = SnackBar(
        content: Text('Isi form sesuai ketentuan yang benar'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      regis();
    }
  }
}
