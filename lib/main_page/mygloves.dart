import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyGloves extends StatefulWidget {
  MyGloves({Key? key}) : super(key: key);

  @override
  State<MyGloves> createState() => _MyGlovesState();
}

class _MyGlovesState extends State<MyGloves> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  _getGloves() async {
    debugPrint("Get Gloves");
    var response = await _firestore
        .collection("Musteriler")
        .doc("1")
        .collection("ARC")
        .doc("CLASS 0")
        .collection("TR013C0S08000A")
        .get();
    var eldivenler = response.docs;
    print(eldivenler.first.data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OutlinedButton(
      child: Text("Get Data"),
      onPressed: () {
        _getGloves();
      },
    ));
  }
}
