import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aspar_main/local_functions/userdata.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SaveGlove {
  final String serialNumber;
  final String productionDate;
  var databaseRef;

  SaveGlove({required this.serialNumber, required this.productionDate});

  SaveGlove.fromJson(Map<String, Object?> json)
      : this(
          serialNumber: json['Seri No']! as String,
          productionDate: json['Basım Tarihi']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'Seri No': serialNumber,
      'Basım Tarihi': productionDate,
    };
  }

  Future<void> initializeDatabaseRef() async {
    String? userEmail = await UserData.getEmail;
    databaseRef = FirebaseFirestore.instance
        .collection("test")
        .doc(userEmail) //snapshot.data userdata'dan gelen email bilgisine esit.
        .collection("class 0")
        .withConverter<SaveGlove>(
          fromFirestore: (snapshot, _) => SaveGlove.fromJson(snapshot.data()!),
          toFirestore: (movie, _) => movie.toJson(),
        );
  }

  void saveGlovesToDatabase() async {
    await initializeDatabaseRef();
    await databaseRef.doc(serialNumber).set(
          SaveGlove(serialNumber: serialNumber, productionDate: productionDate),
        );

    Fluttertoast.showToast(
        msg: "Eldiven Başarıyla Kaydedildi",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
