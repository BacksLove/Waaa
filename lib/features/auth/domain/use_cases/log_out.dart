import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class LogOut extends UseCase<void, NoParams>{
  final AuthRepository repository;

  LogOut(this.repository);

  @override
  Future<void> call (NoParams params) async {
    return await repository.logOut();
  }
}
