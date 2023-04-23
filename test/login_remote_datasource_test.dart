import 'package:flutter_test/flutter_test.dart';
import 'package:waaa/features/auth/data/data_sources/auth_remote_datasource.dart';

void main() {
  AuthRemoteDataSourceImpl dataSource;

  setUp(() => {});

  group('loginWithEmail', () {
    const email = "bacar@mail.com";
    const password = 'test1234';
    dataSource = AuthRemoteDataSourceImpl();

    test(
      'l utilisateur doit pouvoir se logger',
      () async {
        final result = await dataSource.loginWithEmail(email, password);
        expect(result, equals(true));
      },
    );
  });
}
