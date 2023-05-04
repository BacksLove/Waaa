import 'package:waaa/features/events/domain/entities/event_entity.dart';

final List<Event> mockEventsList = [
  Event(
      name: "Fiesta de RIO",
      address: "Favelas",
      country: "Brésil",
      city: "Rio de Janeiro",
      begin: DateTime.now(),
      end: DateTime.now(),
      createdAt: DateTime.now(),
      hourBegin: 20,
      maxParticipants: 100,
      minParticipants: 5,
      isPublic: true,
      mainPhoto:
          "https://a.cdn-hotels.com/gdcs/production143/d357/42fb6908-dcd5-4edb-9f8c-76208494af80.jpg"),
  Event(
      name: "Course de Singapour",
      address: "George Street",
      country: "Singapour",
      city: "Singapour",
      begin: DateTime.now(),
      end: DateTime.now(),
      createdAt: DateTime.now(),
      hourBegin: 20,
      maxParticipants: 100,
      minParticipants: 5,
      isPublic: true,
      mainPhoto:
          "https://www.studiesup.com/images/%C3%89tudier-%C3%A0-singapour-10.jpg"),
];
