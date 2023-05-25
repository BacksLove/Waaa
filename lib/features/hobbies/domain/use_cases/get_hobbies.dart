import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/models/Hobby.dart';

import '../repositories/hobbies_repository.dart';

class GetHobbies extends UseCase<List<Hobby?>, NoParams> {
  final HobbiesRepository repository;

  GetHobbies(this.repository);

  @override
  Future<List<Hobby?>> call(NoParams params) async {
    return await repository.getHobbies();
  }
}
