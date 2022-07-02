import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Expiration {
  String gloveDate;
  late String currentDate;

  Expiration(this.gloveDate);
  late List gloveDateSplitted;
  late int gloveDay;
  late int gloveMonth;
  late int gloveYear;

  late String expirationDate;
  late DateTime expirationDateObj;

  void initilaze() {
    try {
      gloveDateSplitted = gloveDate.split(".");

      gloveDay = int.parse(gloveDateSplitted[0]);
      gloveMonth = int.parse(gloveDateSplitted[1]);
      gloveYear = int.parse(gloveDateSplitted[2]);
      expirationDateObj = DateTime(gloveYear, gloveMonth + 6, gloveDay);
    } catch (e) {
      gloveDateSplitted = gloveDate.split("/");

      gloveDay = int.parse(gloveDateSplitted[0]);
      gloveMonth = int.parse(gloveDateSplitted[1]);
      gloveYear = int.parse(gloveDateSplitted[2]);
      expirationDateObj = DateTime(gloveYear, gloveMonth + 6, gloveDay);
    }
  }

  String calculateExpiration() {
    initilaze();
    expirationDate = DateFormat('dd/MM/yyyy').format(expirationDateObj);
    return expirationDate;
  }

  MaterialColor statusColor() {
    initilaze();
    DateTime currentDateObj = DateTime.now();
    int difference = expirationDateObj.difference(currentDateObj).inDays;
    if (difference <= 0) {
      return Colors.red;
    } else if (difference > 0 && difference <= 90) {
      return Colors.yellow;
    } else {
      return Colors.green;
    }
  }

  String statusString() {
    DateTime currentDateObj = DateTime.now();
    int difference = expirationDateObj.difference(currentDateObj).inDays;

    if (difference <= 0) {
      return "dangerous".tr();
    } else if (difference > 0 && difference <= 90) {
      return "should be tested soon".tr();
    } else {
      return "safe".tr();
    }
  }
}
