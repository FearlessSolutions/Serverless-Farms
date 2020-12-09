---
inject: true
before: ENVIRONMENT Insertion Point
prepend: true
to: serverless.yml
---
    DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>: <%= h.changeCase.upper(name) %>