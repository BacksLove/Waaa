import 'package:waaa/models/Event.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class GetWaaaEvents extends UseCase<List<Event?>, NoParams> {
  final EventRepository repository;

  GetWaaaEvents(this.repository);

  @override
  Future<List<Event?>> call(NoParams params) async {
    return await repository.getWaaEvents();
  }
}
