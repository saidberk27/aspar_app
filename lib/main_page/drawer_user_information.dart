import 'package:flutter/material.dart';

class UserInformation extends StatelessWidget {
  const UserInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: const UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text(
            "KULLANICI ADI",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          accountEmail: Text(
            "email@aspar.com",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white60),
          ),
          currentAccountPicture: CircleAvatar(
            child: Text(
              "AS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
