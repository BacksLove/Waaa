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
          status
          sender {
            id
            username
            photo
            cognitoUserPoolId
            
          }
          receiver {
            id
            username
            photo
            cognitoUserPoolId
          }
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
          name
          mainPhoto
          address
          city
          country
        }
      }
      friendsSender {
        items {
          id
          status
          sender {
            id
            username
            cognitoUserPoolId
            
          }
          receiver {
            id
            username
            cognitoUserPoolId
          }
        }
      }
    }
  }
}
''';

const inviteUserListQuery = '''
  query MyQuery(\$contains: String!) {
  listUsers(filter: {username: {contains: \$contains}}) {
    items {
      cognitoUserPoolId
      id
      photo
      username
    }
  }
}
''';
