import 'package:waaa/models/ModelProvider.dart';

abstract class TripsRepository {
  Future<List<Trip?>> getAllTrips();
  Future<Trip?> getTripById(String id);
  Future<List<TripCategory?>> getAllTripCategories();
  Future<List<Activity?>> getAllActivities();
}
