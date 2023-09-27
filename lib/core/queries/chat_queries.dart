const conversationsListQuery = ''' ''';

const getMessagesQuery = '''
query GetMessageWithUser(\$sender: ID!, \$receiver: ID!) {
  listMessages(filter: {authorId: {eq: \$sender}, recipientId: {eq: \$receiver}}) {
    items {
      id
      content
      authorId
      recipientId
      createdAt
      recipient {
        id
        photo
        username
      }
      author {
        id
        photo
        username
      }
    }
  }
}
''';

const getMessagesQuery1 = '''
query GetMessageWithUser(\$sender: ID!, \$receiver: ID!) {
  listMessages(filter: {or: [{authorId: {eq: \$sender}, recipientId: {eq: \$receiver}}, {authorId: {eq: \$receiver}, recipientId: {eq: \$sender}}]}) {
    items {
      id
      content
      authorId
      recipientId
      createdAt
      recipient {
        id
        photo
        username
      }
      author {
        id
        photo
        username
      }
    }
  }
}
''';



// 101853a1-ebe2-431e-9752-e86e5b187a26





// // conv

// 202fb1d0-22b5-4b31-a88f-839e276a70ba

// 3b9314ff-e247-4cdc-b65f-4480bf881206

// eb4bec48-69aa-43d8-af52-f3e6cff2dfef



// Step 1 : check conversation dans ListUserConv 

