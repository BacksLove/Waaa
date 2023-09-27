import 'package:equatable/equatable.dart';
import 'package:waaa/core/usecases/usecase.dart';
import 'package:waaa/features/chat/domain/repositories/chat_repository.dart';
import 'package:waaa/models/Message.dart';

class SendMessage extends UseCase<bool, SendMessageParams> {
  final ChatRepository repository;

  SendMessage(this.repository);

  @override
  Future<bool> call(SendMessageParams params) async {
    return await repository.sendMessage(params.message);
  }
}

class SendMessageParams extends Equatable {
  final Message message;

  const SendMessageParams({required this.message}) : super();

  @override
  List<Object?> get props => [message];
}
