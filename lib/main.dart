import 'package:flutter/material.dart';
import 'login_page/homeLogin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xFF0FA9EA),
          fontFamily: 'Arial',
        ),
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
