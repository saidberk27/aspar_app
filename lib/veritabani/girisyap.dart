import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/main_page/home_app.dart';

class GirisYap extends StatefulWidget {
  late String email;
  late String sifre;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  GirisYap(email, sifre) {
    this.email = email;
    this.sifre = sifre;
  }

  void girisYap(BuildContext context) async {
    try {
      print("$email $sifre ");
      await _auth.signInWithEmailAndPassword(email: email, password: sifre);

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const HomeApp(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  State<GirisYap> createState() => _GirisYapState();
}

class _GirisYapState extends State<GirisYap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
