---
to: backend/models/<%= h.changeCase.lower(name) %>.py
---
import decimal
import json
import os
import time
import uuid

import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>'])


def create(event, context):
    data = json.loads(event['body'])
    # VALIDATE INPUTS
    timestamp = str(time.time())

    # CREATE OBJECT FOR INSERTION
    item = {
        'id': str(uuid.uuid1()),
        'data': data,
        'checked': False,
        'createdAt': timestamp,
        'updatedAt': timestamp,
    }

    # write the todo to the database
    table.put_item(Item=item)

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(item)
    }

    return response


def list(event, context):
    # fetch all todos from the database
    result = table.scan()

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(result['Items'], cls=DecimalEncoder)
    }

    return response


def get(event, context):
    # fetch from the database
    result = table.get_item(
        Key={
            'id': event['pathParameters']['id']
        }
    )

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(result['Item'],
                           cls=DecimalEncoder)
    }

    return response


def update(event, context):
    data = json.loads(event['body'])
    print(data)
    timestamp = int(time.time() * 1000)
    print(timestamp)
    # update the database
    result = table.update_item(
        Key={
            'id': event['pathParameters']['id']
        },
        ExpressionAttributeNames={
            '#todo_data': 'data',
        },
        ExpressionAttributeValues={
          ':data': data,
          ':updatedAt': timestamp,
        },
        UpdateExpression='SET #todo_data = :data, '
                         'updatedAt = :updatedAt',
        ReturnValues='ALL_NEW',
    )

    # create a response
    response = {
        "statusCode": 200,
        "body": json.dumps(result['Attributes'],
                           cls=DecimalEncoder)
    }

    return response


def delete(event, context):
    table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

    # delete the todo from the database
    table.delete_item(
        Key={
            'id': event['pathParameters']['id']
        }
    )

    # create a response
    response = {
        "statusCode": 200
    }

    return response


# This is a workaround for: http://bugs.python.org/issue16535
class DecimalEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, decimal.Decimal):
            return int(obj)
        return super(DecimalEncoder, self).default(obj)