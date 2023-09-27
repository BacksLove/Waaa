import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chatlist_event.dart';
part 'chatlist_state.dart';

class ChatListBloc extends Bloc<ChatListEvent, ChatListState> {
  ChatListBloc() : super(ChatListState.inital()) {
    on<ChatListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
