// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aspar_main/veritabani/sign_in.dart';
import 'package:aspar_main/login_page/sign_up_page.dart';
import 'package:cool_dropdown/cool_dropdown.dart';

import 'package:aspar_main/colors.dart';

class InputAlan extends StatefulWidget {
  const InputAlan({Key? key}) : super(key: key);

  @override
  State<InputAlan> createState() => InputAlanState();
}

class InputAlanState extends State<InputAlan> {
  List dropdownItemList = [
    {
      'label': 'English',
      'value': 'en',
      'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 16,
          width: 16,
          child: Image.asset(
            // I recommend to use this library, if you want to use svg extension
            'assets/images/langUK.png',
          ))
    },
    {
      'label': 'Türkçe',
      'value': 'tr',
      'icon': Container(
          // if you want to use icon, you have to declare key as 'icon'
          key: UniqueKey(), // you have to use UniqueKey()
          height: 16,
          width: 16,
          child: Image.asset(
            // I recommend to use this library, if you want to use svg extension
            'assets/images/langTR.png',
          ))
    }, // label is required and unique
  ];

  late TextEditingController _emailKontroller;
  late TextEditingController _sifreKontroller;

  @override
  void initState() {
    super.initState();
    _emailKontroller = TextEditingController();
    _sifreKontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailKontroller.dispose();
    _sifreKontroller.dispose();
    super.dispose();
  }

  Future<void> saveEmail() async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("email", _emailKontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextFormField(
              controller: _emailKontroller,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "email".tr(),
                  hintText: "email".tr(),
                  prefixIcon: Icon(Icons.email_outlined),
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 15),
            child: TextFormField(
              controller: _sifreKontroller,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "password".tr(),
                  hintText: "password".tr(),
                  prefixIcon: Icon(Icons.password_sharp),
                  suffixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          Container(
            child: Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    String email = _emailKontroller.text;

                    String sifre = _sifreKontroller.text;
                    GirisYap girisYap = GirisYap(email, sifre);
                    girisYap.girisYap(context);
                    saveEmail();
                  },
                  child: Text("sign in".tr()),
                  style: OutlinedButton.styleFrom(
                      primary: ProjectColors.darkBlue,
                      side: const BorderSide(
                          color: ProjectColors.lightBlue, width: 2),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                ),
                CoolDropdown(
                  dropdownList: dropdownItemList,
                  onChange: (language) async {
                    // kullanici deger degistirirse haberimiz olsun.
                    if (language["value"] == "tr") {
                      await context.setLocale(Locale("tr", "TR"));
                    } else if (language["value"] == "en") {
                      await context.setLocale(Locale("en", "US"));
                    }
                  },
                  defaultValue: context.locale.toString() ==
                          "en_US" // Telefonun Dilini Cekiyor.
                      ? dropdownItemList[0]
                      : context.locale.toString() == "tr_TR"
                          ? dropdownItemList[1]
                          : dropdownItemList[0],
                  dropdownHeight: 120,
                )
              ],
            ),
          ),
          Flexible(
              child: Center(
            child: Text(
              "don't you have an account?".tr(),
              style: TextStyle(
                color: ProjectColors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          )),
          Flexible(
            child: OutlinedButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const SignUpPage()));
              },
              child: Text("sign up".tr()),
              style: OutlinedButton.styleFrom(
                  primary: ProjectColors.darkBlue,
                  side: const BorderSide(
                      color: ProjectColors.lightBlue, width: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          )
        ],
      ),
    );
  }
}
