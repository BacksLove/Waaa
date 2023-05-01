import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/features/hobbies/domain/entities/hobby.dart';

abstract class HobbiesRemoteDataSource {
  Future<List<Hobby>> getHobbies();
}

class HobbiesRemoteDataSourceImpl implements HobbiesRemoteDataSource {
  @override
  Future<List<Hobby>> getHobbies() async {
    List<Hobby> hobbiesList = [];
    try {
      const doc = '''query listHobbies {
          listHobbies {
            items {
              id
              name
            }
          }
        }''';
      var operation =
          Amplify.API.query(request: GraphQLRequest<String>(document: doc));
      var result = await operation.response;

      if (result.data != null) {
        var hobbiesJSON = json.decode(result.data!)["listHobbies"]["items"];
        hobbiesList =
            (hobbiesJSON).map<Hobby>((e) => Hobby.fromJson(e)).toList();
      }
      return hobbiesList;
    } on AuthException catch (e) {
      safePrint(e.message);
      return hobbiesList;
    }
  }
}
