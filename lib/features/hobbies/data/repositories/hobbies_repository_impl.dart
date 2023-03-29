import 'package:waaa/features/hobbies/data/data_sources/hobbies_remote_data_source.dart';
import 'package:waaa/features/hobbies/domain/entities/hobby.dart';
import 'package:waaa/features/hobbies/domain/repositories/hobbies_repository.dart';

import '../../../../core/platform/network_info.dart';

class HobbiesRepositoryImpl extends HobbiesRepository {
  final HobbiesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  HobbiesRepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<List<Hobby>> getHobbies() async {
    networkInfo.isConnected;
    return await remoteDataSource.getHobbies();
  }

}