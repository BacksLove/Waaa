import 'package:equatable/equatable.dart';
import 'package:waaa/features/trips/domain/repositories/trips_repository.dart';
import 'package:waaa/models/ModelProvider.dart';

import '../../../../core/usecases/usecase.dart';

class GetTripById extends UseCase<Trip?, TripByIdParams> {
  final TripsRepository repository;

  GetTripById(this.repository);

  @override
  Future<Trip?> call(TripByIdParams params) async {
    return await repository.getTripById(params.id);
  }
}

class TripByIdParams extends Equatable {
  final String id;

  const TripByIdParams({required this.id}) : super();

  @override
  List<Object?> get props => [id];
}
