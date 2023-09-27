// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final User? sender;
  final User? receiver;
  final List<Message?> messages;

  const ChatState(
      {required this.sender, this.receiver, required this.messages});

  factory ChatState.initial() =>
      const ChatState(sender: null, receiver: null, messages: []);

  @override
  List<Object> get props => [messages];

  ChatState copyWith({
    User? sender,
    User? receiver,
    List<Message?>? messages,
  }) {
    return ChatState(
      sender: sender ?? this.sender,
      receiver: receiver ?? this.receiver,
      messages: messages ?? this.messages,
    );
  }
}
