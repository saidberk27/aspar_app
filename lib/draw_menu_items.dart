import 'package:flutter/material.dart';

class menu_items extends StatelessWidget {
  const menu_items({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.add_circle_outline_sharp),
            title: Text("Your Gloves"),
            trailing: Icon(Icons.navigate_next_sharp),
          ),
        ),
        Divider(),
        Divider(),
        InkWell(
            child: ListTile(
                onTap: () {},
                leading: Icon(Icons.fiber_new_outlined),
                title: Text("What's New in Aspar?"),
                trailing: Icon(Icons.navigate_next_sharp))),
        Divider(),
        Divider(),
        InkWell(
            onTap: () {},
            child: ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text("About Us"),
                trailing: Icon(Icons.navigate_next_sharp))),
        Divider(),
        Divider(),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Help"),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
        Divider(),
        Divider(),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: Icon(Icons.contact_mail_outlined),
              title: Text("Contact"),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
      ],
    );
  }
}
