// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/main_page/home_app.dart';
import 'package:aspar_main/colors.dart';
import 'package:aspar_main/local_functions/warn_user.dart';

class GirisYap extends StatefulWidget {
  static GlobalKey<HomeAppState> homeAppKey = GlobalKey();

  late String email;
  late String sifre;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  GirisYap(this.email, this.sifre, {Key? key}) : super(key: key);

  void girisYap(BuildContext context) async {
    try {
      Warnings(
              message: "Giriş Yapılıyor, Lütfen Bekleyiniz...",
              warningColor: Colors.grey)
          .toastWarning();
      await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      Navigator.pushReplacement<void, void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeApp(key: homeAppKey),
          ));

      Warnings(
              message: "Giriş Başarılı",
              warningColor: ProjectColors.succesColor)
          .toastWarning();
    } catch (e) {
      debugPrint(e.toString());
      Warnings(
              //TODO Catch(e) den e'yi al, neden başarısız olduğunu kullanıcıya düzgünce açıkla
              message: "Giriş Başarısız.",
              warningColor: ProjectColors.failColor)
          .toastWarning();
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
