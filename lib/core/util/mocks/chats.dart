import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/features/chat/presentation/pages/chat_page.dart';

final DateTime today = DateTime.now();

final List<MyMessage> mockMessage = [
  MyMessage(
    message: "Hello !",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "Hi, how are you ?",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "I'm fine.",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "Hello !",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message:
        "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "I'm fine.",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "Hello !",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "Hi, how are you ?",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "I'm fine.",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "What about you homie ?",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "I'm doing great",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "Good to hear",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "Hello !",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "Hi, how are you ?",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "I'm fine.",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year,
        today.month,
        today.day,
      ),
    ),
  ),
  MyMessage(
    message: "Hello !",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year - 3,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "Hi, how are you ?",
    isMe: false,
    dateTime: TemporalDateTime(
      DateTime(
        today.year - 2,
        today.month,
        today.day - 1,
      ),
    ),
  ),
  MyMessage(
    message: "I'm fine.",
    isMe: true,
    dateTime: TemporalDateTime(
      DateTime(
        today.year - 2,
        today.month,
        today.day - 1,
      ),
    ),
  ),
];
