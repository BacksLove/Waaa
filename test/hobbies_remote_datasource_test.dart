import 'package:aws_common/aws_common.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';

import 'configure_amplify.dart';

void main() {
  HobbiesRemoteDataSource dataSource;

  setUp(() => {configureAmplify()});

  group('getHobbies', () {
    dataSource = HobbiesRemoteDataSourceImpl();

    test(
      'Je dois pouvoir recuperer la liste des hobbies',
      () async {
        final result = await dataSource.getHobbies();
        safePrint(result.first.name);
      },
    );
  });
}
