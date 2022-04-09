import 'package:intl/intl.dart';

class Expiration {
  String calculateExpiration(String gloveDate) {
    List gloveDateSplitted = gloveDate.split(".");
    int gloveDay = int.parse(gloveDateSplitted[0]);
    int gloveMonth = int.parse(gloveDateSplitted[1]);
    int gloveYear = int.parse(gloveDateSplitted[2]);

    DateTime expirationDateInt = DateTime(gloveYear, gloveMonth + 6, gloveDay);
    String expirationDate = DateFormat('dd-MM-yyyy').format(expirationDateInt);

    return expirationDate;
  }
}
