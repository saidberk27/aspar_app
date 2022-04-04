import 'package:flutter/material.dart';
import 'input.dart';
import 'package:aspar_main/veritabani/girisyap.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
        left: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
        right: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
        bottom: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
      )),
      child: Column(
        children: [
          InputAlan("email"),
          InputAlan("sifre"),
          const SignInButton(),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        String email = "a@a.com";
        String sifre = "111111";
        GirisYap girisYap = GirisYap(email, sifre);
        girisYap.girisYap(context);
      },
      child: const Text("SIGN IN"),
      style: OutlinedButton.styleFrom(
          primary: const Color(0xFF166FC0),
          side: const BorderSide(color: Color(0xFF0FA9EA), width: 2),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
