import 'package:flutter_kronos/flutter_kronos.dart';

class GetTodayFromInternet {
  DateTime? today;
  GetTodayFromInternet() {
    FlutterKronos.sync();
  }
  Future<String?> getToday() async {
    today = await FlutterKronos.getNtpDateTime;
    return today.toString();
  }
}
