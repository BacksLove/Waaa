class InputConverter {
  int stringToUnsignedInteger(String str) {
    return int.parse(str);
  }
}

class DateConverter {
  String dateToDateString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  String dateToDatetimeString(DateTime date) {
    return "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}";
  }

  String dateToTimeString(DateTime date) {
    return "${date.hour}:${date.minute}";
  }

  DateTime stringToDate(String date) {
    return DateTime.parse(date);
  }
}
