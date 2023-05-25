import 'package:waaa/models/Hobby.dart';

abstract class HobbiesRepository {
  Future<List<Hobby?>> getHobbies();
  Future<bool> addHobbyToUser(String hobbyId, String userId);
}
