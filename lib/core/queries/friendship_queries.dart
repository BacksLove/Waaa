const getFrienshipStatusQuery = '''
query FriendOfUser(\$userId: ID!, \$friendId: ID!) {
  listFriendships(filter: {
    or: [
      { senderID: { eq: \$userId }, receiverID: { eq: \$friendId } },
      { senderID: { eq: \$friendId }, receiverID: { eq: \$userId } }
    ]
  }) {
    items {
      id
      status
      sender {
        id
        username
      }
      receiver {
        username
        id
      }
    }
  }
}
''';

const addFriendshipQuery = '''
mutation AddFriend(\$status: DemandStatus!, \$senderID: ID!, \$receiverID: ID!) {
  createFriendship(input: {receiverID: \$receiverID, status: \$status, senderID: \$senderID}) {
    id
  }
}
''';

const updateFriendshipQuery = '''
mutation UpdateFriendship(\$id: ID!, \$status: DemandStatus!) {
  updateFriendship(input: {id: \$id, status: \$status}) {
    id
  }
}
''';
