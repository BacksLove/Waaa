

/**
 * @type {import('@types/aws-lambda').APIGatewayProxyHandler}
 */

const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB();
const TABLE_NAME = 'User';

exports.handler = async (event) => {
    console.log(`EVENT: ${JSON.stringify(event)}`);
    const username = event.arguments.input.username;
  
    const params = {
        TableName: TABLE_NAME,
        KeyConditionExpression: 'username = :username',
        ExpressionAttributeValues: {
        ':username': { S: username }
        },
        ProjectionExpression: 'id'
    };
    
    try {
        const data = await dynamodb.query(params).promise();
        const isUsernameTaken = data.Items.length > 0;
        return { 
            statusCode: 200,
            body: isUsernameTaken };
    } catch (error) {
        console.error(error);
        throw new Error('Error querying DynamoDB');
    }
};