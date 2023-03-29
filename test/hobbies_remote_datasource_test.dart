import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waaa/amplifyconfiguration.dart';
import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';
import 'package:waaa/features/hobbies/domain/entities/hobby.dart';

void main () {
  HobbiesRemoteDataSource dataSource;
  const List<Hobby> result = [];

  setUp(() => {
   // _configureAmplify()
  });

  group('getHobbies', () {
    dataSource = HobbiesRemoteDataSourceImpl();

    test('Je dois pouvoir recuperer la liste des hobbies',
          () async {
        final result = await dataSource.getHobbies();
        print(result.first.name);
      },
    );
  });
}