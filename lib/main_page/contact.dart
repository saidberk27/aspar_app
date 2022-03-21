import 'package:flutter/material.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Text("Telefon"),
                Row(children: [Text("0504-544-444"), Icon(Icons.phone)])
              ],
            ),
          )
        ],
      ),
    );
  }
}
