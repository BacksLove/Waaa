part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class OnLoadChat extends ChatEvent {
  final User receiver;

  const OnLoadChat({required this.receiver});
}

class SendMessageEvent extends ChatEvent {
  final String content;

  const SendMessageEvent({required this.content});
}
