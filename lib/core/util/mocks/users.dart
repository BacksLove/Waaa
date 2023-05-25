import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/models/User.dart';

User mockYamiYugi = User(
  username: "Yami YuGi",
  photo:
      "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr",
  languagesSpeak: const ["FR", "AL", "DZ"],
);

final List<User> mockUsersList = [
  User(
      username: "Yami YuGi",
      nativeLanguage: "ES",
      birthday: TemporalDate(DateTime.parse("1994-06-10")),
      photo:
          "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr"),
  User(
      username: "Joey Wheeler",
      nativeLanguage: "AL",
      birthday: TemporalDate(DateTime.parse("2000-06-10")),
      photo:
          "https://ms.yugipedia.com//thumb/1/1f/JoeyWheeler-DULI.png/188px-JoeyWheeler-DULI.png"),
  User(
      username: "Mai Valentine",
      nativeLanguage: "FR",
      birthday: TemporalDate(DateTime.parse("1998-06-10")),
      photo:
          "https://images.saymedia-content.com/.image/t_share/MTc0NDQ0NTQyMjg2NjM2Mzky/top-6-strongest-duelists-in-yu-gi-oh.png"),
  User(
      username: "Tea Gardner",
      nativeLanguage: "ML",
      birthday: TemporalDate(DateTime.parse("2005-06-10")),
      photo:
          "https://static.wikia.nocookie.net/yugioh/images/0/08/T%C3%A9a_Gardner.png/revision/latest?cb=20140520004117"),
  User(
      username: "Yami YuGi",
      photo:
          "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr"),
  User(
      username: "Joey Wheeler",
      photo:
          "https://ms.yugipedia.com//thumb/1/1f/JoeyWheeler-DULI.png/188px-JoeyWheeler-DULI.png"),
  User(
      username: "Mai Valentine",
      photo:
          "https://images.saymedia-content.com/.image/t_share/MTc0NDQ0NTQyMjg2NjM2Mzky/top-6-strongest-duelists-in-yu-gi-oh.png"),
  User(
      username: "Tea Gardner",
      photo:
          "https://static.wikia.nocookie.net/yugioh/images/0/08/T%C3%A9a_Gardner.png/revision/latest?cb=20140520004117"),
  User(
      username: "Yami YuGi",
      photo:
          "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr"),
  User(
      username: "Joey Wheeler",
      photo:
          "https://ms.yugipedia.com//thumb/1/1f/JoeyWheeler-DULI.png/188px-JoeyWheeler-DULI.png"),
  User(
      username: "Mai Valentine",
      photo:
          "https://images.saymedia-content.com/.image/t_share/MTc0NDQ0NTQyMjg2NjM2Mzky/top-6-strongest-duelists-in-yu-gi-oh.png"),
  User(
      username: "Tea Gardner",
      photo:
          "https://static.wikia.nocookie.net/yugioh/images/0/08/T%C3%A9a_Gardner.png/revision/latest?cb=20140520004117")
];
