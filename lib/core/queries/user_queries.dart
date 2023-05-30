const getUserByIdQuery = '''
query GetUser(\$id: String!) {
  UsersByCognitoID(cognitoUserPoolId: \$id) {
    items {
      bio
      birthday
      city
      cognitoUserPoolId
      country
      createdAt
      gender
      friendsReceiver {
        items {
          id
          receiverID
          senderID
          status
        }
      }
      id
      isConnected
      languagesSpeak
      lookingFor
      nativeLanguage
      openDiscussion
      photo
      privacy
      reporting
      role
      suspended
      suspendedUntil
      updatedAt
      username
      hobbies {
        items {
          id
          hobby {
            id
            name
          }
        }
      }
      eventCoowner {
        items {
          id
          event {
            address
            city
            id
            name
            mainPhoto
          }
        }
      }
      eventParticipation {
        items {
          event {
            id
            name
            mainPhoto
          }
          id
        }
      }
      events {
        items {
          id
          mainPhoto
          address
          city
          country
        }
      }
      friendsSender {
        items {
          id
          receiverID
          senderID
          status
        }
      }
    }
  }
}
''';
