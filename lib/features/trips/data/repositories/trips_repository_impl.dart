import 'package:waaa/core/platform/network_info.dart';
import 'package:waaa/features/trips/data/datasources/trips_remote_datasource.dart';
import 'package:waaa/features/trips/domain/repositories/trips_repository.dart';
import 'package:waaa/models/Activity.dart';
import 'package:waaa/models/Trip.dart';
import 'package:waaa/models/TripCategory.dart';

class TripsRepositoryImpl implements TripsRepository {
  final TripsRemoteDatasource datasource;
  final NetworkInfo networkInfo;

  TripsRepositoryImpl(this.datasource, this.networkInfo);

  @override
  Future<List<Trip?>> getAllTrips() async {
    await networkInfo.isConnected;
    final remoteAllTrips = datasource.getAllTrips();

    return remoteAllTrips;
  }

  @override
  Future<List<TripCategory?>> getAllTripCategories() async {
    await networkInfo.isConnected;
    final remoteAllTripCategories = datasource.getAllTripCategories();

    return remoteAllTripCategories;
  }

  @override
  Future<Trip?> getTripById(String id) async {
    await networkInfo.isConnected;
    final remoteTripById = datasource.getTripById(id);

    return remoteTripById;
  }

  @override
  Future<List<Activity?>> getAllActivities() async {
    await networkInfo.isConnected;
    final remote = datasource.getAllActivities();

    return remote;
  }
}
