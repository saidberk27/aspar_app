import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'post.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(12), children: [
      Padding(
        padding: EdgeInsets.only(bottom: 10.0),
        child: Text(
          'announcments'.tr(),
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 36,
              color: const Color(0xFF0FA9EA)),
        ),
      ),
      Post(
          title: "our renewed website".tr(),
          content: "our renewed website text".tr(),
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/yenilenen-web-sitemiz-yayinda.jpg"),
      const Divider(
        thickness: 3,
      ),
      Post(
          title: "germany fair event".tr(),
          content: "germany fair event text".tr(),
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/almanya-fuar-etkinligimiz-768x1024.jpg"),
      const Divider(
        thickness: 3,
      ),
      Post(
          title: "turkey’s first domestic production insulation gloves".tr(),
          content:
              "turkey’s first domestic production insulation gloves text".tr(),
          ImageURL:
              "https://asparenerji.com/wp-content/uploads/2018/09/yerli-uretim-izole-eldiven.jpg"),
    ]);
  }
}
