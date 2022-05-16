import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  late final prefs;

  static Future<String?> get getEmail async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    return email;
  }
}
