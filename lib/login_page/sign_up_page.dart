import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/veritabani/sign_up.dart';
import 'home_login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
        body: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          decoration: const BoxDecoration(
              border: Border(
            top: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
            left: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
            right: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
            bottom: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("sign up".tr(),
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF166FC0))),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _nameController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "name".tr(),
                        hintText: "name".tr(),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _surnameController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "surname".tr(),
                        hintText: "surname".tr(),
                        prefixIcon: Icon(Icons.person),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _companyNameController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "company name".tr(),
                        hintText: "company name".tr(),
                        prefixIcon: Icon(Icons.abc),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _emailController,
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "email".tr(),
                        hintText: "email".tr(),
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: TextFormField(
                    controller: _sifreController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "password".tr(),
                        hintText: "password".tr(),
                        prefixIcon: Icon(Icons.password_sharp),
                        suffixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)))),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Flexible(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                  width: 240,
                  child: OutlinedButton(
                    onPressed: () async {
                      debugPrint("Tiklandi");
                      String _name = _nameController.text;
                      String _surname = _surnameController.text;
                      String _companyname = _companyNameController.text;
                      String _email = _emailController.text;
                      String _password = _sifreController.text;

                      SignUp(
                              companyName: _companyname,
                              email: _email,
                              name: _name,
                              password: _password,
                              surname: _surname)
                          .signUpToDB();

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const Home()));
                    },
                    child: Text("sign up".tr()),
                    style: OutlinedButton.styleFrom(
                        primary: const Color(0xFF166FC0),
                        side: const BorderSide(
                            color: Color(0xFF0FA9EA), width: 2),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
