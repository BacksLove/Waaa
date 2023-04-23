import 'dart:convert';

String jsonToGraphql(String input) {
  final jsonMap = json.decode(input);
  final modifiedJsonMap =
      jsonMap.map((key, value) => MapEntry(key.replaceAll('"', ''), value));
  print("jsontographql= $modifiedJsonMap");
  //final modifiedJsonString = json.encode(modifiedJsonMap);
  return modifiedJsonMap;
}
