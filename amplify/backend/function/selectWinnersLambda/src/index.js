

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */

exports.handler = async (event, context) => {
    console.log(`EVENT: ${JSON.stringify(event)}`);
    const AWS = require('aws-sdk');
    const ddb = new AWS.DynamoDB.DocumentClient();
    
    // Extract offer ID from input event
    const offerId = event.arguments.offerId;
    
    // Retrieve the offer from the DynamoDB table
    const getOfferParams = {
      TableName: process.env.OFFER_TABLE_NAME,
      Key: {
        id: offerId
      }
    };
    const offer = await ddb.get(getOfferParams).promise();
    
    // Retrieve the participants of the offer
    const participantIds = offer.Item.participants.map(participant => participant.id);
    
    // Select x random participants
    const nbWinners = offer.Item.nbWinners;
    const shuffledParticipantIds = participantIds.sort(() => 0.5 - Math.random());
    const selectedParticipantIds = shuffledParticipantIds.slice(0, nbWinners);
    
    // Retrieve the selected participants from the DynamoDB table
    const getParticipantsParams = {
      RequestItems: {
        [process.env.USER_TABLE_NAME]: {
          Keys: selectedParticipantIds.map(id => ({ id }))
        }
      }
    };
    const participants = await ddb.batchGet(getParticipantsParams).promise();
    
    // Update the winners field of the offer in the DynamoDB table
    const updateOfferParams = {
      TableName: process.env.OFFER_TABLE_NAME,
      Key: {
        id: offerId
      },
      UpdateExpression: "SET winners = :winners",
      ExpressionAttributeValues: {
        ":winners": participants.Responses[process.env.USER_TABLE_NAME]
      }
    };
    await ddb.update(updateOfferParams).promise();
    
    return participants.Responses[process.env.USER_TABLE_NAME];
    //return {
    //    statusCode: 200,
    //  Uncomment below to enable CORS requests
    //  headers: {
    //      "Access-Control-Allow-Origin": "*",
    //      "Access-Control-Allow-Headers": "*"
    //  }, 
    //    body: JSON.stringify('Hello from Lambda!'),
    //};
  };
  