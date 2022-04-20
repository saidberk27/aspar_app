import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp {
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseRef =
      FirebaseFirestore.instance.collection('movies').withConverter<SignUp>(
            fromFirestore: (snapshot, _) => SignUp.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  String Name;
  String Surname;
  String CompanyName;
  String Email;
  String Password;

  SignUp(
      {required this.Name,
      required this.Surname,
      required this.CompanyName,
      required this.Email,
      required this.Password});

  SignUp.fromJson(Map<String, Object?> json)
      : this(
          Name: json['name']! as String,
          Surname: json['surname']! as String,
          CompanyName: json['companyname']! as String,
          Email: json['email']! as String,
          Password: json['password']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': Name,
      'surname': Surname,
      'companyname': CompanyName,
      'email': Email,
      'password': Password,
    };
  }

  Future<void> createFireStoreUserData() {
    String fullName = "$Name $Surname"; // İnsan Okuması İçin Human Readable
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.doc(fullName).set({
      'isim': Name, // John Doe
      'soyisim': Surname, // Stokes and Sons
      'eposta': Email, // 42
      'şirket ismi': CompanyName,
    }).then((value) => print("User Added"));
  }

  Future<void> createFireStoreGloveBase() {
    String fullName = "$Name $Surname"; // İnsan Okuması İçin Human Readable
    CollectionReference users = FirebaseFirestore.instance.collection('test');
    return users
        .doc(Email)
        .set({"E-Postanın Bağlı Olduğu Kişi": fullName}).then(
            (value) => print("GloveBase Added"));
  }

  bool verification() {
    return true;
  }

  Future<void> signUpToDB() async {
    if (verification()) {
      await createAuth();
      await createFireStoreUserData();
      await createFireStoreGloveBase();
    }
  }

  Future<void> createAuth() async {
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
