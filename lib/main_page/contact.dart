// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            const Text(
              "İLETİŞİM BİLGİLERİ",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0FA9EA)),
              textAlign: TextAlign.center,
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                color: Color(0xFF166FC0),
              ),
              title: const Text(
                "Telefon Numarası",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: const Text(
                "+90 (0312) 577 32 62",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: const Icon(
                Icons.mail,
                color: Color(0xFF166FC0),
              ),
              title: const Text(
                "E-Posta",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: const Text(
                "info@asparenerji.com",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: const Icon(
                Icons.location_pin,
                color: Color(0xFF166FC0),
              ),
              title: const Text(
                "Adres",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: const Text(
                "Saray, 40. Cd No:6, 06980 Kahramankazan/Ankara",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            ListTile(
              leading: const Icon(
                Icons.access_time_filled,
                color: Color(0xFF166FC0),
              ),
              title: const Text(
                "Çalışma Saatler",
                style: TextStyle(fontSize: 24),
              ),
              subtitle: const Text(
                "Pazar Hariç Her Gün 9.00 - 18.00 (GMT+03:00)",
                style: TextStyle(fontSize: 18),
              ),
              trailing: const Icon(
                Icons.arrow_right_outlined,
                color: Color(0xFF0FA9EA),
              ),
              onTap: () {},
            ),
            const Divider(
              height: 20,
              thickness: 4,
              color: Color(0xFF0FA9EA),
            ),
            Container(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 5, color: const Color(0xFF0FA9EA)),
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
