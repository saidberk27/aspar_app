import 'aboutUs.dart';
import 'mygloves.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'home_page.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int simdikiIndex = 1;
  late List<Widget> tumSayfalar;
  late Blog blogSayfa;
  late MyGloves gloveSayfa;
  late HomePage homeSayfa;

  @override
  void initState() {
    blogSayfa = const Blog();
    gloveSayfa = const MyGloves();
    homeSayfa = const HomePage();
    tumSayfalar = [blogSayfa, homeSayfa, gloveSayfa];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const DrawerMenu(),
        bottomNavigationBar: bottomNav(),
        body: tumSayfalar[simdikiIndex]);
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.fiber_new_outlined),
          label: "ABOUT US",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "MY GLOVES",
        ),
      ],
      onTap: (index) {
        setState(() {
          simdikiIndex = index;
        });
      },
      currentIndex: simdikiIndex,
    );
  }
}
