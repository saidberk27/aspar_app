import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/login_page/home_login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignOut extends StatelessWidget {
  const SignOut({Key? key}) : super(key: key);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    _signOut();
    Fluttertoast.showToast(
        msg: "Çıkış Yaptınız.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return const Home();
  }
}
