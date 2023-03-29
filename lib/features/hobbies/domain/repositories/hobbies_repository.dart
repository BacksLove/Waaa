import 'package:waaa/features/hobbies/domain/entities/hobby.dart';

abstract class HobbiesRepository {
  Future<List<Hobby>> getHobbies();
}