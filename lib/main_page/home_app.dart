import 'blog.dart';
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
  late Blog blog_sayfa;
  late MyGloves glove_sayfa;
  late HomePage home_sayfa;

  @override
  void initState() {
    // TODO: implement initState
    blog_sayfa = const Blog();
    glove_sayfa = const MyGloves();
    home_sayfa = const HomePage();
    tumSayfalar = [blog_sayfa, home_sayfa, glove_sayfa];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const DrawerMenu(),
        bottomNavigationBar: BottomNav(),
        body: tumSayfalar[simdikiIndex]);
  }

  BottomNavigationBar BottomNav() {
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
