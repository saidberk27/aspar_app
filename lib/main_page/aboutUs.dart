import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'drawer_menu.dart';

class Blog extends StatelessWidget {
  const Blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: ListView(padding: const EdgeInsets.all(12), children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            "About Us",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
          ),
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: const Color(0xFF0FA9EA)),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Image.network(
              "https://asparenerji.com/wp-content/uploads/2021/11/hakkimizda.jpg",
            )),
        const Padding(
          padding: EdgeInsets.only(
              top: 25.0,
              bottom:
                  25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
          child: Text(
            "     Aspar Enerji ve İş Güvenliği firması , alanında uzman mühendisler ve profesyonellerce enerjide iş güvenliği ürünlerinin ileri teknoloji ile tamamen yerli imkanlarla üretilebilmesi amacıyla 2019 yılının başında kurulmuştur.",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 25.0),
          child: Text(
            "     Kuruluşundan itibaren elektriksel yalıtımlı eldiven üretimi başta olmak üzere üretim grubuna dahil ettiği pek çok ürün için uzun süren arge faaliyetleri yürütmüştür. Firmamız halihazırda ürettiği ürünleri için arge çalışmalarını Ankara Kahramankazan’da kurduğu pilot tesiste yaklaşık 3 senede tamamlamıştır. Araştırma faaliyetleri için firmamız bünyesinde elektriksel testlerin yürütüldüğü bir test laboratuvarı , kimyasal analizlerin ve proseslerin kontrol edildiği bir kimya-malzeme laboratuvarının yanı sıra girdi kontrolleri ve nihai ürünlerin kalite kontrollerinin yapıldığı bir kalite kontrol laboratuvarı bulunmaktadır.",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            "     Türkiye’de yerli imkanlarımızla üretim aşamasından kalite aşamasına  kadar uluslararası ve ulusal standartlara uyan , standartları geliştiren ve yüksek teknolojiyi her aşamada uygulayan bir firma olarak var gücümüzle çalışmaya devam edeceğiz.",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ])),
    );
  }
}
