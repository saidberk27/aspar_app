import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class homeApp extends StatelessWidget {
  const homeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: drawer_menu(),
        body: Center(
          child: Text("Sa World"),
        ));
  }
}
