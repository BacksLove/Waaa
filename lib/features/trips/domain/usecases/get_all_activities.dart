import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/trips/domain/repositories/trips_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

class GetAllActivities extends UseCase<List<Activity?>, NoParams> {
  final TripsRepository repository;

  GetAllActivities(this.repository);

  @override
  Future<List<Activity?>> call(NoParams params) async {
    return await repository.getAllActivities();
  }
}
