import 'package:flutter/material.dart';

class menu_items extends StatelessWidget {
  const menu_items({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: Icon(Icons.add_circle_outline_sharp),
            title: Text(
              "Your Gloves",
              style: TextStyle(fontSize: 18),
            ),
            trailing: Icon(Icons.navigate_next_sharp),
          ),
        ),
        Divider(thickness: 3, color: Color(0xFF0FA9EA)),
        InkWell(
            child: ListTile(
                onTap: () {},
                leading: Icon(Icons.fiber_new_outlined),
                title: Text("What's New in Aspar?",
                    style: TextStyle(fontSize: 18)),
                trailing: Icon(Icons.navigate_next_sharp))),
        Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
            onTap: () {},
            child: ListTile(
                leading: Icon(Icons.add_box_outlined),
                title: Text(
                  "About Us",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.navigate_next_sharp))),
        Divider(thickness: 3, color: Color(0xFF0FA9EA)),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: Icon(Icons.help_outline),
              title: Text(
                "Help",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
        Divider(thickness: 3, color: Color(0xFF166FC0)),
        InkWell(
          onTap: () {},
          child: ListTile(
              leading: Icon(Icons.contact_mail_outlined),
              title: Text(
                "Contact",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(Icons.navigate_next_sharp)),
        ),
        Divider(thickness: 3, color: Color(0xFF0FA9EA)),
      ],
    );
  }
}
