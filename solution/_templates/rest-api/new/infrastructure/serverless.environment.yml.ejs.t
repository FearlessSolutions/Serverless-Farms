---
inject: true
before: ENVIRONMENT Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
    DYNAMODB_TABLE_<%= h.changeCase.upper(name) %>: ${self:custom.settings.dbTablePrefix}-<%= h.changeCase.upper(name) %>