const waaaEventsQuery = ''' 
query listEvents {
listEvents {
    items {
      name
      id
      eventTopicEventsId
      eventTopicId
      participants {
        items {
          id
          user {
            username
            cognitoUserPoolId
            id
            photo
          }
        }
      }
      address
      audience
      begin
      city
      country
      createdAt
      description
      end
      hourBegin
      hourEnd
      isPublic
      mainPhoto
      maxParticipants
      minAgeRestriction
      nbShare
      coowner {
        items {
          id
          user {
            cognitoUserPoolId
            photo
            username
            id
          }
        }
      }
      owner {
        cognitoUserPoolId
        id
      }
      topic {
        name
        id
      }
      updatedAt
      userEventsId
    }
  } 
}''';

const eventByIdQuery = ''' 
query GetEventById(\$id: ID!) {
  getEvent(id: \$id) {
    id
    address
    audience
    begin
    city
    country
    createdAt
    description
    end
    eventTopicEventsId
    eventTopicId
    hourBegin
    hourEnd
    isPublic
    mainPhoto
    maxParticipants
    minAgeRestriction
    name
    nbShare
    photos
    updatedAt
    userEventsId
    owner {
      username
      id
      cognitoUserPoolId
    }
    participants {
      items {
        id
        user {
          id
          cognitoUserPoolId
          photo
          username
          isConnected
        }
      }
    }
    topic {
      id
      name
    }
    coowner {
      items {
        id
        user {
          id
          cognitoUserPoolId
          isConnected
          photo
          username
        }
      }
    }
  }
}
''';
