---
to: backend/config/settings/.default.yml
inject: true
before: SETTING Insertion Point
prepend: true
---
# The S3 bucket name used to upload files
uploadBucketName: ${cf:${self:custom.settings.infrastructureStackName}.UploadBucket}