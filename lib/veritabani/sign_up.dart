import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp {
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseRef =
      FirebaseFirestore.instance.collection('movies').withConverter<SignUp>(
            fromFirestore: (snapshot, _) => SignUp.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  String? Name;
  String? Surname;
  String? CompanyName;
  String? Email;
  String? Password;

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

  void showToast(String message, MaterialColor color) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> createFireStoreUserData() {
    String fullName = "$Name $Surname"; // İnsan Okuması İçin Human Readable
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.doc(fullName).set({
      'isim': Name, // John Doe
      'soyisim': Surname, // Stokes and Sons
      'eposta': Email, // 42
      'şirket ismi': CompanyName,
    }).then((value) =>
        showToast("Üye Olma Başarılı Lütfen Giriş Yapınız", Colors.green));
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
    String emailWithoutSpace = Email!.replaceAll(" ", "");
    String nameWithoutSpace = Name!.replaceAll(" ", "");
    String surnameWithoutSpace = Surname!.replaceAll(" ", "");
    String passwordWithoutSpace = Password!.replaceAll(" ", "");
    try {
      if (nameWithoutSpace == "" ||
          emailWithoutSpace == "" ||
          surnameWithoutSpace == "" ||
          passwordWithoutSpace == "") {
        throw ("Lütfen Her Yeri Eksiksiz Doldurun!");
      } else {
        return true;
      }
    } catch (e) {
      showToast(e.toString(), Colors.red);
      return false;
    }
  }

  Future<void> signUpToDB() async {
    if (verification()) {
      if (await createAuth()) {
        await createFireStoreUserData();
        await createFireStoreGloveBase();
      }
    }
  }

  Future<bool> createAuth() async {
    try {
      print(Email);
      print(Password);
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: Email!, password: Password!);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast("Şifreniz Çok Zayıf!", Colors.red);
      } else if (e.code == 'email-already-in-use') {
        showToast("Bu Eposta Hesabıyla Kayıt Zaten Mevcut!", Colors.red);
      } else if (e.code == 'invalid-email') {
        showToast("Eposta Adresi Geçersiz!", Colors.red);
      }
      return false;
    }
  }
}
