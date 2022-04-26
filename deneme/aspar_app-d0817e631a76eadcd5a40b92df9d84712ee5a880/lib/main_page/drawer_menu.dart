import 'package:flutter/material.dart';
import 'drawer_user_information.dart';
import 'draw_menu_items.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: const [
          UserInformation(),
          Flexible(
            // Onbound Error Cozum Expanded Widget
            child: MenuItems(),
          )
        ],
      ),
    );
  }
}
