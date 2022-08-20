// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  String name;
  String surname;
  String companyName;
  String email;
  String password;
  SignUp(this.name, this.surname, this.companyName, this.email, this.password,
      {Key? key})
      : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  void signUpToDB() async {
    try {
      debugPrint(widget.email);
      debugPrint(widget.password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(onPressed: () {}, child: const Text("Kaydet")),
      ),
    );
  }
}
