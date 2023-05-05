import '../../../features/users/domain/entities/user_entity.dart';

const User mockYamiYugi = User(
  username: "Yami YuGi",
  photo:
      "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr",
  languagesSpeak: ["FR", "EN", "DU", "ES", "EN", "DU", "ES"],
);

final List<User> mockUsersList = [
  const User(
      username: "Yami YuGi",
      photo:
          "https://static.wikia.nocookie.net/yugioh-gx/images/3/3d/YamiYugi-DSOD.png/revision/latest?cb=20180826170223&path-prefix=fr"),
  const User(
      username: "Joey Wheeler",
      photo:
          "https://ms.yugipedia.com//thumb/1/1f/JoeyWheeler-DULI.png/188px-JoeyWheeler-DULI.png"),
  const User(
      username: "Mai Valentine",
      photo:
          "https://images.saymedia-content.com/.image/t_share/MTc0NDQ0NTQyMjg2NjM2Mzky/top-6-strongest-duelists-in-yu-gi-oh.png"),
  const User(
      username: "Tea Gardner",
      photo:
          "https://static.wikia.nocookie.net/yugioh/images/0/08/T%C3%A9a_Gardner.png/revision/latest?cb=20140520004117")
];
