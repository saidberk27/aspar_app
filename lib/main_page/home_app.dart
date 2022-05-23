//global key of home_app located in sign_in.dart

import 'aboutUs.dart';
import 'mygloves.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';
import 'home_page.dart';
import 'contact.dart';
import 'package:aspar_main/veritabani/sign_in.dart';

class HomeApp extends StatefulWidget {
  HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => HomeAppState();
}

class HomeAppState extends State<HomeApp> {
  int simdikiIndex = 1;
  late List<Widget> tumSayfalar;
  late Blog blogSayfa;
  late MyGloves gloveSayfa;
  late HomePage homeSayfa;
  late Contact contactSayfa;
  late final controller;

  @override
  void initState() {
    blogSayfa = const Blog();
    gloveSayfa = const MyGloves();
    homeSayfa = const HomePage();
    contactSayfa = const Contact();
    tumSayfalar = <Widget>[blogSayfa, homeSayfa, gloveSayfa, contactSayfa];
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: const DrawerMenu(),
        bottomNavigationBar: bottomNav(),
        body: PageView(

            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            controller: controller,
            children: tumSayfalar,
            onPageChanged: (page) {
              setState(() {
                simdikiIndex = page;
              });
            }));
  }

  BottomNavigationBar bottomNav() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/info.png",
            scale: 2,
          ),
          label: "HAKKIMIZDA",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home.png",
            scale: 2,
          ),
          label: "ANA SAYFA",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/gloves.png",
            scale: 2,
          ),
          label: "ELDİVENLERİM",
        ),
      ],
      onTap: (index) {
        setState(() {
          simdikiIndex = index;
          controller.jumpToPage(index);
        });
      },
      currentIndex: simdikiIndex < 3 ? simdikiIndex : 1,
    );
  }

  void openPage(int pageIndex) {
    controller.jumpToPage(pageIndex);
    Navigator.pop(context);
  }
}
