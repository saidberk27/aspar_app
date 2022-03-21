import 'package:flutter/material.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Text(
              "CONTACT INFO",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0FA9EA)),
              textAlign: TextAlign.center,
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0xFF166FC0),
              ),
              title: Text(
                "Phone Number",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "+90 (0312) 577 32 62",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: Icon(
                Icons.mail,
                color: Color(0xFF166FC0),
              ),
              title: Text(
                "E-Mail",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "info@asparenerji.com",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: Icon(
                Icons.location_pin,
                color: Color(0xFF166FC0),
              ),
              title: Text(
                "Adress",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "Saray, 40. Cd No:6, 06980 Kahramankazan/Ankara",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: Icon(
                Icons.access_time_filled,
                color: Color(0xFF166FC0),
              ),
              title: Text(
                "Working Hours",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text(
                "Everyday but Sunday, 9.00 - 18.00 (GMT+03:00)",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF0FA9EA), width: 4),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.only(bottom: 12.0),
              child: SizedBox(
                width: 300,
                child: Image.asset('assets/images/contact-us.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
