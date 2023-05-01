import 'dart:convert';

String jsonToGraphql(Map<String, dynamic> input) {
  final modifiedJsonMap =
      input.map((key, value) => MapEntry(key.replaceAll('"', ''), value));
  //final modifiedJsonString = json.encode(modifiedJsonMap);
  return modifiedJsonMap.toString();
}

String removeQuotesFromKeys(String json) {
  final Map<String, dynamic> data = jsonDecode(json);
  final Map<String, dynamic> newData = {};
  data.forEach((key, value) {
    newData[key.replaceAll('"', '')] = value;
  });

  return newData.toString();
}

String removeQuotesFromKeys1(String json) {
  return json.replaceAllMapped(
      RegExp(r'"(\w+)":'), (Match m) => "${m.group(1)}:");
}

String doubleQuotesAroundValues(String json) {
  final dynamic data = jsonDecode(json);
  dynamic newData;

  if (data is List) {
    newData =
        data.map((item) => doubleQuotesAroundValues(jsonEncode(item))).toList();
  } else if (data is Map) {
    newData = {};
    data.forEach((key, value) {
      if (value is String) {
        newData[key] = '"$value"';
      } else if (value is List) {
        newData[key] = value
            .map((item) => doubleQuotesAroundValues(jsonEncode(item)))
            .toList();
      } else if (value is Map) {
        newData[key] = doubleQuotesAroundValues(jsonEncode(value));
      } else {
        newData[key] = value;
      }
    });
  } else {
    newData = data;
  }

  return newData.toString();
}
