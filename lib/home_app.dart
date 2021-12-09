import 'package:flutter/material.dart';
import 'draw_menu_items.dart';

class homeApp extends StatelessWidget {
  const homeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: Column(
            children: [
              userInformation(),
              Expanded(
                // Onboun Error Cozum Expanded Widget
                child: menu_items(),
              )
            ],
          ),
        ),
        body: Center(
          child: Text("Sa World"),
        ));
  }

  UserAccountsDrawerHeader userInformation() {
    return UserAccountsDrawerHeader(
      accountName: Text("ASPAR"),
      accountEmail: Text("aspar@aspar.com"),
      currentAccountPicture: Image.network(
          "https://asparenerji.com/wp-content/uploads/2021/11/logo.png"),
    );
  }
}
