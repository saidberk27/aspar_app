import 'package:aspar_main/main_page/home_app.dart';
import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'mygloves.dart';
import 'contact.dart';
import 'package:aspar_main/veritabani/sign_out.dart';
import 'package:aspar_main/veritabani/sign_in.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 3.0, color: Color(0xFF166FC0)),
      )),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const Divider(
            thickness: 3,
            color: Color(0xFF166FC0),
            height: 3,
          ),
          InkWell(
            onTap: () {
              debugPrint("Tapped");
              GirisYap.homeAppKey.currentState?.openPage(
                  2); //   tumSayfalar = <Widget>[blogSayfa, homeSayfa, gloveSayfa]; baz alınarak index numarası gönderilmiştir.(home_app.dart)
            },
            child: ListTile(
              leading: Image.asset(
                "assets/images/gloves.png",
                scale: 1.5,
              ),
              title: const Text(
                "Eldivenleriniz",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
          InkWell(
              child: ListTile(
            onTap: () {
              GirisYap.homeAppKey.currentState?.openPage(1);
            },
            leading: Image.asset(
              "assets/images/new.png",
              scale: 1.5,
            ),
            title: const Text("Aspar Enerji'de Yeni Ne Var?",
                style: TextStyle(fontSize: 18)),
            trailing: const Icon(
              Icons.navigate_next_sharp,
              color: Color(0xFF365059),
            ),
          )),
          const Divider(thickness: 3, color: Color(0xFF166FC0)),
          InkWell(
              onTap: () {
                GirisYap.homeAppKey.currentState?.openPage(0);
              },
              child: ListTile(
                leading: Image.asset(
                  "assets/images/info.png",
                  scale: 1.5,
                ),
                title: const Text(
                  "Hakkımızda",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.navigate_next_sharp,
                  color: Color(0xFF365059),
                ),
              )),
          const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                "assets/images/help.png",
                scale: 1.5,
              ),
              title: const Text(
                "Yardım",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: Color(0xFF166FC0)),
          InkWell(
            onTap: () {
              GirisYap.homeAppKey.currentState?.openPage(3);
            },
            child: ListTile(
              leading: Image.asset(
                "assets/images/contact.png",
                scale: 1.5,
              ),
              title: const Text(
                "İletişim",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (contactContext) => const SignOut()));
            },
            child: ListTile(
              leading: Image.asset(
                "assets/images/exit.png",
                scale: 1.5,
              ),
              title: const Text(
                "Çıkış Yap",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, height: 3, color: Color(0xFF166FC0)),
        ],
      ),
    );
  }
}
