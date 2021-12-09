import 'package:flutter/material.dart';
import 'user_information.dart';
import 'draw_menu_items.dart';

class drawer_menu extends StatelessWidget {
  const drawer_menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          user_information(),
          Flexible(
            // Onbound Error Cozum Expanded Widget
            child: menu_items(),
          )
        ],
      ),
    );
  }
}
