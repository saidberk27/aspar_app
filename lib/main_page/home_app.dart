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
  late final controller;

  @override
  void initState() {
    blogSayfa = const Blog();
    gloveSayfa = const MyGloves();
    homeSayfa = const HomePage();
    tumSayfalar = [blogSayfa, homeSayfa, gloveSayfa];
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
            children: <Widget>[blogSayfa, homeSayfa, gloveSayfa],
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
      currentIndex: simdikiIndex,
    );
  }
}
