import 'package:waaa/models/ModelProvider.dart';

abstract class ChatRepository {
  Future<List<Conversation?>> getListConversations(String userId);
  Future<List<Message?>> getMessagesWithUser(
      String senderId, String receiverId);
  Future<bool> createConversation(Conversation conversation);
  Future<bool> sendMessage(Message message);
}
