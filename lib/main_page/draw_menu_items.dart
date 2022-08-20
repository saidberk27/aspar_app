import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/veritabani/sign_out.dart';
import 'package:aspar_main/veritabani/sign_in.dart';
import 'package:aspar_main/colors.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
        right: BorderSide(width: 3.0, color: ProjectColors.darkBlue),
      )),
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          const Divider(
            thickness: 3,
            color: ProjectColors.darkBlue,
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
              title: Text(
                "my gloves".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: ProjectColors.lightBlue),
          InkWell(
              child: ListTile(
            onTap: () {
              GirisYap.homeAppKey.currentState?.openPage(1);
            },
            leading: Image.asset(
              "assets/images/new.png",
              scale: 1.5,
            ),
            title: Text("what's new".tr(), style: TextStyle(fontSize: 18)),
            trailing: const Icon(
              Icons.navigate_next_sharp,
              color: Color(0xFF365059),
            ),
          )),
          const Divider(thickness: 3, color: ProjectColors.darkBlue),
          InkWell(
              onTap: () {
                GirisYap.homeAppKey.currentState?.openPage(0);
              },
              child: ListTile(
                leading: Image.asset(
                  "assets/images/info.png",
                  scale: 1.5,
                ),
                title: Text(
                  "about us".tr(),
                  style: TextStyle(fontSize: 18),
                ),
                trailing: const Icon(
                  Icons.navigate_next_sharp,
                  color: Color(0xFF365059),
                ),
              )),
          const Divider(thickness: 3, color: ProjectColors.lightBlue),
          InkWell(
            onTap: () {},
            child: ListTile(
              leading: Image.asset(
                "assets/images/help.png",
                scale: 1.5,
              ),
              title: Text(
                "help".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: ProjectColors.darkBlue),
          InkWell(
            onTap: () {
              GirisYap.homeAppKey.currentState?.openPage(3);
            },
            child: ListTile(
              leading: Image.asset(
                "assets/images/contact.png",
                scale: 1.5,
              ),
              title: Text(
                "contact".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, color: ProjectColors.lightBlue),
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
              title: Text(
                "log out".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.navigate_next_sharp,
                color: Color(0xFF365059),
              ),
            ),
          ),
          const Divider(thickness: 3, height: 3, color: ProjectColors.darkBlue),
        ],
      ),
    );
  }
}
