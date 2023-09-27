import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waaa/core/constants/constants.dart';
import 'package:waaa/features/chat/domain/usecases/get_message_with_user.dart';
import 'package:waaa/features/chat/domain/usecases/send_message.dart';
import 'package:waaa/features/users/domain/use_cases/get_user_by_id.dart';
import 'package:waaa/models/ModelProvider.dart';

import 'package:waaa/injection_container.dart' as di;

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState.initial()) {
    on<OnLoadChat>(_onLoadChat);
    on<SendMessageEvent>(_onSendMessage);
  }

  void _onLoadChat(OnLoadChat event, Emitter<ChatState> emit) async {
    if (event.receiver.id.isNotEmpty) {
      final userId = di.sl<SharedPreferences>().getString(userCognitoIdKey);
      final user =
          await di.sl<GetUserById>().call(GetUserByIdParams(id: userId!));

      safePrint("senderId= ${user?.id}\nreceiverId= ${event.receiver.id}");
      final msg = await di.sl<GetMessageWithUser>().call(
          GetMessageWithUserParams(
              senderId: user!.id, receiverId: event.receiver.id));
      emit(state.copyWith(
          sender: user, messages: msg, receiver: event.receiver));
    }
  }

  void _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    if (event.content.isNotEmpty) {
      final msg = Message(
        content: event.content,
        recipient: state.receiver!,
        author: state.sender,
        createdAt: TemporalDateTime(DateTime.now()),
      );

      await di.sl<SendMessage>().call(SendMessageParams(message: msg));
    }
  }
}
