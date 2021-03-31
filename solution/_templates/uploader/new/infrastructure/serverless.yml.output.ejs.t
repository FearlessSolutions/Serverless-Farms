---
to: infrastructure/serverless.yml
inject: true
before: OUTPUT Insertion Point
prepend: true
---
    UploadBucket:
      Description: The bucket name of the upload bucket
      Value: !Ref UploadBucket