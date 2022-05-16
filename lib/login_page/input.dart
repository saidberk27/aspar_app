// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aspar_main/veritabani/sign_in.dart';
import 'package:aspar_main/login_page/sign_up_page.dart';

class InputAlan extends StatefulWidget {
  const InputAlan({Key? key}) : super(key: key);

  @override
  State<InputAlan> createState() => InputAlanState();
}

class InputAlanState extends State<InputAlan> {
  late TextEditingController _emailKontroller;
  late TextEditingController _sifreKontroller;

  @override
  void initState() {
    super.initState();
    _emailKontroller = TextEditingController();
    _sifreKontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailKontroller.dispose();
    _sifreKontroller.dispose();
    super.dispose();
  }

  Future<void> saveEmail() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", _emailKontroller.text);
    print("EMAİL ------");
    print(sharedPreferences.getString("email"));
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextFormField(
              controller: _emailKontroller,
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "E - Mail",
                  hintText: "E-Mail",
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
            child: TextFormField(
              controller: _sifreKontroller,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  prefixIcon: Icon(Icons.password_sharp),
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          Flexible(
            child: OutlinedButton(
              onPressed: () {
                String email = _emailKontroller.text;

                String sifre = _sifreKontroller.text;
                GirisYap girisYap = GirisYap(email, sifre);
                girisYap.girisYap(context);
                saveEmail();
              },
              child: const Text("GİRİŞ YAP"),
              style: OutlinedButton.styleFrom(
                  primary: const Color(0xFF166FC0),
                  side: const BorderSide(color: Color(0xFF0FA9EA), width: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const Flexible(
              child: Center(
            child: Text(
              "Hesabın Yok Mu? Aspar Enerji'ye Kaydol!",
              style: TextStyle(
                color: Color(0xFF0FA9EA),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          )),
          Flexible(
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SignUpPage()));
              },
              child: const Text("KAYIT OL"),
              style: OutlinedButton.styleFrom(
                  primary: const Color(0xFF166FC0),
                  side: const BorderSide(color: Color(0xFF0FA9EA), width: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          )
        ],
      ),
    );
  }
}
