import 'package:flutter/material.dart';
import 'post.dart';
import 'home_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      const Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text(
          "Duyurular & Haberler",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: const Color(0xFF0FA9EA)),
        ),
      ),
      Post(
          title: "Yenilenen Web Sitemiz Yayında",
          content:
              "   Yeni Tasarlanan Web Sitemiz Yayına Girmiştir.Türkiye’nin İlk ve Tek İzole Eldiven üretimi yapan Firmamızın web sitesine ziyaret ettiğiniz için teşekkür ederiz.",
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/yenilenen-web-sitemiz-yayinda.jpg"),
      const Divider(
        thickness: 3,
      ),
      Post(
          title: "Almanya Fuar Etkinliğimiz",
          content:
              "     26-29 EKİM 2021  tarihleri arasında Almanya Düseldorf’da  düzenlenen A+A İŞ GÜVENLİĞİ  fuarında standımızı ziyaret ederek firmamıza ve ürünlerimize göstermiş olduğunuz ilgi için teşekkür ederiz. SAFELINE Dielectric Gloves ekibi olarak yeni tanıştığımız ve var olan müşterilerimizle iş birliğimizi artırma ve güçlendirme şansını yakaladığımız için çok mutluyuz.",
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/almanya-fuar-etkinligimiz-768x1024.jpg"),
      const Divider(
        thickness: 3,
      ),
      Post(
          title: "Türkiyenin İlk Yerli Üretim İzole Eldiveni",
          content:
              "Türkiyenin Yerli Üretim İzole Eldiveni ASPAR ENERJİ olarak  Sizlere Sunmanın gururunu yaşamaktayız.",
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/yerli-uretim-izole-eldiven.jpg"),
    ]);
  }
}
