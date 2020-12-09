---
inject: true
before: ENVIRONMENT Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>: <%= h.changeCase.upper(name) %>