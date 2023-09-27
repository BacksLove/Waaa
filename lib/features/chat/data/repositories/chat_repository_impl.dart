import 'package:waaa/core/platform/network_info.dart';
import 'package:waaa/features/chat/data/datasources/chat_remote_datasource.dart';
import 'package:waaa/features/chat/domain/repositories/chat_repository.dart';
import 'package:waaa/models/Conversation.dart';
import 'package:waaa/models/Message.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDatasource remoteDataSource;
  final NetworkInfo networkInfo;

  ChatRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<bool> createConversation(Conversation conversation) async {
    await networkInfo.isConnected;

    final remote = remoteDataSource.createConversation(conversation);
    return remote;
  }

  @override
  Future<List<Conversation?>> getListConversations(String userId) async {
    await networkInfo.isConnected;

    final remote = remoteDataSource.getListConversations(userId);
    return remote;
  }

  @override
  Future<bool> sendMessage(Message message) async {
    await networkInfo.isConnected;

    final remote = remoteDataSource.sendMessage(message);
    return remote;
  }

  @override
  Future<List<Message?>> getMessagesWithUser(
      String senderId, String receiverId) async {
    await networkInfo.isConnected;

    final remote = remoteDataSource.getMessagesWithUser(senderId, receiverId);
    return remote;
  }
}
