import 'package:amplify_flutter/amplify_flutter.dart';
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
    return DateFormat("dd/M/yyyy HH:mm").format(date);
  }

  String dateToTimeString(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }

  DateTime stringToDate(String date) {
    return DateTime.parse(date);
  }

  String dateTimetoDate(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  String getAge(TemporalDate? birthday) {
    DateTime today = DateTime.now();
    int age = 0;
    if (birthday != null) {
      var birthdate = birthday.getDateTime();
      int currentMonth = today.month;
      int currentDay = today.day;
      int birthMonth = birthdate.month;
      int birthDay = birthdate.day;
      age = today.year - birthdate.year;
      if (currentMonth > birthMonth) {
        age++;
      } else if (currentMonth == birthMonth) {
        if (currentDay < birthDay) {
          age--;
        }
      }
    }
    return age.toString();
  }
}
