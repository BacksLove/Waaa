import 'package:waaa/models/EventTopic.dart';

import '../../../../core/usecases/usecase.dart';
import '../repositories/event_repository.dart';

class GetAllEventTopic extends UseCase<List<EventTopic?>, NoParams> {
  final EventRepository repository;

  GetAllEventTopic(this.repository);

  @override
  Future<List<EventTopic?>> call(NoParams params) async {
    return await repository.getAllEventTopic();
  }
}
