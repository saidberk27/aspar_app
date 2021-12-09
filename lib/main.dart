import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF0FA9EA),
          fontFamily: 'Arial',
        ),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: home());
  }
}
