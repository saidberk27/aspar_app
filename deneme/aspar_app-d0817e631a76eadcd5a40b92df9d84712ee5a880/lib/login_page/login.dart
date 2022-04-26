// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'input.dart';

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
        children: const [
          InputAlan(),
        ],
      ),
    );
  }
}
