//global key of home_app located in sign_in.dart

import 'package:easy_localization/easy_localization.dart';

import 'about_us.dart';
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
  String selectedLanguage = "en";
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
    controller = PageController(initialPage: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.language),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      child: Row(children: [
                        Image.asset("assets/images/langUK.png"),
                        SizedBox(width: 10), // space
                        Text(
                          "English",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: Row(children: [
                        Image.asset("assets/images/langTR.png"),
                        SizedBox(width: 10), // space
                        Text(
                          "Türkçe",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 0) {
                    print("En");
                    await context.setLocale(Locale('en', "US"));
                  } else if (value == 1) {
                    print("Tr");
                    await context.setLocale(Locale('tr', "TR"));
                  }
                  setState(() {});
                }),
          ],
        ),
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
          label: "about us".tr(),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home.png",
            scale: 2,
          ),
          label: "home".tr(),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/gloves.png",
            scale: 2,
          ),
          label: "my gloves".tr(),
        ),
      ],
      onTap: (index) {
        setState(() {
          simdikiIndex = index;
          controller.jumpToPage(index);
        });
      },
      currentIndex: simdikiIndex < 3
          ? simdikiIndex
          : 1, // if it's more than 2,then raise error for  bottomnav because bottomnav just only have 3 sections.
    );
  }

  void openPage(int pageIndex) {
    controller.jumpToPage(pageIndex);
    Navigator.pop(context);
  }
}
