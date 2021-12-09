import 'package:flutter/material.dart';

class LogoArea extends StatelessWidget {
  const LogoArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: 300,
        child: Image.asset('assets/images/asparlogo.png'),
      ),
    );
  }
}
