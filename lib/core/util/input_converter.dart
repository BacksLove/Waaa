import 'package:intl/intl.dart';

class InputConverter {
  int stringToUnsignedInteger(String str) {
    return int.parse(str);
  }
}

class DateConverter {
  String dateToDateString(DateTime date) {
    return DateFormat("dd/M/yyyy").format(date);
  }

  String dateToDatetimeString(DateTime date) {
    return DateFormat("dd/M/yyyy hh:mm").format(date);
  }

  String dateToTimeString(DateTime date) {
    return DateFormat("hh:mm").format(date);
  }

  DateTime stringToDate(String date) {
    return DateTime.parse(date);
  }
}
