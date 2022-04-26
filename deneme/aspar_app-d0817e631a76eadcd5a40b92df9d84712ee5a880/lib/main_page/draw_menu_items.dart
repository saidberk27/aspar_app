import 'package:flutter/material.dart';
import 'aboutUs.dart';
import 'mygloves.dart';
import 'contact.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        const Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
          onTap: () {
            debugPrint("Tapped");
            Navigator.of(context).push(
                MaterialPageRoute(builder: (glovesContext) => MyGloves()));
          },
          child: const ListTile(
            leading: Icon(Icons.add_circle_outline_sharp),
            title: Text(
              "Your Gloves",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.navigate_next_sharp),
          ),
        ),
        const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
        InkWell(
            child: ListTile(
                onTap: () {},
                leading: const Icon(Icons.fiber_new_outlined),
                title: const Text("What's New in Aspar?",
                    style: TextStyle(fontSize: 18)),
                trailing: const Icon(Icons.navigate_next_sharp))),
        const Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (newsContext) => const Blog()));
            },
            child: const ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_sharp))),
        const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
        InkWell(
          onTap: () {},
          child: const ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
        const Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (contactContext) => const Contact()));
          },
          child: const ListTile(
              leading: Icon(Icons.contact_mail_outlined),
              title: Text(
                "Contact",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
        const Divider(thickness: 3, color: Color(0xFF0FA9EA)),
      ],
    );
  }
}
