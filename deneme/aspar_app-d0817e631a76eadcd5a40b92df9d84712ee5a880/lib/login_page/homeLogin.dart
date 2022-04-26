import 'package:flutter/material.dart';
import 'login.dart';
import 'logoarea.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [LogoArea(), loginPage()],
      )),
    );
  }
}
