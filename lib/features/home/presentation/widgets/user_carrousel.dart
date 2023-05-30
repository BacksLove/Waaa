import 'package:flutter/material.dart';
import 'package:waaa/features/home/presentation/pages/home_page.dart';
import 'package:waaa/models/ModelProvider.dart';

class UserListCarrousel extends StatelessWidget {
  const UserListCarrousel({
    super.key,
    required List<User?> userNear,
    required bool withName,
  })  : _userNear = userNear,
        _withName = withName;

  final List<User?> _userNear;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _userNear.length,
        itemBuilder: (BuildContext context, int index) {
          return _userNear[index] != null
              ? UserItemList(
                  user: _userNear[index],
                  isOnline: true,
                  withName: _withName,
                )
              : Container();
        },
      ),
    );
  }
}

class ParticipantCarrousel extends StatelessWidget {
  const ParticipantCarrousel({
    super.key,
    required List<EventParticipant>? paticipants,
    required bool withName,
  })  : _paticipants = paticipants,
        _withName = withName;

  final List<EventParticipant>? _paticipants;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return (_paticipants != null && _paticipants!.isNotEmpty)
        ? SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _paticipants?.length,
              itemBuilder: (BuildContext context, int index) {
                return _paticipants?[index].user != null
                    ? UserItemList(
                        user: _paticipants?[index].user,
                        isOnline: false,
                        withName: _withName,
                      )
                    : Container();
              },
            ),
          )
        : const Text("Aucun participants");
  }
}

class CoorganizerCarrousel extends StatelessWidget {
  const CoorganizerCarrousel({
    super.key,
    required List<EventCoowner>? coowners,
    required bool withName,
  })  : _coowners = coowners,
        _withName = withName;

  final List<EventCoowner>? _coowners;
  final bool _withName;

  @override
  Widget build(BuildContext context) {
    return (_coowners != null && _coowners!.isNotEmpty)
        ? SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _coowners?.length,
              itemBuilder: (BuildContext context, int index) {
                return _coowners?[index].user != null
                    ? UserItemList(
                        user: _coowners![index].user,
                        isOnline: false,
                        withName: _withName,
                      )
                    : Container();
              },
            ),
          )
        : const Text("Aucun co-organisateurs");
  }
}
