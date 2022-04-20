import 'package:firebase_auth/firebase_auth.dart';

class SignUp {
  FirebaseAuth auth = FirebaseAuth.instance;

  String Name;
  String Surname;
  String CompanyName;
  String Email;
  String Password;

  SignUp(this.Name, this.Surname, this.CompanyName, this.Email, this.Password);

  void signUpToDB() {}
  void createAuth() async {
    try {
      print(Email);
      print(Password);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email, password: Password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
