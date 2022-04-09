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
    gloveDateSplitted = gloveDate.split(".");
    gloveDay = int.parse(gloveDateSplitted[0]);
    gloveMonth = int.parse(gloveDateSplitted[1]);
    gloveYear = int.parse(gloveDateSplitted[2]);
    expirationDateObj = DateTime(gloveYear, gloveMonth + 6, gloveDay);
  }

  String calculateExpiration() {
    initilaze();
    expirationDate = DateFormat('dd.MM.yyyy').format(expirationDateObj);
    return expirationDate;
  }

  MaterialColor statusColor() {
    initilaze();
    DateTime currentDateObj = DateTime.now();
    DateTime gloveDateObj = DateTime(gloveYear, gloveMonth, gloveDay);
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
    DateTime gloveDateObj = DateTime(gloveYear, gloveMonth, gloveDay);
    int difference = expirationDateObj.difference(currentDateObj).inDays;

    if (difference <= 0) {
      return "DANGEROUS TO USE";
    } else if (difference > 0 && difference <= 90) {
      return "YOU SHOULD MAKE YOUR GLOVES TESTED SOON";
    } else {
      return "GLOVES ARE SAFE TO USE";
    }
  }
}
