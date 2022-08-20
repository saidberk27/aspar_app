import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:aspar_main/colors.dart';
import 'package:aspar_main/local_functions/warn_user.dart';

class SignUp {
  FirebaseAuth auth = FirebaseAuth.instance;
  final databaseRef =
      FirebaseFirestore.instance.collection('movies').withConverter<SignUp>(
            fromFirestore: (snapshot, _) => SignUp.fromJson(snapshot.data()!),
            toFirestore: (movie, _) => movie.toJson(),
          );
  String? name;
  String? surname;
  String? companyName;
  String? email;
  String? password;

  SignUp(
      {required this.name,
      required this.surname,
      required this.companyName,
      required this.email,
      required this.password});

  SignUp.fromJson(Map<String, Object?> json)
      : this(
          name: json['name']! as String,
          surname: json['surname']! as String,
          companyName: json['companyname']! as String,
          email: json['email']! as String,
          password: json['password']! as String,
        );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'surname': surname,
      'companyname': companyName,
      'email': email,
      'password': password,
    };
  }

  Future<void> createFireStoreUserData() {
    String fullName = "$name $surname"; // İnsan Okuması İçin Human Readable
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.doc(fullName).set({
      'isim': name, // John Doe
      'soyisim': surname, // Stokes and Sons
      'eposta': email, // 42
      'şirket ismi': companyName,
    }).then((value) => Warnings(
            message: "Üye Olma Başarılı Lütfen Giriş Yapınız",
            warningColor: ProjectColors.succesColor)
        .toastWarning());
  }

  Future<void> createFireStoreGloveBase() {
    String fullName = "$name $surname"; // İnsan Okuması İçin Human Readable
    CollectionReference users = FirebaseFirestore.instance.collection('test');
    return users
        .doc(email)
        .set({"E-Postanın Bağlı Olduğu Kişi": fullName}).then(
            (value) => debugPrint("GloveBase Added"));
  }

  bool verification() {
    String emailWithoutSpace = email!.replaceAll(" ", "");
    String nameWithoutSpace = name!.replaceAll(" ", "");
    String surnameWithoutSpace = surname!.replaceAll(" ", "");
    String passwordWithoutSpace = password!.replaceAll(" ", "");
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
      Warnings(message: e.toString(), warningColor: ProjectColors.failColor)
          .toastWarning();
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
      debugPrint(email);
      debugPrint(password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Warnings(
                message: "Şifreniz Çok Zayıf!",
                warningColor: ProjectColors.failColor)
            .toastWarning();
      } else if (e.code == 'email-already-in-use') {
        Warnings(
                message: "Bu Eposta Hesabıyla Kayıt Zaten Mevcut!",
                warningColor: ProjectColors.failColor)
            .toastWarning();
      } else if (e.code == 'invalid-email') {
        Warnings(
                message: "Eposta Adresi Geçersiz!",
                warningColor: ProjectColors.failColor)
            .toastWarning();
      }
      return false;
    }
  }
}
