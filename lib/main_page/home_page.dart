import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text(
          "What's New in Aspar?",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
        ),
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: const Color(0xFF0FA9EA)),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Image.network(
            "https://www.haberiz.com/wp-content/uploads/2013/12/blog-resmi.jpg",
          )),
      const Padding(
        padding: EdgeInsets.only(
            top: 25.0,
            bottom:
                25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
        child: Text(
          "     Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,",
          style: TextStyle(fontSize: 18),
        ),
      ),
      const Divider(
        thickness: 3,
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: const Color(0xFF0FA9EA)),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Image.network(
            "https://www.haberiz.com/wp-content/uploads/2013/12/blog-resmi.jpg",
          )),
      const Padding(
        padding: EdgeInsets.only(
            top: 25.0,
            bottom:
                25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
        child: Text(
          "     Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,",
          style: TextStyle(fontSize: 18),
        ),
      ),
      const Divider(
        thickness: 3,
      ),
      Container(
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: const Color(0xFF0FA9EA)),
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          child: Image.network(
            "https://www.haberiz.com/wp-content/uploads/2013/12/blog-resmi.jpg",
          )),
      const Padding(
        padding: EdgeInsets.only(
            top: 25.0,
            bottom:
                25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
        child: Text(
          "     Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,Haber Metni Buraya Gelecek,",
          style: TextStyle(fontSize: 18),
        ),
      ),
      const Divider(
        thickness: 3,
      ),
    ]);
  }
}
