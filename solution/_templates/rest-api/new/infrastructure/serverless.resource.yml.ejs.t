---
inject: true
before: RESOURCE Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    <%= h.changeCase.camel(name) %>DynamoDbTable:
      Type: 'AWS::DynamoDB::Table'
      DeletionPolicy: Retain
      Properties:
        AttributeDefinitions:
          -
            AttributeName: id
            AttributeType: S
        KeySchema:
          -
            AttributeName: id
            KeyType: HASH
        ProvisionedThroughput:
          ReadCapacityUnits: 1
          WriteCapacityUnits: 1
        TableName: ${self:provider.environment.DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>}