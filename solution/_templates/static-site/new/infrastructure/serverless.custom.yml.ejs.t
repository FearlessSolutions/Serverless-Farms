---
inject: true
before: CUSTOM Insertion Point
prepend: true
to: infrastructure/serverless.yml
---
  remover:
    buckets:
      - ${self:custom.settings.awsAccountInfo.awsAccountId}-${self:custom.settings.namespace}-artifacts
      - ${self:custom.settings.awsAccountInfo.awsAccountId}-${self:custom.settings.namespace}-website