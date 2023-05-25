import 'dart:convert';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/models/ModelProvider.dart';

abstract class HobbiesRemoteDataSource {
  Future<List<Hobby?>> getHobbies();
  Future<bool> addHobbyToUser(String hobbyId, String userId);
}

class HobbiesRemoteDataSourceImpl implements HobbiesRemoteDataSource {
  @override
  Future<List<Hobby?>> getHobbies() async {
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

  @override
  Future<bool> addHobbyToUser(String hobbyId, String userId) async {
    try {
      var doc = ''' mutation CreateHobbyOfUser {
          createHobbyOfUser(input: {hobbyId: "$hobbyId", userId: "$userId"}) {
              hobby {
                name
              }
            }
          } 
          ''';
      var operation = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: doc,
        ),
      );
      var result = await operation.response;
      safePrint("HOBBY RESULT = $result");
      if (result.data != null) {
        safePrint("HOBBY DATA = ${result.data}");
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
