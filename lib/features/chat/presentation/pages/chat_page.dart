// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

import 'package:waaa/component/circle_avatar.dart';
import 'package:waaa/core/constants/spacer.dart';
import 'package:waaa/core/enums/chat_enum.dart';
import 'package:waaa/core/theme/colors.dart';
import 'package:waaa/core/theme/common_widget/button.dart';
import 'package:waaa/core/theme/text_styles.dart';
import 'package:waaa/core/util/localized.dart';

import 'package:waaa/core/route/routes.dart' as route;
import 'package:waaa/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:waaa/features/users/domain/entities/profile_page_arguments.dart';
import 'package:waaa/models/ModelProvider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.receiver});

  final User receiver;

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return BlocProvider(
      create: (context) => ChatBloc()..add(OnLoadChat(receiver: receiver)),
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Scaffold(
            appBar: state.receiver != null
                ? AppBar(
                    backgroundColor: transparentColor,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        FeatherIcons.chevronLeft,
                        color: blackColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    title: Text(
                      state.receiver!.username,
                      style: appBarTextStyle,
                    ),
                    actions: [
                      PopupMenuButton<ChatMenuItem>(
                        onSelected: (value) {
                          if (value == ChatMenuItem.seeProfile) {
                            Navigator.pushNamed(
                              context,
                              route.profilePage,
                              arguments: ProfilePageArguments(
                                user: state.receiver!,
                                isFromSearching: true,
                              ),
                            );
                          } else if (value == ChatMenuItem.reportUser) {
                            // add report user
                          } else if (value == ChatMenuItem.blockUser) {
                            // add block user
                          } else if (value == ChatMenuItem.needHelp) {
                            // Go to help page
                          }
                        },
                        icon: Icon(
                          FeatherIcons.moreVertical,
                          color: blackColor,
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: ChatMenuItem.seeProfile,
                            child: Text(localized(context).see_profile),
                          ),
                          PopupMenuItem(
                            value: ChatMenuItem.reportUser,
                            child: Text(localized(context).report_the_user),
                          ),
                          PopupMenuItem(
                            value: ChatMenuItem.blockUser,
                            child: Text(localized(context).block_the_user),
                          ),
                          PopupMenuItem(
                            value: ChatMenuItem.needHelp,
                            child: Text(localized(context).need_help),
                          ),
                        ],
                      ),
                    ],
                  )
                : AppBar(
                    backgroundColor: transparentColor,
                    elevation: 0,
                  ),
            body: state.receiver != null
                ? Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            //const ChatHeader(),
                            Expanded(
                              child: MessageList(
                                messages: state.messages,
                                receiver: state.receiver!,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: lightGrayColor,
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, -4),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: messageController,
                          keyboardType: TextInputType.multiline,
                          minLines: 1,
                          maxLines: 5,
                          onFieldSubmitted: (value) {
                            context.read<ChatBloc>().add(SendMessageEvent(
                                content: messageController.text));
                          },
                          decoration: InputDecoration(
                            hintText: localized(context).message,
                            border: InputBorder.none,
                            /*prefixIcon: IconButton(
                          icon: Icon(
                            Ionicons.add,
                            color: lightPrimaryColor,
                          ),
                          onPressed: () {},
                        ),*/
                            suffixIcon: IconButton(
                              icon: Icon(
                                Ionicons.send,
                                color: blackColor,
                              ),
                              onPressed: () {
                                context.read<ChatBloc>().add(SendMessageEvent(
                                    content: messageController.text));
                                messageController.text = "";
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}

class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: primaryButton,
                  child: Text(
                    localized(context).auto_translate,
                    style: boldTextStyle12,
                  ),
                  onPressed: () {},
                ),
              ),
              hSpace20,
              Expanded(
                child: ElevatedButton(
                  style: outlinedBlackButton,
                  child: Text(
                    localized(context).propose_a_itinerary,
                    style: boldTextStyle12,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          vSpace35,
          const WaaaCircleAvatar(
            photo:
                "https://conversationsabouther.net/wp-content/uploads/2017/09/Jayd-Ink-Press-Photo-1.jpg",
          ),
          vSpace20,
          Text(
            localized(context).request_to_join,
            textAlign: TextAlign.center,
            style: lightgrayRegularTextStyle12,
          ),
          vSpace20,
          Divider(
            color: grayColor,
          ),
        ],
      ),
    );
  }
}

class MessageList extends StatelessWidget {
  const MessageList(
      {super.key, required this.messages, required this.receiver});

  final List<Message?> messages;
  final User receiver;

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      padding: const EdgeInsets.all(10),
      reverse: true,
      order: GroupedListOrder.DESC,
      elements: messages,
      groupBy: (element) {
        final DateTime date = element!.createdAt!.getDateTimeInUtc();
        return DateTime(
          date.year,
          date.month,
          date.day,
        );
      },
      groupHeaderBuilder: (element) => Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat.yMMMMd()
                  .format(element!.createdAt!.getDateTimeInUtc()),
            ),
          ),
        ),
      ),
      itemBuilder: (context, element) {
        return Align(
          alignment: element!.author != receiver
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: MessageItem(msg: element, isMe: element.author != receiver),
        );
      },
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.msg, required this.isMe});

  final Message msg;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe) ...{
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: WaaaCircleAvatar(
              photo: msg.author?.photo ?? "",
              width: 30,
              height: 30,
            ),
          ),
          hSpace10,
        },
        Flexible(
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            color: isMe ? secondaryColor : primaryColor,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                msg.content ?? "",
                style: isMe ? boldTextStyle12 : boldWhiteTextStyle12,
              ),
            ),
          ),
        ),
        if (isMe) ...{
          hSpace10,
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: WaaaCircleAvatar(
              photo: msg.recipient.photo,
              width: 30,
              height: 30,
            ),
          ),
        },
      ],
    ); /*Column(
      children: [
        Text("data"),
        Row(
          children: [
            if (!msg.isMe) ...{
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: const WaaaCircleAvatar(
                  photo:
                      "https://conversationsabouther.net/wp-content/uploads/2017/09/Jayd-Ink-Press-Photo-1.jpg",
                  width: 30,
                  height: 30,
                ),
              ),
              hSpace10,
            },
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.66),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: BoxDecoration(
                color: msg.isMe ? primaryColor : secondaryColor,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                msg.message,
                style: msg.isMe ? boldWhiteTextStyle12 : boldTextStyle12,
              ),
            ),
            if (msg.isMe) ...{
              hSpace10,
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: const WaaaCircleAvatar(
                  photo:
                      "https://sportshub.cbsistatic.com/i/2021/10/20/1d426743-26ef-4801-8eb3-8fbdb7d2afc9/demon-slayer.jpg?auto=webp&width=1197&height=629&crop=1.903:1,smart",
                  width: 30,
                  height: 30,
                ),
              ),
            },
          ],
        ),
      ],
    );*/
  }
}

class MyMessage {
  final String message;
  final bool isMe;
  final TemporalDateTime dateTime;

  MyMessage({
    required this.message,
    required this.isMe,
    required this.dateTime,
  });
}
