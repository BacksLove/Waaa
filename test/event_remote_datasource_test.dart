import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waaa/features/events/data/data_sources/event_remote_datasource.dart';

void main() {
  EventRemoteDatasource dataSource;

  setUp(() async => {});

  group('allEvents', () {
    dataSource = EventRemoteDatasourceImpl();

    test(
      'Je dois pouvoir recuperer la liste des events',
      () async {
        final result = await dataSource.getWaaEvents();
        safePrint(result.first?.name);
      },
    );
  });
}
