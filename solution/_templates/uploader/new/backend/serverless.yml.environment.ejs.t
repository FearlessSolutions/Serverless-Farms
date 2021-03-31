---
to: backend/serverless.yml
inject: true
before: ENVIRONMENT Insertion Point
prepend: true
---
UPLOAD_BUCKET: ${self:custom.settings.uploadBucketName}