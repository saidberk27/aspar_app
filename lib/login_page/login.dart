// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'input.dart';
import 'logoarea.dart';
import 'package:aspar_main/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        if (orientation == Orientation.portrait) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(child: LogoArea()),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(width: 4.0, color: ProjectColors.lightBlue),
                    left: BorderSide(width: 4.0, color: ProjectColors.darkBlue),
                    right:
                        BorderSide(width: 4.0, color: ProjectColors.darkBlue),
                    bottom:
                        BorderSide(width: 4.0, color: ProjectColors.lightBlue),
                  )),
                  child: Column(
                    children: const [
                      InputAlan(),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                  border: Border(
                top: BorderSide(width: 4.0, color: ProjectColors.lightBlue),
                left: BorderSide(width: 4.0, color: ProjectColors.darkBlue),
                right: BorderSide(width: 4.0, color: ProjectColors.darkBlue),
                bottom: BorderSide(width: 4.0, color: ProjectColors.lightBlue),
              )),
              child: Column(
                children: const [
                  InputAlan(),
                ],
              ),
            ),
          );
        }
      },
    ));
  }
}
