import 'package:flutter/material.dart';
import 'input.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
        left: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
        right: BorderSide(width: 4.0, color: Color(0xFF166FC0)),
        bottom: BorderSide(width: 4.0, color: Color(0xFF0FA9EA)),
      )),
      child: Column(
        children: [inputAlan("email"), inputAlan("sifre"), SignInButton()],
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
      onPressed: () {},
      child: Text("SIGN IN"),
      style: OutlinedButton.styleFrom(
          primary: Color(0xFF166FC0),
          side: BorderSide(color: Color(0xFF0FA9EA), width: 2),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}
