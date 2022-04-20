import 'package:flutter/material.dart';
import 'package:aspar_main/veritabani/sign_up.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _nameController;
  late TextEditingController _surnameController;
  late TextEditingController _companyNameController;
  late TextEditingController _emailController;
  late TextEditingController _sifreController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _companyNameController = TextEditingController();
    _emailController = TextEditingController();
    _sifreController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _sifreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _nameController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "İsim",
                    hintText: "İsim",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _surnameController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "Soyisim",
                    hintText: "Soyisim",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _companyNameController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "Kurum İsmi (İsteğe Bağlı)",
                    hintText: "Kuurm İsmi",
                    prefixIcon: Icon(Icons.abc),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _emailController,
                autofocus: true,
                decoration: const InputDecoration(
                    labelText: "E-Posta",
                    hintText: "E-Posta",
                    prefixIcon: Icon(Icons.email_outlined),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: TextFormField(
                controller: _sifreController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: "Parola",
                    hintText: "Parola",
                    prefixIcon: Icon(Icons.password_sharp),
                    suffixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)))),
              ),
            ),
          ),
          SizedBox(height: 30),
          Flexible(
            child: SizedBox(
              height: 100,
              width: 240,
              child: OutlinedButton(
                onPressed: () async {
                  print("Tiklandi");
                  String _name = _nameController.text;
                  String _surname = _surnameController.text;
                  String _companyname = _companyNameController.text;
                  String _email = _emailController.text;
                  String _password = _sifreController.text;

                  SignUp(_name, _surname, _companyname, _email, _password)
                      .signUpToDB();
                },
                child: const Text("Kayıt Ol"),
                style: OutlinedButton.styleFrom(
                    primary: const Color(0xFF166FC0),
                    side: const BorderSide(color: Color(0xFF0FA9EA), width: 2),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
