import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'mygloves.dart';
import 'contact.dart';
import 'package:aspar_main/veritabani/sign_out.dart';

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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (glovesContext) => const MyGloves()));
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
            onTap: () {},
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (newsContext) => const Blog()));
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (contactContext) => const Contact()));
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
