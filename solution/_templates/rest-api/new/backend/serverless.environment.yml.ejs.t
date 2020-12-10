---
inject: true
before: ENVIRONMENT Insertion Point
prepend: true
to: backend/serverless.yml
---
    DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>: ${self:custom.settings.dbTablePrefix}-<%= h.changeCase.upper(name) %>