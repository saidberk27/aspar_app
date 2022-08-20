import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/login_page/home_login.dart';
import 'package:aspar_main/local_functions/warn_user.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    _signOut();
    Warnings(message: "Çıkış Yaptınız", warningColor: Colors.grey)
        .toastWarning();
    return const Home();
  }
}
