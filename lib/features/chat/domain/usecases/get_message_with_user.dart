import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/chat/domain/repositories/chat_repository.dart';
import 'package:waaa/models/Message.dart';

class GetMessageWithUser
    extends UseCase<List<Message?>, GetMessageWithUserParams> {
  final ChatRepository repository;

  GetMessageWithUser(this.repository);

  @override
  Future<List<Message?>> call(GetMessageWithUserParams params) async {
    return await repository.getMessagesWithUser(
        params.senderId, params.receiverId);
  }
}

class GetMessageWithUserParams extends Equatable {
  final String senderId;
  final String receiverId;

  const GetMessageWithUserParams(
      {required this.senderId, required this.receiverId})
      : super();

  @override
  List<Object?> get props => [senderId, receiverId];
}
