import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:waaa/models/Offer.dart';

final List<Offer> mockOffers = [
  Offer(
    title: "Skiing in Kolasin",
    price: 10,
    country: "France",
    city: 'Kolasin',
    hashtag: "Cultural",
    nbWinners: 10,
    image:
        "https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067_640.png",
    publicationDate: TemporalDateTime(DateTime.now()),
  ),
  Offer(
    title: "Skiing in Paris",
    price: 10,
    country: "France",
    city: 'Paris',
    hashtag: "Sport",
    nbWinners: 10,
    image:
        "https://thelandscapephotoguy.com/wp-content/uploads/2019/01/landscape%20new%20zealand%20S-shape.jpg",
    publicationDate: TemporalDateTime(DateTime.now()),
  ),
  Offer(
    title: "Visit Roma",
    price: 10,
    country: "Italy",
    city: 'Rome',
    hashtag: "Landscape",
    nbWinners: 10,
    image:
        "https://lh3.googleusercontent.com/4mVNVUybMXXJ5k-PuXHwqwBFDLUZbAuSxa7xcypndKhFZ9RPEGVcoXpU9mLQL6lGg3z3Cvp5pJFWDXwKiYDPWOH9zQ=w640-h400-e365-rj-sc0x00ffffff",
    publicationDate: TemporalDateTime(DateTime.now()),
  ),
  Offer(
    title: "Diner in Congo",
    price: 10,
    country: "Congo",
    city: 'Brazzaville',
    hashtag: "Food",
    nbWinners: 10,
    image:
        "https://www.usnews.com/object/image/00000186-7a58-d975-aff7-fffbc8910000/iguazu-falls-stock.jpg?update-time=1677089883729&size=responsive640",
    publicationDate: TemporalDateTime(DateTime.now()),
  ),
];
