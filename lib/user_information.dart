import 'package:flutter/material.dart';

class user_information extends StatelessWidget {
  const user_information({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text(
        "KULLANICI ADI",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      accountEmail: Text(
        "email@aspar.com",
        style: TextStyle(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white60),
      ),
      currentAccountPicture: CircleAvatar(
        child: const Text(
          "AS",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
        ),
      ),
    );
  }
}
