---
to: backend/serverless.yml
inject: true
before: ROLE Insertion Point
prepend: true
---
    - Effect: Allow
      Action:
        - s3:GetObject
        - s3:PutObject
        - s3:ListBucket
        - s3:PostObject
        - s3:PutObjectAcl
      Resource: arn:aws:s3:::${self:custom.settings.uploadBucketName}/*