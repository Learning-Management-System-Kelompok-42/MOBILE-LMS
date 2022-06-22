import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({Key? key}) : super(key: key);

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

TextEditingController _namaLengkap = TextEditingController();
TextEditingController _emailPerusahaan = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _validatorpassword = TextEditingController();

class _RegisScreenState extends State<RegisScreen> {
  @override
  void dispose() {
    super.dispose();
    _namaLengkap.dispose();
    _emailPerusahaan.dispose();
    _password.dispose();
    _validatorpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isobscure = true;
    bool _notChecked = false;
    bool _checked = true;

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
                    TextFormField(
                      controller: _namaLengkap,
                      decoration: const InputDecoration(
                        labelText: 'Nama Lengkap',
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
                    TextFormField(
                      controller: _emailPerusahaan,
                      decoration: const InputDecoration(
                        labelText: 'Alamat Email',
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '* Gunakan Email Perusahaan Kamu',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                FORM PASSWORD                                                                     //
                    // ================================================================================================ //
                    TextFormField(
                      controller: _password,
                      obscureText: isobscure,
                      decoration: InputDecoration(
                        labelText: 'Kata Sandi',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isobscure = false;
                            });
                          },
                          child: Icon(Icons.visibility),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(255, 0, 92, 74)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
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
                        suffixIcon: Icon(Icons.square),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Checkbox(
                          value: _notChecked,
                          onChanged: (bool? _checked) {
                            setState(() {
                              _notChecked = _checked!;
                            });
                          }),
                    ),
                    const Text(
                        'Saya setuju dengan syarat dan ketentuan yang berlaku'),
                    const SizedBox(height: 10),
                    // ================================================================================================ //
                    //                BUTTON DAFTAR AKUN                                                                //
                    // ================================================================================================ //
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 0, 92, 74),
                            fixedSize: Size(300, 40)),
                        onPressed: () {
                          Navigator.pushNamed(context, 'login');
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
}
