import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';
import 'package:waaa/injection_container.dart' as di;

class FetchCurrentUserAttributes extends UseCase<void, NoParams>{
  final AuthRepository repository;

  FetchCurrentUserAttributes(this.repository);

  @override
  Future<String> call (NoParams params) async {
    return await repository.fetchCurrentUserAttributes();
  }
}