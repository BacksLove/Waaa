import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/core/queries/chat_queries.dart';

import '../../../../models/ModelProvider.dart';

abstract class ChatRemoteDatasource {
  Future<List<Conversation?>> getListConversations(String userId);
  Future<bool> createConversation(Conversation conversation);
  Future<List<Message?>> getMessagesWithUser(
      String senderId, String receiverId);
  Future<bool> sendMessage(Message message);
}

class ChatRemoteDatasourceImpl implements ChatRemoteDatasource {
  @override
  Future<bool> createConversation(Conversation conversation) async {
    try {
      final request = ModelMutations.create(conversation);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<List<Conversation?>> getListConversations(String userId) async {
    try {
      const graphQLDocument = conversationsListQuery;
      final request = GraphQLRequest<PaginatedResult<Conversation>>(
        document: graphQLDocument,
        modelType: const PaginatedModelType(Conversation.classType),
        //variables: <String, String>{'id': someTodoId},
        decodePath: "",
      );
      final response = await Amplify.API.query(request: request).response;
      final conversations = response.data?.items;
      safePrint("errors: ${response.errors}");

      if (conversations == null || conversations.isEmpty) {
        safePrint("errors: ${response.errors}");
        return [];
      }
      return conversations;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }
  }

  @override
  Future<bool> sendMessage(Message message) async {
    try {
      final request = ModelMutations.create(message);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint("errors: ${response.errors}");
        return false;
      }
      return true;
    } catch (e) {
      safePrint(e);
      return false;
    }
  }

  @override
  Future<List<Message?>> getMessagesWithUser(
      String senderId, String receiverId) async {
    try {
      const graphQLDocument = getMessagesQuery1;
      final request = GraphQLRequest<PaginatedResult<Message>>(
        document: graphQLDocument,
        modelType: const PaginatedModelType(Message.classType),
        variables: <String, String>{'sender': senderId, 'receiver': receiverId},
        decodePath: "listMessages",
      );
      final response = await Amplify.API.query(request: request).response;
      safePrint("resp: ${response.data}");
      final messages = response.data?.items;
      safePrint("errors: ${response.errors}");

      if (messages == null || messages.isEmpty) {
        safePrint("errors: ${response.errors}");
        return [];
      }
      return messages;
    } on AuthException catch (e) {
      safePrint(e.message);
      return [];
    }
  }
}
