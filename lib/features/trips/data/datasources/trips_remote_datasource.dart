import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/queries/trip_queries.dart';
import 'package:waaa/models/ModelProvider.dart';

abstract class TripsRemoteDatasource {
  Future<List<Trip?>> getAllTrips();
  Future<Trip?> getTripById(String id);
  Future<List<TripCategory?>> getAllTripCategories();
  Future<List<Activity?>> getAllActivities();
}

class TripsRemoteDataSourceImpl implements TripsRemoteDatasource {
  @override
  Future<List<Trip?>> getAllTrips() {
    throw UnimplementedError();
  }

  @override
  Future<Trip?> getTripById(String id) async {
    try {
      const graphQLDocument = getTripByIdQuery;
      final request = GraphQLRequest<Trip>(
        document: graphQLDocument,
        modelType: Trip.classType,
        variables: <String, String>{'id': id},
        decodePath: "getTrip",
      );
      final response = await Amplify.API.query(request: request).response;
      final trip = response.data;

      safePrint("errors: ${response.errors}");

      if (trip == null) {
        safePrint("errors: ${response.errors}");
        return null;
      }
      return trip;
    } on AuthException catch (e) {
      safePrint(e.message);
      return null;
    }
  }

  @override
  Future<List<TripCategory?>> getAllTripCategories() async {
    try {
      final request = ModelQueries.list(TripCategory.classType);
      final response = await Amplify.API.query(request: request).response;

      final tripCategories = response.data?.items;
      if (tripCategories == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return tripCategories;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }

  @override
  Future<List<Activity?>> getAllActivities() async {
    try {
      final request = ModelQueries.list(Activity.classType);
      final response = await Amplify.API.query(request: request).response;

      final tripActivities = response.data?.items;
      if (tripActivities == null) {
        safePrint('errors: ${response.errors}');
        return const [];
      }
      return tripActivities;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      return const [];
    }
  }
}
