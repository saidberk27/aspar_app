import 'package:cloud_firestore/cloud_firestore.dart';

class SaveGlove {
  final String serialNumber;
  final String productionDate;

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

  final databaseRef = FirebaseFirestore.instance
      .collection("test")
      .doc("a@a.com") //snapshot.data userdata'dan gelen email bilgisine esit.
      .collection("class 0")
      .withConverter<SaveGlove>(
        fromFirestore: (snapshot, _) => SaveGlove.fromJson(snapshot.data()!),
        toFirestore: (movie, _) => movie.toJson(),
      );

  void saveGlovesToDatabase() async {
    await databaseRef.doc(serialNumber).set(
          SaveGlove(serialNumber: serialNumber, productionDate: productionDate),
        );
  }
}

void main(List<String> args) {
  SaveGlove(serialNumber: "TR3223232", productionDate: "12.03.2001")
      .saveGlovesToDatabase();
}
