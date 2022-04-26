import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:aspar_main/local_functions/expirationcalculator.dart';
import 'package:aspar_main/local_functions/userdata.dart';
import 'package:aspar_main/main_page/add_new_glove.dart';
import 'package:aspar_main/veritabani/paginate_gloves.dart';

class MyGloves extends StatefulWidget {
  MyGloves({Key? key}) : super(key: key);

  @override
  State<MyGloves> createState() => _MyGlovesState();
}

class _MyGlovesState extends State<MyGloves> {
  String expirationDate = "Error";
  MaterialColor statusCircleColor = Colors.grey;
  String statusText = "Error";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: UserData.getEmail,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            //snapshot.data userdata'dan gelen email bilgisine esit.
            return Scaffold(
              body: GloveDatabase(snapshot), // paginate_gloves.dart
              floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (newsContext) => AddNewGlove()));
                  },
                  label: Row(
                    children: [
                      Text(
                        "Tap to Add New Glove\t",
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.add,
                        size: 24,
                      )
                    ],
                  )),
            );
          } else {
            return const Text(
                "Something Went Wrong"); // ilk null sonra veri geliyor. henuz cozemedim.
          }
        },
      ),
    );
  }
}
