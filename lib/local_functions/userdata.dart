import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  late final prefs;

  static Future<String?> get getEmail async {
    final prefs = await SharedPreferences.getInstance();
    String? email = await prefs.getString('email');
    return email;
  }

  static Future<String?> get getUserName async {
    String? username;
    String? email = await UserData.getEmail;
    final docRef =
        FirebaseFirestore.instance.collection("test").doc("${email}");

    DocumentSnapshot doc = await docRef.get();

    final data = doc.data() as Map<String, dynamic>;
    username = data["E-Postanın Bağlı Olduğu Kişi"];
    return username;
  }
}
