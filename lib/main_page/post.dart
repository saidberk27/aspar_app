import 'package:flutter/material.dart';

import 'package:aspar_main/colors.dart';

class Post extends StatelessWidget {
  String title;
  String content;
  String ImageURL;
  Post(
      {Key? key,
      required this.title,
      required this.content,
      required this.ImageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            child: Text(
          "${this.title}",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ProjectColors.darkBlue),
        )),
        Container(
            decoration: BoxDecoration(
                border: Border.all(width: 5, color: ProjectColors.lightBlue),
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            child: Image.network(
              "${this.ImageURL}",
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
        Padding(
          padding: EdgeInsets.only(
              top: 25.0,
              bottom:
                  25.0), // top sadece burada, yukarıdaki padding sikintisindan oturu.
          child: Text(
            "${this.content}",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
