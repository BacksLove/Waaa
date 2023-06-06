import 'package:waaa/models/ModelProvider.dart';

List<T> getListFromIndices<T>(List<int> indices, List<T> elements) {
  List<T> result = [];
  for (int index in indices) {
    if (index >= 0 && index < elements.length) {
      result.add(elements[index]);
    }
  }
  return result;
}

List<Event?> getEventFromUser(User user) {
  List<Event?> listEvent = [];

  if (user.events != null) {
    if (user.events!.isNotEmpty) {
      for (var eventSelect in user.events!) {
        listEvent.add(eventSelect);
      }
    }
  }
  if (user.eventCoowner != null) {
    if (user.eventCoowner!.isNotEmpty) {
      for (var eventSelect in user.eventCoowner!) {
        listEvent.add(eventSelect.event);
      }
    }
  }
  if (user.eventParticipation != null) {
    if (user.eventParticipation!.isNotEmpty) {
      for (var eventSelect in user.eventParticipation!) {
        listEvent.add(eventSelect.event);
      }
    }
  }

  return listEvent;
}

int getFollowersFromUser(User user) {
  int userFollowers = 0;
  if (user.friendsReceiver != null && user.friendsReceiver!.isNotEmpty) {
    for (var friend in user.friendsReceiver!) {
      if (friend.status == DemandStatus.ACCEPTED) userFollowers++;
    }
  }
  if (user.friendsSender != null && user.friendsSender!.isNotEmpty) {
    for (var friend in user.friendsSender!) {
      if (friend.status == DemandStatus.ACCEPTED) userFollowers++;
    }
  }
  return userFollowers;
}
