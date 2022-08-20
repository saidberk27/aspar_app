// ignore_for_file: file_names

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/colors.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: const EdgeInsets.all(12), children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            "about us".tr(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: ProjectColors.darkBlue),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: ProjectColors.lightBlue),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Image.network(
              "https://asparenerji.com/wp-content/uploads/2021/11/hakkimizda.jpg",
            )),
        Padding(
          padding: EdgeInsets.only(
              top: 25.0,
              bottom:
                  25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
          child: Text(
            "about us text".tr(),
            style: TextStyle(fontSize: 18),
          ),
        ),
      ]),
    );
  }
}
