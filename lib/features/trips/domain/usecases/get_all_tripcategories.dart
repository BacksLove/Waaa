import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/trips/domain/repositories/trips_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

class GetAllTripCategories extends UseCase<List<TripCategory?>, NoParams> {
  final TripsRepository repository;

  GetAllTripCategories(this.repository);

  @override
  Future<List<TripCategory?>> call(NoParams params) async {
    return await repository.getAllTripCategories();
  }
}
