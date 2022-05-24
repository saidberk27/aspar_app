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
    final docRef =
        FirebaseFirestore.instance.collection("test").doc("$getEmail");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        print(data);
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }
}
