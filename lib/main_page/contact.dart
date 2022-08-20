// ignore_for_file: camel_case_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/colors.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: <Widget>[
            Text(
              "contact information".tr(),
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: ProjectColors.lightBlue),
              textAlign: TextAlign.center,
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: ProjectColors.lightBlue,
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: ProjectColors.darkBlue,
              ),
              title: Text(
                "phone number".tr(),
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "phone number value".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: ProjectColors.lightBlue,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: ProjectColors.lightBlue,
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: ProjectColors.darkBlue,
              ),
              title: Text(
                "email".tr(),
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "email value".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: ProjectColors.lightBlue,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: ProjectColors.lightBlue,
            ),
            ListTile(
              leading: const Icon(
                Icons.location_pin,
                color: ProjectColors.darkBlue,
              ),
              title: Text(
                "adress".tr(),
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "adress value".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: ProjectColors.lightBlue,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: ProjectColors.lightBlue,
            ),
            ListTile(
              leading: const Icon(
                Icons.access_time_filled,
                color: ProjectColors.darkBlue,
              ),
              title: Text(
                "working hours".tr(),
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "working hours value".tr(),
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: ProjectColors.lightBlue,
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: ProjectColors.lightBlue,
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5, color: ProjectColors.lightBlue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0))),
                    child: Image.asset(
                      "assets/images/contact-us.jpg",
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ))),
          ],
        ),
      ),
    );
  }
}
