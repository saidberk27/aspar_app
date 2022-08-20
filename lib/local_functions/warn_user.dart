import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Warnings {
  late String message;
  late Color warningColor;
  Warnings({required String message, required Color warningColor}) {
    this.message = message;
    this.warningColor = warningColor;
  }

  Future<bool?> toastWarning() {
    return Fluttertoast.showToast(
        msg: this.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: this.warningColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
